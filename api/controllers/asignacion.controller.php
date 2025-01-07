<?php



header('Content-Type: application/json');
// require_once '../../back/modulo_entes/pre_compromisos.php';




class AsignacionController
{
    public function __construct($conexion)
    {
        $this->conexion = $conexion;
    }

    private $conexion;

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



    // Función para insertar un registro en asignacion_ente
    function insertarAsignacionEnte($id_ente, $monto_total, $id_ejercicio)
    {

        $this->conexion->begin_transaction();

        try {
            $fecha = date('Y-m-d');
            $status = 0;

            $sql = "INSERT INTO asignacion_ente (id_ente, monto_total, id_ejercicio, fecha, status) VALUES (?, ?, ?, ?, ?)";
            $stmt = $this->conexion->prepare($sql);
            $stmt->bind_param("idisi", $id_ente, $monto_total, $id_ejercicio, $fecha, $status);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                $this->conexion->commit();
                return json_encode(["success" => "Registro insertado correctamente."]);
            } else {
                throw new Exception("No se pudo insertar el registro.");
            }
        } catch (Exception $e) {
            $this->conexion->rollback();
            registrarError($e->getMessage());
            return json_encode(['error' => $e->getMessage()]);
        }
    }

    // Función para actualizar un registro en asignacion_ente
    function actualizarAsignacionEnte($id, $id_ente, $monto_total, $id_ejercicio)
    {


        $this->conexion->begin_transaction();

        try {
            $sql = "UPDATE asignacion_ente SET id_ente = ?, monto_total = ?, id_ejercicio = ? WHERE id = ?";
            $stmt = $this->conexion->prepare($sql);
            $stmt->bind_param("idii", $id_ente, $monto_total, $id_ejercicio, $id);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                $this->conexion->commit();
                return json_encode(["success" => "Registro actualizado correctamente."]);
            } else {
                throw new Exception("No se encontró el registro o no se hicieron cambios.");
            }
        } catch (Exception $e) {
            $this->conexion->rollback();
            registrarError($e->getMessage());
            return json_encode(['error' => $e->getMessage()]);
        }
    }

    // Función para eliminar un registro de asignacion_ente
    function eliminarAsignacionEnte($id)
    {


        $this->conexion->begin_transaction();

        try {
            // Primero elimina el registro en asignacion_ente
            $sqlAsignacion = "DELETE FROM asignacion_ente WHERE id = ?";
            $stmtAsignacion = $this->conexion->prepare($sqlAsignacion);
            $stmtAsignacion->bind_param("i", $id);
            $stmtAsignacion->execute();

            $affectedRowsAsignacion = $stmtAsignacion->affected_rows;

            if ($affectedRowsAsignacion > 0) {
                // Verifica si existen registros en distribucion_entes con el id_asignacion correspondiente
                $sqlVerificacion = "SELECT id, distribucion FROM distribucion_entes WHERE id_asignacion = ?";
                $stmtVerificacion = $this->conexion->prepare($sqlVerificacion);
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
                        $stmtUpdatePresupuestaria = $this->conexion->prepare($sqlUpdatePresupuestaria);
                        $stmtUpdatePresupuestaria->bind_param("di", $monto, $id_distribucion);
                        $stmtUpdatePresupuestaria->execute();
                    }

                    // Eliminar el registro en distribucion_entes después de actualizar los montos
                    $sqlDistribucion = "DELETE FROM distribucion_entes WHERE id = ?";
                    $stmtDistribucion = $this->conexion->prepare($sqlDistribucion);
                    $stmtDistribucion->bind_param("i", $rowVerificacion['id']);
                    $stmtDistribucion->execute();

                    $affectedRowsDistribucion += $stmtDistribucion->affected_rows;
                }

                // Commit de la transacción de eliminación
                $this->conexion->commit();

                // Inserción en la tabla audit_logs después de completar la eliminación
                $sqlAudit = "INSERT INTO audit_logs (action_type, table_name, situation, affected_rows, user_id, timestamp) 
                         VALUES (?, ?, ?, ?, ?, NOW())";
                $stmtAudit = $this->conexion->prepare($sqlAudit);

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
            $this->conexion->rollback();
            registrarError($e->getMessage());
            return json_encode(['error' => $e->getMessage()]);
        }
    }


    function consultarAsignacionPorId($id)
    {


        try {
            // Consulta principal para obtener los datos de asignacion_ente y sus detalles del ente
            $sql = "SELECT a.*, e.partida, e.ente_nombre, e.tipo_ente, e.sector, e.programa, e.proyecto, e.actividad 
                FROM asignacion_ente a
                JOIN entes e ON a.id_ente = e.id
                WHERE a.id = ?";
            $stmt = $this->conexion->prepare($sql);
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $asignacion = $result->fetch_assoc();

                // Consulta para obtener los detalles de actividades_entes asociados al id_asignacion y id_ejercicio
                $sqlActividades = "SELECT de.id AS actividad_id, de.id_ente, de.distribucion, de.monto_total, de.status, de.id_ejercicio,
                                      ed.actividad, ed.ente_nombre
                               FROM distribucion_entes de
                               LEFT JOIN entes_dependencias ed ON de.actividad_id = ed.id
                               WHERE de.id_asignacion = ? AND de.id_ejercicio = ?";
                $stmtActividades = $this->conexion->prepare($sqlActividades);
                $stmtActividades->bind_param("ii", $id, $asignacion['id_ejercicio']);
                $stmtActividades->execute();
                $resultActividades = $stmtActividades->get_result();

                $actividadesEntes = [];
                while ($actividad = $resultActividades->fetch_assoc()) {
                    if (!empty($actividad['distribucion'])) {
                        $actividad["distribucion_partidas"] = json_decode($actividad['distribucion'], true);

                        foreach ($actividad["distribucion_partidas"] as &$distribucionItem) {
                            $idDistribucion = $distribucionItem['id_distribucion'];

                            // Consulta para obtener el id_partida, id_sector, y id_programa de distribucion_presupuestaria
                            $sqlDistribucionDetalles = "SELECT id_partida, id_sector, id_programa FROM distribucion_presupuestaria WHERE id = ?";
                            $stmtDistribucionDetalles = $this->conexion->prepare($sqlDistribucionDetalles);
                            $stmtDistribucionDetalles->bind_param("i", $idDistribucion);
                            $stmtDistribucionDetalles->execute();
                            $resultDistribucionDetalles = $stmtDistribucionDetalles->get_result();

                            if ($resultDistribucionDetalles->num_rows > 0) {
                                $distribucionDetalles = $resultDistribucionDetalles->fetch_assoc();
                                $distribucionItem['id_partida'] = $distribucionDetalles['id_partida'];
                                $distribucionItem['id_sector'] = $distribucionDetalles['id_sector'];
                                $distribucionItem['id_programa'] = $distribucionDetalles['id_programa'];

                                // Obtener detalles del sector
                                $sqlSector = "SELECT * FROM pl_sectores WHERE id = ?";
                                $stmtSector = $this->conexion->prepare($sqlSector);
                                $stmtSector->bind_param("i", $distribucionDetalles['id_sector']);
                                $stmtSector->execute();
                                $resultSector = $stmtSector->get_result();

                                $distribucionItem['sector_informacion'] = $resultSector->num_rows > 0 ? $resultSector->fetch_assoc() : null;

                                // Obtener detalles del programa
                                $sqlPrograma = "SELECT * FROM pl_programas WHERE id = ?";
                                $stmtPrograma = $this->conexion->prepare($sqlPrograma);
                                $stmtPrograma->bind_param("i", $distribucionDetalles['id_programa']);
                                $stmtPrograma->execute();
                                $resultPrograma = $stmtPrograma->get_result();

                                $distribucionItem['programa_informacion'] = $resultPrograma->num_rows > 0 ? $resultPrograma->fetch_assoc() : null;

                                // Consulta para obtener los detalles de la partida
                                $sqlPartida = "SELECT * FROM partidas_presupuestarias WHERE id = ?";
                                $stmtPartida = $this->conexion->prepare($sqlPartida);
                                $stmtPartida->bind_param("i", $distribucionDetalles['id_partida']);
                                $stmtPartida->execute();
                                $resultPartida = $stmtPartida->get_result();

                                $distribucionItem += $resultPartida->num_rows > 0 ? $resultPartida->fetch_assoc() : ['partida_informacion' => null];
                            } else {
                                $distribucionItem['id_partida'] = null;
                                $distribucionItem['id_sector'] = null;
                                $distribucionItem['id_programa'] = null;
                            }
                        }
                    } else {
                        $actividad["distribucion_partidas"] = [];
                    }

                    $actividadesEntes[] = $actividad;
                }

                $asignacion['actividades_entes'] = $actividadesEntes;

                // Verificar si hay dependencias
                $idEnte = $asignacion['id_ente'];
                $sqlDependencias = "SELECT * FROM entes_dependencias WHERE ue = ?";
                $stmtDependencias = $this->conexion->prepare($sqlDependencias);
                $stmtDependencias->bind_param("i", $idEnte);
                $stmtDependencias->execute();
                $resultDependencias = $stmtDependencias->get_result();

                // Guardar las dependencias en un array si existen registros, si no, devolver un array vacío
                $dependencias = [];
                while ($dependencia = $resultDependencias->fetch_assoc()) {
                    $dependencias[] = $dependencia;
                }
                $asignacion['dependencias'] = $dependencias;

                return ["success" => $asignacion];
            } else {
                return ["error" => "No se encontró el registro."];
            }
        } catch (Exception $e) {
            registrarError($e->getMessage());
            return ['error' => $e->getMessage()];
        }
    }









    // Función para consultar todos los registros en asignacion_ente
    function consultarTodasAsignaciones()
    {


        try {
            $sql = "SELECT a.*, e.ente_nombre, e.tipo_ente, e.sector, e.programa, e.proyecto, e.actividad, se.sector AS se_denominacion, prg.programa AS prg_denominacion, pr.proyecto_id AS pr_denominacion 
                FROM asignacion_ente a
                JOIN entes e ON a.id_ente = e.id
                LEFT JOIN pl_sectores se ON e.sector = se.id
                LEFT JOIN pl_programas prg ON e.programa = prg.id
                LEFT JOIN pl_proyectos pr ON e.proyecto = pr.id
                ";
            $result = $this->conexion->query($sql);

            $asignaciones = [];
            while ($row = $result->fetch_assoc()) {
                $asignaciones[] = $row;
            }

            return ["success" => $asignaciones];
        } catch (Exception $e) {
            registrarError($e->getMessage());
            return ['error' => $e->getMessage()];
        }
    }


}





?>