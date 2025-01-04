<?php



header('Content-Type: application/json');
// require_once '../../back/modulo_entes/pre_compromisos.php';

class SolicitudDozavos
{
    private $conexion;

    public function __construct($conexion)
    {
        $this->conexion = $conexion;
    }

    // Función para consultar todas las solicitudes
    public function consultarSolicitudes($data)
    {
        $sql = "SELECT id, numero_orden, numero_compromiso, descripcion, monto, fecha, partidas, id_ente, tipo, mes, status, id_ejercicio FROM solicitud_dozavos";
        $result = $this->conexion->query($sql);

        if ($result->num_rows > 0) {
            $solicitudes = [];

            while ($row = $result->fetch_assoc()) {
                // Validar el valor de numero_compromiso
                if ($row['numero_compromiso'] == 0) {
                    $row['numero_compromiso'] = null;
                }

                // Procesar las partidas asociadas
                $partidasArray = json_decode($row['partidas'], true);

                foreach ($partidasArray as &$partida) {
                    $idDistribucion = $partida['id'];
                    $sqlPartida = "SELECT id_partida FROM distribucion_presupuestaria WHERE id = ?";
                    $stmtPartida = $this->conexion->prepare($sqlPartida);
                    $stmtPartida->bind_param("i", $idDistribucion);
                    $stmtPartida->execute();
                    $stmtPartida->bind_result($id_partida2);
                    $stmtPartida->fetch();
                    $stmtPartida->close();

                    $id_partida = $id_partida2;

                    $sqlPartida = "SELECT partida, nombre, descripcion FROM partidas_presupuestarias WHERE id = ?";
                    $stmtPartida = $this->conexion->prepare($sqlPartida);
                    $stmtPartida->bind_param("i", $id_partida);
                    $stmtPartida->execute();
                    $stmtPartida->bind_result($partidaCod, $nombre, $descripcion);
                    $stmtPartida->fetch();
                    $stmtPartida->close();

                    $partida['partida'] = $partidaCod;
                    $partida['nombre'] = $nombre;
                    $partida['descripcion'] = $descripcion;
                }

                // Agregar las partidas procesadas al registro
                $row['partidas'] = $partidasArray;

                // Consultar la información del ente asociado
                $idEnte = $row['id_ente'];
                $sqlEnte = "SELECT * FROM entes WHERE id = ?";
                $stmtEnte = $this->conexion->prepare($sqlEnte);
                $stmtEnte->bind_param("i", $idEnte);
                $stmtEnte->execute();
                $resultEnte = $stmtEnte->get_result();
                $dataEnte = $resultEnte->fetch_assoc();
                $stmtEnte->close();

                // Agregar la información del ente como un ítem más
                if ($dataEnte) {
                    $row['ente'] = $dataEnte;
                } else {
                    $row['ente'] = null; // Si no se encuentra, se asigna como null
                }

                // Añadir la solicitud completa a la lista de solicitudes
                $solicitudes[] = $row;
            }

            return json_encode(["success" => $solicitudes]);
        } else {
            return json_encode(["success" => "No se encontraron registros en solicitud_dozavos."]);
        }
    }

