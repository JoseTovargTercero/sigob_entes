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
    try {
        // Validar si se especifica el ID del ejercicio
        $whereClause = "";
        if (isset($data['id_ejercicio'])) {
            $idEjercicio = $data['id_ejercicio'];
            $whereClause = " WHERE s.id_ejercicio = ?";
        }

        // Consulta principal con detalles básicos de solicitud_dozavos
        $sql = "SELECT s.id, s.numero_orden, s.numero_compromiso, s.descripcion, s.monto, 
                       s.fecha, s.partidas, s.tipo, s.mes, s.status, s.id_ejercicio,
                       e.ente_nombre, e.tipo_ente
                FROM solicitud_dozavos s
                JOIN entes e ON s.id_ente = e.id" . $whereClause;

        $stmt = $this->conexion->prepare($sql);

        // Si hay filtro por id_ejercicio, enlazar parámetro
        if ($whereClause) {
            $stmt->bind_param("i", $idEjercicio);
        }

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


    public function registrarError($descripcion)
    {

        try {
            $fechaHora = date('Y-m-d H:i:s');
            $sql = "INSERT INTO error_log (descripcion, fecha) VALUES (?, ?)";

            // Verificar si la consulta SQL se prepara correctamente
            if ($stmt = $this->conexion->prepare($sql)) {
                $stmt->bind_param("ss", $descripcion, $fechaHora);
                $stmt->execute();
                $stmt->close();
            } else {
                // Mostrar el error si la preparación falla
                echo "Error en la consulta SQL: " . $this->conexion->error;
            }
        } catch (Exception $e) {
            // Manejo de error si el registro de errores falla
            echo "Error al registrar el error: " . $e->getMessage();
        }
    }

    public function registrarCompromiso($idRegistro, $nombreTabla, $descripcion, $id_ejercicio, $codigo)
    {


        try {
            // Validar que los campos obligatorios no estén vacíos
            if (!isset($idRegistro) || !isset($nombreTabla) || !isset($descripcion) || !isset($id_ejercicio) || !isset($codigo)) {
                return ["error" => "Faltan datos obligatorios para registrar el compromiso."];
            }

            // Obtener el año actual
            $yearActual = date("Y");

            // Buscar el último correlativo con el formato 'C-%-YYYY'
            $sql = "SELECT correlativo FROM compromisos WHERE correlativo LIKE ? ORDER BY correlativo DESC LIMIT 1";
            $correlativoLike = "C%-$yearActual";
            $stmt = $this->conexion->prepare($sql);
            $stmt->bind_param("s", $correlativoLike);
            $stmt->execute();
            $stmt->bind_result($ultimoCorrelativo);
            $stmt->fetch();
            $stmt->close();

            // Incrementar el número de seguimiento
            if ($ultimoCorrelativo) {
                $numeroSeguimiento = (int) substr($ultimoCorrelativo, 1, 5) + 1;
            } else {
                $numeroSeguimiento = 1;
            }

            // Crear el nuevo correlativo
            $nuevoCorrelativo = 'C' . str_pad($numeroSeguimiento, 5, '0', STR_PAD_LEFT) . '-' . $yearActual;

            // Insertar el nuevo compromiso en la base de datos
            $sqlInsert = "INSERT INTO compromisos (correlativo, descripcion, id_registro, id_ejercicio, tabla_registro, numero_compromiso) VALUES (?, ?, ?, ?, ?, ?)";
            $stmtInsert = $this->conexion->prepare($sqlInsert);
            $stmtInsert->bind_param("ssisss", $nuevoCorrelativo, $descripcion, $idRegistro, $id_ejercicio, $nombreTabla, $codigo);
            $stmtInsert->execute();

            // Verificar si la inserción fue exitosa
            if ($stmtInsert->affected_rows > 0) {
                $idCompromiso = $this->conexion->insert_id;

                // Si la tabla es 'solicitud_dozavos', actualizar el número de compromiso en la tabla correspondiente
                if ($nombreTabla === 'solicitud_dozavos') {
                    $sqlUpdate = "UPDATE $nombreTabla SET numero_compromiso = ? WHERE id = ?";
                    $stmtUpdate = $this->conexion->prepare($sqlUpdate);
                    $stmtUpdate->bind_param("si", $codigo, $idRegistro);
                    $stmtUpdate->execute();

                    $sqlUpdate2 = "UPDATE compromisos SET numero_compromiso = ? WHERE id = ?";
                    $stmtUpdate2 = $this->conexion->prepare($sqlUpdate2);
                    $stmtUpdate2->bind_param("si", $codigo, $idCompromiso);
                    $stmtUpdate2->execute();

                    // Verificar si la actualización fue exitosa
                    if ($stmtUpdate->affected_rows > 0) {
                        return ["success" => true, "correlativo" => $nuevoCorrelativo, "id_compromiso" => $idCompromiso];
                    } else {
                        return ["error" => "No se pudo actualizar el número de compromiso en la tabla $nombreTabla."];
                    }
                } else {
                    // Si no es 'solicitud_dozavos', retornar el éxito
                    return ["success" => true, "correlativo" => $nuevoCorrelativo, "id_compromiso" => $idCompromiso];
                }
            } else {
                return ["error" => "No se pudo registrar el compromiso."];
            }
        } catch (Exception $e) {
            registrarError($e->getMessage());
            return ["error" => $e->getMessage()];
        }
    }


    public function consultarSolicitudPorId($data)
    {
        if (!isset($data['id']) || !isset($data['id_ejercicio'])) {
            return ["error" => "No se ha especificado ID o un Ejercicio Fiscal para la consulta."];
        }

        $id = $data['id'];
        $id_ejercicio = $data['id_ejercicio'];

        try {
            // Consultar la solicitud principal
            $sql = "SELECT id, numero_orden, numero_compromiso, descripcion, monto, fecha, partidas, id_ente, tipo, mes, status, id_ejercicio 
                FROM solicitud_dozavos 
                WHERE id = ? AND id_ejercicio = ?";
            $stmt = $this->conexion->prepare($sql);
            $stmt->bind_param("ii", $id, $id_ejercicio);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $idEnte = $row['id_ente'];

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

                // Consultar la información del compromiso asociado
                $sqlCompromiso = "SELECT * FROM compromisos WHERE id_registro = ? AND tabla_registro = 'solicitud_dozavos'";
                $stmtCompromiso = $this->conexion->prepare($sqlCompromiso);
                $stmtCompromiso->bind_param("i", $id);
                $stmtCompromiso->execute();
                $resultCompromiso = $stmtCompromiso->get_result();
                $informacionCompromiso = $resultCompromiso->fetch_assoc();
                $stmtCompromiso->close();

                // Agregar la información del compromiso
                $row['informacion_compromiso'] = $informacionCompromiso ?: null; // Si no se encuentra, se asigna como null

                return ["success" => $row];
            } else {
                return ["error" => "No se encontró el registro con el ID especificado"];
            }
        } catch (Exception $e) {
            return ["error" => "Ocurrió un error al consultar la solicitud: " . $e->getMessage()];
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
                return ["error" => "Faltan datos obligatorios para registrar la solicitud."];
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
                return ["error" => "No se puede registrar la solicitud porque hay una pendiente."];
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
                return ["error" => "No se puede registrar la solicitud. Condiciones no cumplidas."];
            }

            // Generar el numero_orden automáticamente
            $numero_orden = $this->generarNumeroOrden();
            $fecha = date("Y-m-d");

            // Insertar en solicitud_dozavos (numero_compromiso siempre será 0 inicialmente)
            $sqlInsertar = "INSERT INTO solicitud_dozavos (numero_orden, numero_compromiso, descripcion, tipo, monto, fecha, partidas, id_ente, status, id_ejercicio, mes) VALUES (?, 0, ?, ?, ?, ?, ?, ?, 1, ?, ?)";
            $stmtInsertar = $this->conexion->prepare($sqlInsertar);
            $partidasJson = json_encode($data['partidas']); // Convertir partidas a formato JSN
            $stmtInsertar->bind_param("sssssssss", $numero_orden, $data['descripcion'], $data['tipo'], $data['monto'], $fecha, $partidasJson, $idEnte, $idEjercicio, $mesSolicitado);
            $stmtInsertar->execute();

            if ($stmtInsertar->affected_rows > 0) {
                // Confirmar la transacción
                $this->conexion->commit();
                return ["success" => "Registro exitoso"];
            } else {
                $this->conexion->rollback();
                return ["error" => "No se pudo registrar la solicitud."];
            }
        } catch (Exception $e) {
            // Revertir transacción en caso de error
            $this->conexion->rollback();
            // $this->registrarError($e->getMessage());
            return ["error" => $e->getMessage()];
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
                $sqlUpdateSolicitud = "UPDATE solicitud_dozavos SET status = 0, numero_compromiso = ? WHERE id = ?";
                $stmtUpdateSolicitud = $this->conexion->prepare($sqlUpdateSolicitud);
                $stmtUpdateSolicitud->bind_param("si", $codigo, $idSolicitud);
                $stmtUpdateSolicitud->execute();

                if ($stmtUpdateSolicitud->affected_rows > 0) {
                    $this->conexion->commit();
                    return ["success" => "Solicitud Aceptada con éxito."];
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

                    return ["success" => "La solicitud ha sido rechazada"];
                } else {
                    throw new Exception("No se pudo rechazar la solicitud");
                }
            } else {
                throw new Exception("Acción no válida. Debe ser 'aceptar' o 'rechazar'.");
            }
        } catch (Exception $e) {
            // Si ocurre algún error, deshacer todas las operaciones anteriores
            $this->conexion->rollback();
            // $this->registrarError($e->getMessage());
            return ['error' => $e->getMessage() . $this->conexion->error];
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


    function actualizarStatusSolicitud($id)
    {


        if (!$id) {
            return ["error" => "No se ha especificado el ID de la solicitud."];
        }

        try {
            // Preparar la consulta para actualizar el status
            $sql = "UPDATE solicitud_dozavos SET status = 4 WHERE id = ?";
            $stmt = $this->conexion->prepare($sql);

            if (!$stmt) {
                throw new Exception("Error al preparar la consulta: " . $this->conexion->error);
            }

            $stmt->bind_param("i", $id);
            $stmt->execute();

            // Verificar si se actualizó algún registro
            if ($stmt->affected_rows > 0) {
                $stmt->close();
                return ["success" => "La solicitud fue entregada con éxito."];
            } else {
                $stmt->close();
                return ["error" => "No se encontró la solicitud o ya fue entregada.  $id"];
            }
        } catch (Exception $e) {
            return ["error" => "Error: " . $e->getMessage()];
        }
    }
}





?>