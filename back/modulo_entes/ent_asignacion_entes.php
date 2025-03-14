<?php
require_once '../sistema_global/conexion.php';
header('Content-Type: application/json');
require_once '../sistema_global/session.php';
require_once '../sistema_global/errores.php';

// Función para insertar un registro en asignacion_ente
function insertarAsignacionEnte($monto_total, $id_ejercicio)
{
    global $conexion;


    // Obtener id_ente de la sesión
    if (!isset($_SESSION['id_ente'])) {
        return json_encode(["error" => "El usuario no tiene un ente asignado en la sesión."]);
    }
    $id_ente = $_SESSION['id_ente'];

    $conexion->begin_transaction();

    try {
        $fecha = date('Y-m-d');
        $status = 0;

        $sql = "INSERT INTO asignacion_ente (id_ente, monto_total, id_ejercicio, fecha, status) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("idisi", $id_ente, $monto_total, $id_ejercicio, $fecha, $status);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            $conexion->commit();
            return json_encode(["success" => "Registro insertado correctamente."]);
        } else {
            throw new Exception("No se pudo insertar el registro.");
        }
    } catch (Exception $e) {
        $conexion->rollback();
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}


// Función para actualizar un registro en asignacion_ente
function actualizarAsignacionEnte($id, $monto_total, $id_ejercicio)
{
    global $conexion;

    // Obtener id_ente de la sesión
    if (!isset($_SESSION['id_ente'])) {
        return json_encode(["error" => "El usuario no tiene un ente asignado en la sesión."]);
    }
    $id_ente = $_SESSION['id_ente'];

    $conexion->begin_transaction();

    try {
        $sql = "UPDATE asignacion_ente SET id_ente = ?, monto_total = ?, id_ejercicio = ? WHERE id = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("idii", $id_ente, $monto_total, $id_ejercicio, $id);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            $conexion->commit();
            return json_encode(["success" => "Registro actualizado correctamente."]);
        } else {
            throw new Exception("No se encontró el registro o no se hicieron cambios.");
        }
    } catch (Exception $e) {
        $conexion->rollback();
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}


// Función para eliminar un registro de asignacion_ente
function eliminarAsignacionEnte($id)
{
    global $conexion;

    $conexion->begin_transaction();

    try {
        // Primero elimina el registro en asignacion_ente
        $sqlAsignacion = "DELETE FROM asignacion_ente WHERE id = ?";
        $stmtAsignacion = $conexion->prepare($sqlAsignacion);
        $stmtAsignacion->bind_param("i", $id);
        $stmtAsignacion->execute();

        $affectedRowsAsignacion = $stmtAsignacion->affected_rows;

        if ($affectedRowsAsignacion > 0) {
            // Verifica si existen registros en distribucion_entes con el id_asignacion correspondiente
            $sqlVerificacion = "SELECT id, distribucion FROM distribucion_entes WHERE id_asignacion = ?";
            $stmtVerificacion = $conexion->prepare($sqlVerificacion);
            $stmtVerificacion->bind_param("i", $id);
            $stmtVerificacion->execute();
            $resultVerificacion = $stmtVerificacion->get_result();

            $affectedRowsDistribucion = 0;

            // Si hay registros en distribucion_entes, procesa cada uno
            while ($rowVerificacion = $resultVerificacion->fetch_assoc()) {
                $distribucionData = json_decode($rowVerificacion['distribucion'], true);

                // Iterar sobre cada elemento en el array `distribucion` para actualizar `monto_actual` en `distribucion_presupuestaria`
                foreach ($distribucionData as $item) {
                    $id_distribucion = $item['id_distribucion'];
                    $monto = $item['monto'];

                    // Actualizar monto_actual en distribucion_presupuestaria sumando el monto de cada elemento
                    $sqlUpdatePresupuestaria = "UPDATE distribucion_presupuestaria SET monto_actual = monto_actual + ? WHERE id = ?";
                    $stmtUpdatePresupuestaria = $conexion->prepare($sqlUpdatePresupuestaria);
                    $stmtUpdatePresupuestaria->bind_param("di", $monto, $id_distribucion);
                    $stmtUpdatePresupuestaria->execute();
                }

                // Eliminar el registro en distribucion_entes después de actualizar los montos
                $sqlDistribucion = "DELETE FROM distribucion_entes WHERE id = ?";
                $stmtDistribucion = $conexion->prepare($sqlDistribucion);
                $stmtDistribucion->bind_param("i", $rowVerificacion['id']);
                $stmtDistribucion->execute();

                $affectedRowsDistribucion += $stmtDistribucion->affected_rows;
            }

            // Commit de la transacción de eliminación
            $conexion->commit();

            // Inserción en la tabla audit_logs después de completar la eliminación
            $sqlAudit = "INSERT INTO audit_logs (action_type, table_name, situation, affected_rows, user_id, timestamp) 
                         VALUES (?, ?, ?, ?, ?, NOW())";
            $stmtAudit = $conexion->prepare($sqlAudit);

            $actionType = 'DELETE';
            $tableName = 'asignacion_ente - distribucion_entes';
            $situation = "id=$id";
            $affectedRows = $affectedRowsAsignacion + $affectedRowsDistribucion;
            $user_id = $_SESSION['u_id'];

            $stmtAudit->bind_param("sssii", $actionType, $tableName, $situation, $affectedRows, $user_id);
            $stmtAudit->execute();

            return json_encode(["success" => "Registro eliminado correctamente."]);
        } else {
            throw new Exception("No se encontró el registro en asignacion_ente para eliminar.");
        }
    } catch (Exception $e) {
        $conexion->rollback();
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}
function obtenerDetallesPorId($conexion, $tabla, $id)
{
    try {
        $sql = "SELECT * FROM $tabla WHERE id = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            return $result->fetch_assoc(); // Devuelve el registro como un arreglo asociativo
        } else {
            return null; // No se encontró el registro
        }
    } catch (Exception $e) {
        registrarError($e->getMessage());
        return null; // Error en la consulta
    }
}