    // Función para consultar una solicitud por ID
    public function consultarSolicitudPorId($data)
    {
        if (!isset($data['id'])) {
            return json_encode(["error" => "No se ha especificado ID para consulta."]);
        }

        $id = $data['id'];

        // Consultar la solicitud principal
        $sql = "SELECT id, numero_orden, numero_compromiso, descripcion, monto, fecha, partidas, id_ente, tipo, mes, status, id_ejercicio FROM solicitud_dozavos WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            // Validar el valor de numero_compromiso
            if ($row['numero_compromiso'] == 0) {
                $row['numero_compromiso'] = null;
            }

            // Procesar las partidas asociadas
            $partidasArray = json_decode($row['partidas'], true);

            foreach ($partidasArray as &$partida) {
                $idDistribucion = $partida['id'];

                // Obtener el id_partida desde distribucion_presupuestaria
                $sqlPartida = "SELECT id_partida FROM distribucion_presupuestaria WHERE id = ?";
                $stmtPartida = $this->conexion->prepare($sqlPartida);
                $stmtPartida->bind_param("i", $idDistribucion);
                $stmtPartida->execute();
                $stmtPartida->bind_result($id_partida2);
                $stmtPartida->fetch();
                $stmtPartida->close();

                $id_partida = $id_partida2;

                // Obtener información de la partida presupuestaria
                $sqlPartida = "SELECT partida, nombre, descripcion FROM partidas_presupuestarias WHERE id = ?";
                $stmtPartida = $this->conexion->prepare($sqlPartida);
                $stmtPartida->bind_param("i", $id_partida);
                $stmtPartida->execute();
                $stmtPartida->bind_result($partidaCod, $nombre, $descripcion);
                $stmtPartida->fetch();
                $stmtPartida->close();

                $partida['partida'] = $partidaCod;
                $partida['nombre'] = $nombre;
                $partida['descripcion'] = $descripcion;
            }

            // Agregar las partidas procesadas
            $row['partidas'] = $partidasArray;

            // Consultar la información del ente asociado
            $idEnte = $row['id_ente'];
            $sqlEnte = "SELECT * FROM entes WHERE id = ?";
            $stmtEnte = $this->conexion->prepare($sqlEnte);
            $stmtEnte->bind_param("i", $idEnte);
            $stmtEnte->execute();
            $resultEnte = $stmtEnte->get_result();
            $dataEnte = $resultEnte->fetch_assoc();
            $stmtEnte->close();

            // Agregar la información del ente como un ítem más
            $row['ente'] = $dataEnte ?: null; // Si no se encuentra, se asigna como null

            return json_encode(["success" => $row]);
        } else {
            return json_encode(["error" => "No se encontró el registro con el ID especificado."]);
        }
    }



     public function registrarSolicitudozavo($data)
    {
        try {
            // Validar datos obligatorios
            $campos_obligatorios = ['descripcion', 'monto', 'tipo', 'partidas', 'id_ente', 'id_ejercicio', 'mes'];
            foreach ($campos_obligatorios as $campo) {
                if (!isset($data[$campo])) {
                    return json_encode(["error" => "Faltan datos obligatorios para registrar la solicitud."]);
                }
            }

            // Iniciar transacción
            $this->conexion->begin_transaction();

            $mesActual = date("n") - 1; // Mes actual (0-11)
            $mesSolicitado = $data['mes'];
            $idEnte = $data['id_ente'];
            $idEjercicio = $data['id_ejercicio'];

            // Verificar si ya existe una solicitud pendiente (status = 1)
            $sqlPendiente = "SELECT COUNT(*) AS total FROM solicitud_dozavos WHERE id_ente = ? AND status = 1 AND id_ejercicio = ?";
            $stmtPendiente = $this->conexion->prepare($sqlPendiente);
            $stmtPendiente->bind_param("ii", $idEnte, $idEjercicio);
            $stmtPendiente->execute();
            $resultadoPendiente = $stmtPendiente->get_result();
            $filaPendiente = $resultadoPendiente->fetch_assoc();

            if ($filaPendiente['total'] > 0) {
                $this->conexion->rollback();
                return json_encode(["error" => "No se puede registrar la solicitud porque hay una pendiente."]);
            }

            // Verificar la existencia de solicitudes para el mes actual
            $sqlMesActual = "SELECT COUNT(*) AS total FROM solicitud_dozavos WHERE id_ente = ? AND mes = ? AND id_ejercicio = ? AND status != '3'";
            $stmtMesActual = $this->conexion->prepare($sqlMesActual);
            $stmtMesActual->bind_param("iii", $idEnte, $mesActual, $idEjercicio);
            $stmtMesActual->execute();
            $resultadoMesActual = $stmtMesActual->get_result();
            $filaMesActual = $resultadoMesActual->fetch_assoc();
            $existeMesActual = $filaMesActual['total'] > 0;

            // Condiciones para permitir el registro
            if ($mesSolicitado == $mesActual && !$existeMesActual) {
                // Permitido registrar para el mes en curso si aún no existe
            } elseif ($mesSolicitado == ($mesActual + 1) && $existeMesActual) {
                // Permitido registrar para el siguiente mes si el mes actual ya existe
            } else {
                $this->conexion->rollback();
                return json_encode(["error" => "No se puede registrar la solicitud. Condiciones no cumplidas."]);
            }

            // Generar el número de orden automáticamente
            $numero_orden = $this->generarNumeroOrden();
            $fecha = date("Y-m-d");

            // Insertar en solicitud_dozavos (numero_compromiso siempre será 0 inicialmente)
            $sqlInsertar = "INSERT INTO solicitud_dozavos (numero_orden, numero_compromiso, descripcion, tipo, monto, fecha, partidas, id_ente, status, id_ejercicio, mes) VALUES (?, 0, ?, ?, ?, ?, ?, ?, 1, ?, ?)";
            $stmtInsertar = $this->conexion->prepare($sqlInsertar);
            $partidasJson = json_encode($data['partidas']); // Convertir partidas a formato JSON
            $stmtInsertar->bind_param("sssssssss", $numero_orden, $data['descripcion'], $data['tipo'], $data['monto'], $fecha, $partidasJson, $idEnte, $idEjercicio, $mesSolicitado);
            $stmtInsertar->execute();

            if ($stmtInsertar->affected_rows > 0) {
                // Confirmar la transacción
                $this->conexion->commit();
                return json_encode(["success" => "Registro exitoso"]);
            } else {
                $this->conexion->rollback();
                return json_encode(["error" => "No se pudo registrar la solicitud."]);
            }
        } catch (Exception $e) {
            // Revertir transacción en caso de error
            $this->conexion->rollback();
            $this->registrarError($e->getMessage());
            return json_encode(["error" => $e->getMessage()]);
        }
    }

    private function generarNumeroOrden()
    {
        $anio_actual = date('Y');
        $prefijo = "O";
        $sql = "SELECT numero_orden FROM solicitud_dozavos WHERE numero_orden LIKE ? ORDER BY numero_orden DESC LIMIT 1";
        $like_param = $prefijo . "_____-" . $anio_actual; // Busca formato Oxxxxx-YYYY
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("s", $like_param);
        $stmt->execute();
        $stmt->bind_result($ultimo_numero_orden);
        $stmt->fetch();
        $stmt->close();

        if ($ultimo_numero_orden) {
            // Extraer el número secuencial y sumarle 1
            $secuencia = (int) substr($ultimo_numero_orden, 1, 5); // Extrae los dígitos Oxxxxx
            $secuencia++;
        } else {
            $secuencia = 1; // Si no existe, comienza desde 1
        }

        // Formatear el nuevo número de orden
        $nuevo_numero_orden = sprintf("%s%05d-%s", $prefijo, $secuencia, $anio_actual);

        return $nuevo_numero_orden;
    }

    public function gestionarSolicitudDozavos2($idSolicitud, $accion, $codigo) {
        try {
            if (empty($idSolicitud) || empty($accion)) {
                throw new Exception("Faltan uno o más valores necesarios (idSolicitud, accion)");
            }

            // Iniciar la transacción
            $this->conexion->begin_transaction();

            // Consultar los detalles de la solicitud
            $sqlSolicitud = "SELECT numero_orden, numero_compromiso, descripcion, tipo, monto, id_ente, partidas, status, id_ejercicio FROM solicitud_dozavos WHERE id = ?";
            $stmtSolicitud = $this->conexion->prepare($sqlSolicitud);
            $stmtSolicitud->bind_param("i", $idSolicitud);
            $stmtSolicitud->execute();
            $resultadoSolicitud = $stmtSolicitud->get_result();

            if ($resultadoSolicitud->num_rows === 0) {
                throw new Exception("No se encontró una solicitud con el ID proporcionado");
            }

            $filaSolicitud = $resultadoSolicitud->fetch_assoc();
            $numero_orden = $filaSolicitud['numero_orden'];
            $descripcion = $filaSolicitud['descripcion'];
            $montoTotal = $filaSolicitud['monto'];
            $id_ente = $filaSolicitud['id_ente'];
            $status = $filaSolicitud['status'];
            $id_ejercicio = $filaSolicitud['id_ejercicio'];
            $partidas = json_decode($filaSolicitud['partidas'], true);

            if ($status !== 1) {
                throw new Exception("La solicitud ya ha sido procesada anteriormente");
            }

            if ($accion === "aceptar") {
                foreach ($partidas as $partida) {
                    $id_distribucion = $partida['id'];
                    $monto = $partida['monto'];

                    $sqlMontoDistribucion = "SELECT distribucion 
                                             FROM distribucion_entes 
                                             WHERE id_ente = ? AND id_ejercicio = ? AND distribucion LIKE '%\"id_distribucion\":\"$id_distribucion\"%'";
                    $stmtMontoDistribucion = $this->conexion->prepare($sqlMontoDistribucion);
                    $stmtMontoDistribucion->bind_param("ii", $id_ente, $id_ejercicio);
                    $stmtMontoDistribucion->execute();
                    $resultadoMontoDistribucion = $stmtMontoDistribucion->get_result();

                    if ($resultadoMontoDistribucion->num_rows === 0) {
                        throw new Exception("El ID de distribución no se encuentra en el campo 'distribucion' de distribucion_entes");
                    }

                    $filaMontoDistribucion = $resultadoMontoDistribucion->fetch_assoc();
                    $distribuciones = json_decode($filaMontoDistribucion['distribucion'], true);

                    $montoDistribucion = null;
                    foreach ($distribuciones as &$distribucion) {
                        if ($distribucion['id_distribucion'] == $id_distribucion) {
                            $montoDistribucion = (float)$distribucion['monto'];
                            $distribucion['monto'] -= $monto;
                            break;
                        }
                    }

                    if ($montoDistribucion === null || $montoDistribucion < $monto) {
                        throw new Exception("Presupuesto insuficiente para la partida con ID $id_distribucion");
                    }

                    $nuevaDistribucion = json_encode($distribuciones);
                    $sqlUpdatePartida = "UPDATE distribucion_entes SET distribucion = ? WHERE id_ente = ? AND id_ejercicio = ? AND distribucion LIKE '%\"id_distribucion\":\"$id_distribucion\"%'";
                    $stmtUpdatePartida = $this->conexion->prepare($sqlUpdatePartida);
                    $stmtUpdatePartida->bind_param("sii", $nuevaDistribucion, $id_ente, $id_ejercicio);
                    $stmtUpdatePartida->execute();

                    if ($stmtUpdatePartida->affected_rows === 0) {
                        throw new Exception("No se pudo actualizar la distribución de la partida con ID $id_distribucion");
                    }
                }

                $sqlUpdateSolicitud = "UPDATE solicitud_dozavos SET status = 0 WHERE id = ?";
                $stmtUpdateSolicitud = $this->conexion->prepare($sqlUpdateSolicitud);
                $stmtUpdateSolicitud->bind_param("i", $idSolicitud);
                $stmtUpdateSolicitud->execute();

                if ($stmtUpdateSolicitud->affected_rows > 0) {
                    $this->conexion->commit();
                    return json_encode(["success" => "Solicitud aceptada y presupuesto actualizado."]);
                } else {
                    throw new Exception("No se pudo actualizar el estado de la solicitud.");
                }
            } elseif ($accion === "rechazar") {
                $sqlUpdateSolicitud = "UPDATE solicitud_dozavos SET status = 3 WHERE id = ?";
                $stmtUpdateSolicitud = $this->conexion->prepare($sqlUpdateSolicitud);
                $stmtUpdateSolicitud->bind_param("i", $idSolicitud);
                $stmtUpdateSolicitud->execute();

                if ($stmtUpdateSolicitud->affected_rows > 0) {
                    $this->conexion->commit();
                    return json_encode(["success" => "Solicitud rechazada."]);
                } else {
                    throw new Exception("No se pudo rechazar la solicitud.");
                }
            } else {
                throw new Exception("Acción no válida. Debe ser 'aceptar' o 'rechazar'.");
            }
        } catch (Exception $e) {
            $this->conexion->rollback();
            return json_encode(['error' => $e->getMessage()]);
        }
    }

    public function actualizarSolicitudozavo($data) {
        if (!isset($data['id'], $data['numero_orden'], $data['descripcion'], $data['monto'], $data['fecha'], $data['partidas'], $data['id_ente'], $data['status'], $data['id_ejercicio'], $data['mes'])) {
            return json_encode(["error" => "Faltan datos para actualizar la solicitud."]);
        }

        $sql = "UPDATE solicitud_dozavos SET numero_orden = ?, descripcion = ?, monto = ?, fecha = ?, partidas = ?, id_ente = ?, status = ?, id_ejercicio = ?, mes = ? WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("ssdsssissi", $data['numero_orden'], $data['descripcion'], $data['monto'], $data['fecha'], json_encode($data['partidas']), $data['id_ente'], $data['status'], $data['id_ejercicio'], $data['mes'], $data['id']);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            return json_encode(["success" => "Solicitud actualizada con éxito."]);
        } else {
            return json_encode(["error" => "No se pudo actualizar la solicitud."]);
        }
    }


        public function rechazarSolicitud($data)
    {
        if (!isset($data['id'])) {
            return json_encode(["error" => "No se ha especificado ID para rechazar la solicitud."]);
        }

        $sql = "DELETE FROM solicitud_dozavos WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("i", $data['id']);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            $this->notificar(['nomina'], 11); // Supongo que notificar() es otro método de esta clase
            return json_encode(["success" => "Solicitud rechazada y eliminada con éxito."]);
        } else {
            return json_encode(["error" => "No se pudo rechazar la solicitud."]);
        }
    }

    /**
     * Eliminar una solicitud y su compromiso relacionado
     *
     * @param array $data Datos que contienen el ID de la solicitud
     * @return string JSON con el resultado de la operación
     */
    public function eliminarSolicitudozavo($data)
    {
        if (!isset($data['id'])) {
            return json_encode(["error" => "No se ha especificado ID para eliminar."]);
        }

        $idSolicitud = $data['id'];

        // Eliminar el compromiso relacionado
        $sqlCompromiso = "DELETE FROM compromisos WHERE id_registro = ?";
        $stmtCompromiso = $this->conexion->prepare($sqlCompromiso);
        $stmtCompromiso->bind_param("i", $idSolicitud);
        $stmtCompromiso->execute();

        // Eliminar la solicitud
        $sqlSolicitud = "DELETE FROM solicitud_dozavos WHERE id = ?";
        $stmtSolicitud = $this->conexion->prepare($sqlSolicitud);
        $stmtSolicitud->bind_param("i", $idSolicitud);
        $stmtSolicitud->execute();

        if ($stmtSolicitud->affected_rows > 0) {
            return json_encode(["success" => "Solicitud y compromiso eliminados con éxito."]);
        } else {
            return json_encode(["error" => "No se pudo eliminar la solicitud o el compromiso."]);
        }
    }
}





?>