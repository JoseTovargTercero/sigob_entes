<?php



header('Content-Type: application/json');
// require_once '../../back/modulo_entes/pre_compromisos.php';

class SolicitudesController
{
    public function __construct($conexion)
    {
        $this->conexion = $conexion;
    }

    private $conexion;

   // Función para consultar todas las solicitudes
public function consultarSolicitudes($data)
{
    if (!isset($data['id_ejercicio'])) {
        return ["error" => "No se ha especificado el ID del ejercicio."];
    }

    $idEjercicio = $data['id_ejercicio'];

    try {
        // Consulta principal con detalles básicos de solicitud_dozavos
        $sql = "SELECT s.id, s.numero_orden, s.numero_compromiso, s.descripcion, s.monto, 
                       s.fecha, s.partidas, s.tipo, s.mes, s.status, s.id_ejercicio,
                       e.ente_nombre, e.tipo_ente
                FROM solicitud_dozavos s
                JOIN entes e ON s.id_ente = e.id
                WHERE s.id_ejercicio = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("i", $idEjercicio);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $solicitudes = [];

            while ($row = $result->fetch_assoc()) {
                // Verificar si numero_compromiso es 0 y establecerlo como null
                $row['numero_compromiso'] = ($row['numero_compromiso'] == 0) ? null : $row['numero_compromiso'];

                // Procesar las partidas asociadas
                $partidasArray = json_decode($row['partidas'], true);

                foreach ($partidasArray as &$partida) {
                    $idDistribucion = $partida['id'];

                    // Consulta consolidada para obtener datos de partidas_presupuestarias
                    $sqlPartida = "SELECT p.partida, p.nombre, p.descripcion 
                                   FROM distribucion_presupuestaria dp
                                   JOIN partidas_presupuestarias p ON dp.id_partida = p.id
                                   WHERE dp.id = ?";
                    $stmtPartida = $this->conexion->prepare($sqlPartida);
                    $stmtPartida->bind_param("i", $idDistribucion);
                    $stmtPartida->execute();
                    $stmtPartida->bind_result($partidaCod, $nombre, $descripcion);
                    $stmtPartida->fetch();
                    $stmtPartida->close();

                    // Agregar datos a la partida
                    $partida['partida'] = $partidaCod;
                    $partida['nombre'] = $nombre;
                    $partida['descripcion'] = $descripcion;
                }

                // Agregar las partidas procesadas al registro
                $row['partidas'] = $partidasArray;

                // Añadir la solicitud completa a la lista de solicitudes
                $solicitudes[] = $row;
            }

            return ["success" => $solicitudes];
        } else {
            return ["success" => "No se encontraron registros en solicitud_dozavos."];
        }
    } catch (Exception $e) {
        return ["error" => "Error: " . $e->getMessage()];
    }
}


    // Función para consultar una solicitud por ID
    public function consultarSolicitudPorId($data)
    {
        if (!isset($data['id']) || !isset($data['id_ejercicio'])) {
            return ["error" => "No se ha especificado ID o ID del ejercicio para la consulta."];
        }

        $id = $data['id'];
        $idEjercicio = $data['id_ejercicio'];
        $idEnte = $data["id_ente"];

        // Consultar la solicitud principal
        $sql = "SELECT id, numero_orden, numero_compromiso, descripcion, monto, fecha, partidas, id_ente, tipo, mes, status, id_ejercicio 
                FROM solicitud_dozavos 
                WHERE id = ? AND id_ente = ? AND id_ejercicio = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("iii", $id, $idEnte, $idEjercicio);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();

            // Verificar y ajustar el valor de numero_compromiso
            $row['numero_compromiso'] = ($row['numero_compromiso'] == 0) ? null : $row['numero_compromiso'];

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
            $sqlEnte = "SELECT * FROM entes WHERE id = ?";
            $stmtEnte = $this->conexion->prepare($sqlEnte);
            $stmtEnte->bind_param("i", $idEnte);
            $stmtEnte->execute();
            $resultEnte = $stmtEnte->get_result();
            $dataEnte = $resultEnte->fetch_assoc();
            $stmtEnte->close();

            // Agregar la información del ente como un ítem más
            $row['ente'] = $dataEnte ?: null; // Si no se encuentra, se asigna como null

            return ["success" => $row];
        } else {
            return ["error" => "No se encontró el registro con el ID especificado o el ejercicio no coincide."];
        }
    }

    // Función para consultar las solicitudes por mes
    public function consultarSolicitudPorMes($data)
    {
        if (!isset($data['id_ejercicio'])) {
            return ["error" => "No se ha especificado el ID del ejercicio para la consulta."];
        }

        $idEjercicio = $data['id_ejercicio'];
        $idEnte = $data["id_ente"] ?? null;

        if (!$idEnte) {
            return ["error" => "El ID del ente no está definido en la sesión."];
        }

        $mesActual = date("n") - 1;

        try {
            // Consultar las solicitudes principales
            $sql = "SELECT id, numero_orden, numero_compromiso, descripcion, monto, fecha, partidas, id_ente, tipo, mes, status, id_ejercicio 
                    FROM solicitud_dozavos 
                    WHERE id_ente = ? AND id_ejercicio = ? AND mes = ?";
            $stmt = $this->conexion->prepare($sql);
            $stmt->bind_param("iii", $idEnte, $idEjercicio, $mesActual);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $rows = [];

                while ($row = $result->fetch_assoc()) {
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
                    $rows[] = $row;
                }

                return ["success" => $rows];
            } else {
                return ["success" => null];
            }
        } catch (Exception $e) {
            return ["error" => "Error: " . $e->getMessage()];
        }
    }

    // Función para registrar una solicitud
    public function registrarSolicitudozavo($data)
    {
        try {
            if (!isset($data['descripcion']) || !isset($data['monto']) || !isset($data['tipo']) || !isset($data['partidas']) || !isset($data['id_ente']) || !isset($data['id_ejercicio']) || !isset($data['mes'])) {
                return json_encode(["error" => "Faltan datos obligatorios para registrar la solicitud."]);
            }

            // Iniciar una transacción
            $this->conexion->begin_transaction();

            $mesActual = (date("n") - 1); // Mes actual (0-11)
            $mesSolicitado = $data['mes']; // Mes solicitado (0-11)
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

            // Calcular el mes siguiente correctamente
            $mesSiguiente = ($mesActual + 1) % 12;

            // Condiciones para permitir el registro
            if ($mesSolicitado == $mesActual && !$existeMesActual) {
                // Permitido registrar para el mes en curso si aún no existe
            } elseif ($mesSolicitado == $mesSiguiente && $existeMesActual) {
                // Permitido registrar para el siguiente mes si el mes actual ya existe
            } else {
                $this->conexion->rollback();
                return json_encode(["error" => "No se puede registrar la solicitud. Condiciones no cumplidas."]);
            }

            // Generar el numero_orden automáticamente
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
            registrarError($e->getMessage());
            return json_encode(["error" => $e->getMessage()]);
        }
    }

    // Función para generar el número de orden
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
    function gestionarSolicitudDozavos2($idSolicitud, $accion, $codigo)
    {
        try {
            if (empty($idSolicitud) || empty($accion)) {
                throw new Exception("Faltan uno o más valores necesarios (idSolicitud, accion)");
            }

            // Iniciar la transacción
            $this->conexion->begin_transaction();

            // Consultar los detalles de la solicitud, incluyendo el campo partidas
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
            $numero_compromiso = $filaSolicitud['numero_compromiso'];
            $descripcion = $filaSolicitud['descripcion'];
            $tipo = $filaSolicitud['tipo'];
            $montoTotal = $filaSolicitud['monto'];
            $status = $filaSolicitud['status'];
            $id_ejercicio = $filaSolicitud['id_ejercicio'];
            $id_ente = $filaSolicitud['id_ente'];

            // Decodificar el campo `partidas` como un array
            $partidas = json_decode($filaSolicitud['partidas'], true);

            if ($status !== 1) {
                throw new Exception("La solicitud ya ha sido procesada anteriormente");
            }

            if ($accion === "aceptar") {
                // Iterar sobre cada array de partidas
                foreach ($partidas as $partida) {
                    $id_distribucion = $partida['id'];
                    $monto = $partida['monto'];

                    // Consultar el monto de distribución desde distribucion_entes
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

                    // Obtener la fila de resultados
                    $filaMontoDistribucion = $resultadoMontoDistribucion->fetch_assoc();

                    // Decodificar el campo JSON
                    $distribuciones = json_decode($filaMontoDistribucion['distribucion'], true);

                    // Buscar el monto correspondiente al id_distribucion
                    $montoDistribucion = null;
                    foreach ($distribuciones as &$distribucion) {
                        if ($distribucion['id_distribucion'] == $id_distribucion) {
                            $montoDistribucion = (float) $distribucion['monto'];
                            $nuevoMontoActual = $montoDistribucion - $monto;
                            $distribucion['monto'] = $nuevoMontoActual;  // Actualizar el monto
                            break;
                        }
                    }

                    // Verificar si se encontró el monto
                    if ($montoDistribucion === null) {
                        throw new Exception("No se encontró el monto para el ID de distribución especificado.");
                    }

                    // Verificar si hay suficiente presupuesto disponible
                    if ($montoDistribucion < $monto) {
                        throw new Exception("El presupuesto actual en distribucion_entes es insuficiente para el monto de la partida");
                    }

                    // Volver a codificar el array a formato JSON
                    $nuevaDistribucion = json_encode($distribuciones);

                    // Actualizar el monto en distribucion_entes
                    $sqlUpdatePartida = "UPDATE distribucion_entes SET distribucion = ? WHERE id_ente = ? AND id_ejercicio = ? AND distribucion LIKE '%\"id_distribucion\":\"$id_distribucion\"%'";
                    $stmtUpdatePartida = $this->conexion->prepare($sqlUpdatePartida);
                    $stmtUpdatePartida->bind_param("sii", $nuevaDistribucion, $id_ente, $id_ejercicio);
                    $stmtUpdatePartida->execute();

                    if ($stmtUpdatePartida->affected_rows === 0) {
                        throw new Exception("No se pudo actualizar el monto de distribución para el ID de distribución proporcionado");
                    }
                }

                // Actualizar el estado de la solicitud a aceptado
                $sqlUpdateSolicitud = "UPDATE solicitud_dozavos SET status = 0 WHERE id = ?";
                $stmtUpdateSolicitud = $this->conexion->prepare($sqlUpdateSolicitud);
                $stmtUpdateSolicitud->bind_param("i", $idSolicitud);
                $stmtUpdateSolicitud->execute();

                if ($stmtUpdateSolicitud->affected_rows > 0) {
                    $resultadoCompromiso = registrarCompromiso($idSolicitud, 'solicitud_dozavos', $descripcion, $id_ejercicio, $codigo);
                    if (isset($resultadoCompromiso['success']) && $resultadoCompromiso['success']) {
                        // Confirmar la transacción
                        $this->conexion->commit();

                        return json_encode([
                            "success" => "La solicitud ha sido aceptada, el compromiso se ha registrado y el presupuesto actualizado",
                            "compromiso" => [
                                "correlativo" => $resultadoCompromiso['correlativo'],
                                "id_compromiso" => $resultadoCompromiso['id_compromiso']
                            ]
                        ]);
                    } else {
                        throw new Exception("No se pudo registrar el compromiso");
                    }
                } else {
                    throw new Exception("No se pudo actualizar la solicitud a aceptada");
                }
            } elseif ($accion === "rechazar") {
                // Actualizar el estado de la solicitud a rechazado
                $sqlUpdateSolicitud = "UPDATE solicitud_dozavos SET status = 3 WHERE id = ?";
                $stmtUpdateSolicitud = $this->conexion->prepare($sqlUpdateSolicitud);
                $stmtUpdateSolicitud->bind_param("i", $idSolicitud);
                $stmtUpdateSolicitud->execute();

                if ($stmtUpdateSolicitud->affected_rows > 0) {
                    // Confirmar la transacción
                    $this->conexion->commit();

                    return json_encode(["success" => "La solicitud ha sido rechazada"]);
                } else {
                    throw new Exception("No se pudo rechazar la solicitud");
                }
            } else {
                throw new Exception("Acción no válida. Debe ser 'aceptar' o 'rechazar'.");
            }
        } catch (Exception $e) {
            // Si ocurre algún error, deshacer todas las operaciones anteriores
            $this->conexion->rollback();
            registrarError($e->getMessage());
            return json_encode(['error' => $e->getMessage()]);
        }
    }

    function actualizarSolicitudozavo($data)
    {
        if (!isset($data['id'], $data['numero_orden'], $data['numero_compromiso'], $data['descripcion'], $data['monto'], $data['fecha'], $data['partidas'], $data['id_ente'], $data['status'], $data['id_ejercicio'], $data['mes'])) {
            return json_encode(["error" => "Faltan datos o el ID para actualizar la solicitud."]);
        }

        $sql = "UPDATE solicitud_dozavos SET numero_orden = ?, numero_compromiso = ?, descripcion = ?, monto = ?, fecha = ?, partidas = ?, id_ente = ?, status = ?, id_ejercicio = ?, mes = ? WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("issdsssisss", $data['numero_orden'], $data['numero_compromiso'], $data['descripcion'], $data['monto'], $data['fecha'], json_encode($data['partidas']), $data['id_ente'], $data['status'], $data['id_ejercicio'], $data['mes'], $data['id']);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            return json_encode(["success" => "Solicitud actualizada con éxito."]);
        } else {
            return json_encode(["error" => "No se pudo actualizar la solicitud."]);
        }
    }

    function rechazarSolicitud($data)
    {
        if (!isset($data['id'])) {
            return json_encode(["error" => "No se ha especificado ID para rechazar la solicitud."]);
        }

        $sql = "DELETE FROM solicitud_dozavos WHERE id = ?";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bind_param("i", $data['id']);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            notificar(['nomina'], 11);
            return json_encode(["success" => "La solicitud ha sido rechazada"]);
        } else {
            return json_encode(["error" => "No se pudo rechazar la solicitud"]);
        }
    }
    // Función para eliminar una solicitud y su compromiso relacionado
    function eliminarSolicitudozavo($data)
    {
        if (!isset($data['id'])) {
            return json_encode(["error" => "No se ha especificado ID para eliminar."]);
        }

        $idSolicitud = $data['id'];

        try {
            // Iniciar la transacción
            $this->conexion->begin_transaction();

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
                // Confirmar la transacción
                $this->conexion->commit();
                return json_encode(["success" => "Solicitud y compromiso eliminados con éxito."]);
            } else {
                // Si no se pudo eliminar la solicitud
                throw new Exception("No se pudo eliminar la solicitud o el compromiso.");
            }
        } catch (Exception $e) {
            // Si ocurre algún error, deshacer todas las operaciones anteriores
            $this->conexion->rollback();
            return json_encode(["error" => $e->getMessage()]);
        }
    }
}





?>