function consultarAsignacionPorId($id_ejercicio)
{
    global $conexion;

    // Obtener id_ente de la sesión
    if (!isset($_SESSION['id_ente'])) {
        return json_encode(["error" => "El usuario no tiene un ente asignado en la sesión."]);
    }
    $idEnteSesion = $_SESSION['id_ente'];

    try {
        // Consulta principal para obtener los datos de asignacion_ente y sus detalles del ente
        $sql = "SELECT a.*, e.partida, e.ente_nombre, e.tipo_ente, e.sector, e.programa, e.proyecto, e.actividad 
                FROM asignacion_ente a
                JOIN entes e ON a.id_ente = e.id
                WHERE a.id_ente = ? AND a.id_ejercicio = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("ii", $idEnteSesion, $id_ejercicio);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $asignacion = $result->fetch_assoc();

            // Usar el id obtenido de la primera consulta
            $idAsignacion = $asignacion['id'];

            // Consulta para obtener los detalles de actividades_entes asociados al id_asignacion y id_ejercicio
            $sqlActividades = "SELECT de.id AS actividad_id, de.id_ente, de.distribucion, de.monto_total, de.status, de.id_ejercicio,
                                      ed.actividad, ed.ente_nombre
                               FROM distribucion_entes de
                               LEFT JOIN entes_dependencias ed ON de.actividad_id = ed.id
                               WHERE de.id_asignacion = ? AND de.id_ejercicio = ?";
            $stmtActividades = $conexion->prepare($sqlActividades);
            $stmtActividades->bind_param("ii", $idAsignacion, $id_ejercicio);
            $stmtActividades->execute();
            $resultActividades = $stmtActividades->get_result();

            $actividadesEntes = [];
            while ($actividad = $resultActividades->fetch_assoc()) {
                if (!empty($actividad['distribucion'])) {
                    $actividad["distribucion_partidas"] = json_decode($actividad['distribucion'], true);

                    foreach ($actividad["distribucion_partidas"] as &$distribucionItem) {
                        $idDistribucion = $distribucionItem['id_distribucion'];

                        // Consulta para obtener los detalles de distribución presupuestaria
                        $sqlDistribucionDetalles = "SELECT id_partida, id_sector, id_programa FROM distribucion_presupuestaria WHERE id = ?";
                        $stmtDistribucionDetalles = $conexion->prepare($sqlDistribucionDetalles);
                        $stmtDistribucionDetalles->bind_param("i", $idDistribucion);
                        $stmtDistribucionDetalles->execute();
                        $resultDistribucionDetalles = $stmtDistribucionDetalles->get_result();

                        if ($resultDistribucionDetalles->num_rows > 0) {
                            $distribucionDetalles = $resultDistribucionDetalles->fetch_assoc();
                            $distribucionItem['id_partida'] = $distribucionDetalles['id_partida'];
                            $distribucionItem['id_sector'] = $distribucionDetalles['id_sector'];
                            $distribucionItem['id_programa'] = $distribucionDetalles['id_programa'];

                            // Agregar detalles adicionales
                            $distribucionItem['sector_informacion'] = obtenerDetallesPorId($conexion, "pl_sectores", $distribucionDetalles['id_sector']);
                            $distribucionItem['programa_informacion'] = obtenerDetallesPorId($conexion, "pl_programas", $distribucionDetalles['id_programa']);
                            $distribucionItem['partida_informacion'] = obtenerDetallesPorId($conexion, "partidas_presupuestarias", $distribucionDetalles['id_partida']);
                        } else {
                            $distribucionItem = array_merge($distribucionItem, ['id_partida' => null, 'id_sector' => null, 'id_programa' => null]);
                        }
                    }
                } else {
                    $actividad["distribucion_partidas"] = [];
                }

                $actividadesEntes[] = $actividad;
            }

            $asignacion['actividades_entes'] = $actividadesEntes;
            // Verificar si hay dependencias
            $sqlDependencias = "SELECT * FROM entes_dependencias WHERE ue = ?";
            $stmtDependencias = $conexion->prepare($sqlDependencias);
            $stmtDependencias->bind_param("i", $idEnteSesion);
            $stmtDependencias->execute();
            $resultDependencias = $stmtDependencias->get_result();

            // Guardar las dependencias en un array si existen registros, si no, devolver un array vacío
            $dependencias = [];
            while ($dependencia = $resultDependencias->fetch_assoc()) {
                $dependencias[] = $dependencia;
            }
            $asignacion['dependencias'] = $dependencias;

            return json_encode(["success" => $asignacion]);
        } else {
            return json_encode(["error" => "No se encontró el registro o no pertenece al ente asignado."]);
        }
    } catch (Exception $e) {
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}


function consultarTodasAsignaciones($id_ejercicio)
{
    global $conexion;


    // Obtener id_ente de la sesión
    if (!isset($_SESSION['id_ente'])) {
        return json_encode(["error" => "El usuario no tiene un ente asignado en la sesión."]);
    }
    $idEnteSesion = $_SESSION['id_ente'];

    try {
        $sql = "SELECT a.*, e.ente_nombre, e.tipo_ente, e.sector, e.programa, e.proyecto, e.actividad, 
                       se.sector AS se_denominacion, prg.programa AS prg_denominacion, pr.proyecto_id AS pr_denominacion 
                FROM asignacion_ente a
                JOIN entes e ON a.id_ente = e.id
                LEFT JOIN pl_sectores se ON e.sector = se.id
                LEFT JOIN pl_programas prg ON e.programa = prg.id
                LEFT JOIN pl_proyectos pr ON e.proyecto = pr.id
                WHERE a.id_ente = ? AND a.id_ejercicio = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("ii", $idEnteSesion, $id_ejercicio);
        $stmt->execute();
        $result = $stmt->get_result();

        $asignaciones = [];
        while ($row = $result->fetch_assoc()) {
            $asignaciones[] = $row;
        }

        return json_encode(["success" => $asignaciones]);
    } catch (Exception $e) {
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}

function consultarAsignacionesSecretaria($idEjercicio)
{
    global $conexion;

    try {
        // Consulta principal para obtener los entes_dependencias que cumplen con las condiciones
        $sql = "SELECT ed.id AS id_ente, ed.partida, ed.ente_nombre, ed.tipo_ente, ed.sector, ed.programa, ed.proyecto, ed.actividad
                FROM entes_dependencias ed
                WHERE ed.tipo_ente = 'J' AND ed.juridico = 0";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();

        $asignaciones = [];
        while ($ente = $result->fetch_assoc()) {
            // Consulta para obtener las distribuciones asociadas al ente
            $sqlDistribuciones = "SELECT de.id AS id_distribucion, de.monto_total, de.distribucion
                                  FROM distribucion_entes de
                                  WHERE de.actividad_id = ? AND de.id_ejercicio = ?";
            $stmtDistribuciones = $conexion->prepare($sqlDistribuciones);
            $stmtDistribuciones->bind_param("ii", $ente['id_ente'], $idEjercicio);
            $stmtDistribuciones->execute();
            $resultDistribuciones = $stmtDistribuciones->get_result();

            while ($distribucion = $resultDistribuciones->fetch_assoc()) {
                if (!empty($distribucion['distribucion'])) {
                    $distribucionPartidas = json_decode($distribucion['distribucion'], true);

                    foreach ($distribucionPartidas as $distribucionItem) {
                        $idDistribucion = $distribucionItem['id_distribucion'];

                        // Consulta para obtener detalles de la distribución presupuestaria
                        $sqlDetalles = "SELECT dp.id_partida, dp.id AS id_distribucion_, dp.id_sector, dp.id_programa, dp.id_proyecto, pp.partida AS codigo_partida, pp.descripcion AS partida_descripcion, dp.id_actividad as id_actividad,  
                                               ps.sector AS sector_denominacion, pg.programa AS programa_denominacion, pr.proyecto_id AS proyecto_denominacion
                                        FROM distribucion_presupuestaria dp
                                        LEFT JOIN partidas_presupuestarias pp ON dp.id_partida = pp.id
                                        LEFT JOIN pl_sectores ps ON dp.id_sector = ps.id
                                        LEFT JOIN pl_programas pg ON dp.id_programa = pg.id
                                        LEFT JOIN pl_proyectos pr ON dp.id_proyecto = pr.id
                                        WHERE dp.id = ?";
                        $stmtDetalles = $conexion->prepare($sqlDetalles);
                        $stmtDetalles->bind_param("i", $idDistribucion);
                        $stmtDetalles->execute();
                        $resultDetalles = $stmtDetalles->get_result();

                        if ($resultDetalles->num_rows > 0) {
                            $detalles = $resultDetalles->fetch_assoc();

                            $asignaciones[] = [
                                "id_distribucion" => $detalles['id_distribucion_'],
                                'partida' => $detalles['codigo_partida'],
                                'partida_descripcion' => $detalles['partida_descripcion'],
                                'sector_denominacion' => $detalles['sector_denominacion'],
                                'id_actividad' => $detalles['id_actividad'],
                                'programa_denominacion' => $detalles['programa_denominacion'],
                                'proyecto_denominacion' => $detalles['proyecto_denominacion'],
                                'ente_nombre' => $ente['ente_nombre'],
                                'monto' => $distribucionItem['monto'],
                            ];
                        }
                    }
                }
            }
        }

        return json_encode(["success" => $asignaciones]);
    } catch (Exception $e) {
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}



// Procesar la solicitud
$data = json_decode(file_get_contents("php://input"), true);

if (isset($data["accion"])) {
    $accion = $data["accion"];

    // Insertar datos
    if ($accion === "insert" && isset($data["monto_total"]) && isset($data["id_ejercicio"])) {
        $monto_total = $data["monto_total"];
        $id_ejercicio = $data["id_ejercicio"];
        echo insertarAsignacionEnte($monto_total, $id_ejercicio);

        // Actualizar datos
    } elseif ($accion === "update" && isset($data["id"]) && isset($data["monto_total"]) && isset($data["id_ejercicio"])) {
        $id = $data["id"];
        $monto_total = $data["monto_total"];
        $id_ejercicio = $data["id_ejercicio"];
        echo actualizarAsignacionEnte($id, $monto_total, $id_ejercicio);

        // Eliminar datos
    } elseif ($accion === "delete" && isset($data["id"])) {
        $id = $data["id"];
        echo eliminarAsignacionEnte($id);

        // Consultar por ID
    } elseif ($accion === "consultar_por_id" && isset($data["id_ejercicio"])) {

        $id_ejercicio = $data["id_ejercicio"];
        echo consultarAsignacionPorId($id_ejercicio);

        // Consultar todos los registros
    } elseif ($accion === "consultar") {
        $id_ejercicio = $data["id_ejercicio"];
        echo consultarTodasAsignaciones($id_ejercicio);

        // Acción no válida o faltan datos
    } elseif ($accion === "consultar_secretarias") {
        $id_ejercicio = $data["id_ejercicio"];
        echo consultarAsignacionesSecretaria($id_ejercicio);

        // Acción no válida o faltan datos
    } else {
        echo json_encode(['error' => "Acción no válida o faltan datos"]);
    }
} else {
    echo json_encode(['error' => "No se recibió ninguna acción"]);
    //echo  consultarTodasAsignaciones();
}
