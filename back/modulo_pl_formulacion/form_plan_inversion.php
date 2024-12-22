<?php

require_once '../sistema_global/conexion.php';
header('Content-Type: application/json');
require_once '../sistema_global/session.php';
require_once '../sistema_global/errores.php';


// validar que el monto no supere el presupuesto
function validarPresupuesto($plan, $monto)
{

    return true;
}



// Función para insertar datos en plan_inversion y proyecto_inversion
function guardarProyecto($proyectosArray)
{
    global $conexion;

    try {
        // Verificar que el array de proyectos no esté vacío
        if (empty($proyectosArray)) {
            throw new Exception("El array de proyectos está vacío");
        }

        // Insertar los proyectos en la tabla proyecto_inversion

        $nombre = $proyectosArray['nombre'];
        $descripcion = $proyectosArray['descripcion'];
        $monto = $proyectosArray['monto'];
        $id_plan = $proyectosArray['id_plan'];

        $sqlProyecto = "INSERT INTO proyecto_inversion (
            id_plan,
            proyecto,
            descripcion,
            monto_proyecto) VALUES (?, ?, ?, ?)";
        $stmtProyecto = $conexion->prepare($sqlProyecto);
        $stmtProyecto->bind_param("isss", $id_plan, $nombre, $descripcion, $monto);
        $stmtProyecto->execute();

        if ($stmtProyecto->affected_rows <= 0) {
            $error = $stmtProyecto->error;
            throw new Exception("Error al insertar en la tabla proyecto_inversion. $error");
        }
        // obten el id del elemento registrado

        $partidas_montos = $proyectosArray['partida']; // fatos presupuesto
        $id_proyecto = $conexion->insert_id;
        // Insertar las partidas en la tabla plan_inversion


        $stmt_o = $conexion->prepare("INSERT INTO proyecto_inversion_partidas (id_proyecto, partida, monto, sector_id, programa_id, proyecto_id, actividad_id) VALUES (?, ?, ?, ?, ?, ?, ?)");


        foreach ($partidas_montos as $item) {
            $sector = $item['sector'];
            $program = $item['program'];
            $proyecto = $item['proyecto'];
            $actividad = $item['actividad'];
            $partida = $item['partida'];
            $monto = $item['monto'];

            $stmt_o->bind_param("iisiiii", $id_proyecto, $partida, $monto, $sector, $program, $proyecto, $actividad);
            $stmt_o->execute();
        }


        $stmt_o->close();

        $stmtProyecto->close();

        return json_encode(["success" => "Datos guardados correctamente."]);
    } catch (Exception $e) {
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}

// Función para actualizar datos en plan_inversion
function actualizarPlanInversion($id_plan, $monto_total)
{
    global $conexion;

    try {
        $fecha = date('Y-m-d');
        $sql = "UPDATE plan_inversion SET monto_total = ?, fecha = ? WHERE id = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("dsi", $monto_total, $fecha, $id_plan);
        $stmt->execute();

        if ($stmt->affected_rows <= 0) {
            throw new Exception("Error al actualizar el plan de inversión.");
        }

        $stmt->close();
        return json_encode(["success" => "Plan de inversión actualizado correctamente."]);
    } catch (Exception $e) {
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}

// Función para actualizar datos en proyecto_inversion
function actualizarProyectoInversion($proyecto)
{
    global $conexion;

    try {
        $id_proyecto = $proyecto['id'];
        $nombre_proyecto = $proyecto['nombre'];
        $monto_proyecto = $proyecto['monto'];
        $descripcion = $proyecto['descripcion'];
        $partidas_montos = $proyecto['partida'];

        // Verificar si el proyecto ya ha sido ejecutado
        $sqlCheckStatus = "SELECT status FROM proyecto_inversion WHERE id = ?";
        $stmtCheckStatus = $conexion->prepare($sqlCheckStatus);
        $stmtCheckStatus->bind_param("i", $id_proyecto);
        $stmtCheckStatus->execute();
        $stmtCheckStatus->bind_result($status);
        $stmtCheckStatus->fetch();
        $stmtCheckStatus->close();

        if ($status == 1) {
            throw new Exception("Este proyecto ya ha sido ejecutado y no se puede modificar.");
        }

        $error = false;
        // Actualizar los datos del proyecto
        $sql = "UPDATE proyecto_inversion SET proyecto = ?, descripcion=?, monto_proyecto = ? WHERE id = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("ssdi", $nombre_proyecto, $descripcion, $monto_proyecto, $id_proyecto);
        if (!$stmt->execute()) {
            $error = true;
        }
        $stmt->close();
        $stmt_d = $conexion->prepare("DELETE FROM `proyecto_inversion_partidas` WHERE id_proyecto= ?");
        $stmt_d->bind_param("i", $id_proyecto);
        if (!$stmt_d->execute()) {
            $error = true;
        }
        $stmt_d->close();



        $stmt_o = $conexion->prepare("INSERT INTO proyecto_inversion_partidas (id_proyecto, partida, monto, sector_id, programa_id, proyecto_id, actividad_id) VALUES (?, ?, ?, ?, ?, ?, ?)");

        foreach ($partidas_montos as $item) {
            $sector = $item['sector'];
            $program = $item['program'];
            $proyecto = $item['proyecto'];
            $actividad = $item['actividad'];
            $partida = $item['partida'];
            $monto = $item['monto'];

            $stmt_o->bind_param("iisiiii", $id_proyecto, $partida, $monto, $sector, $program, $proyecto, $actividad);
            if (!$stmt_o->execute()) {
                $error = true;
            }
        }
        $stmt_o->close();
        if ($error) {
            throw new Exception("Error al actualizar el proyecto de inversión.");
        }
        return json_encode(["success" => "Proyecto actualizado correctamente."]);
    } catch (Exception $e) {
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}

// Función para modificar el estado de un proyecto a 1 (ejecutado)
function ejecutarProyecto($comentario, $id_proyecto)
{
    global $conexion;

    try {
        $sql = "UPDATE proyecto_inversion SET status = 1, comentario=? WHERE id = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("si", $comentario, $id_proyecto);
        $stmt->execute();

        if ($stmt->affected_rows <= 0) {
            throw new Exception("Error al actualizar el estado del proyecto.");
        }

        $stmt->close();
        return json_encode(["success" => "Proyecto marcado como ejecutado."]);
    } catch (Exception $e) {
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}

// Función para eliminar datos en plan_inversion
function eliminarPlanInversion($id_plan)
{
    global $conexion;
    $user_id = $_SESSION['u_id']; // Obtener el user_id de la sesión actual

    try {
        // Iniciar transacción
        $conexion->begin_transaction();

        // Eliminar los proyectos relacionados
        $sqlDeleteProyectos = "DELETE FROM proyecto_inversion WHERE id_plan = ?";
        $stmtDeleteProyectos = $conexion->prepare($sqlDeleteProyectos);
        $stmtDeleteProyectos->bind_param("i", $id_plan);
        $stmtDeleteProyectos->execute();
        $affectedRowsProyectos = $stmtDeleteProyectos->affected_rows;
        $stmtDeleteProyectos->close();

        // Eliminar el plan de inversión
        $sqlDeletePlan = "DELETE FROM plan_inversion WHERE id = ?";
        $stmtDeletePlan = $conexion->prepare($sqlDeletePlan);
        $stmtDeletePlan->bind_param("i", $id_plan);
        $stmtDeletePlan->execute();
        $affectedRowsPlan = $stmtDeletePlan->affected_rows;
        
        if ($affectedRowsPlan <= 0) {
            throw new Exception("Error al eliminar el plan de inversión.");
        }

        $stmtDeletePlan->close();

        // Registrar en audit_logs
        $sqlAudit = "INSERT INTO audit_logs (action_type, table_name, situation, affected_rows, user_id, timestamp) 
                     VALUES (?, ?, ?, ?, ?, NOW())";
        $stmtAudit = $conexion->prepare($sqlAudit);
        $action_type = 'DELETE';
        $table_name = 'plan_inversion - proyecto_inversion';
        $situation = "id_plan=$id_plan";
        $affected_rows = $affectedRowsPlan + $affectedRowsProyectos; // Total de filas afectadas
        $stmtAudit->bind_param("sssii", $action_type, $table_name, $situation, $affected_rows, $user_id);
        $stmtAudit->execute();
        
        // Confirmar la transacción
        $conexion->commit();
        return json_encode(["success" => "Plan de inversión y proyectos eliminados correctamente."]);

    } catch (Exception $e) {
        $conexion->rollback(); // Revertir en caso de error
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}


function getPartidasXProyecto($proyecto)
{
    global $conexion;
    $data = [];

    $stmt = mysqli_prepare($conexion, "SELECT DISTINCT(PA.id) as partida_id, PA.partida AS partidad_n, PIP.monto, PA.descripcion, PIP.sector_id, SE.sector, SE.programa, SE.proyecto, PIP.programa_id, PIP.proyecto_id, PIP.actividad_id
     FROM `proyecto_inversion_partidas` AS PIP
    LEFT JOIN partidas_presupuestarias AS PA ON PA.id=PIP.partida
    LEFT JOIN pl_sectores_presupuestarios AS SE ON SE.id=PIP.sector_id
     WHERE id_proyecto = ?");
    $stmt->bind_param('s', $proyecto);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push($data, $row);
        }
    }
    $stmt->close();

    return $data;
}

// Obtener lista de proyectos
function getProyectos($id_plan)
{
    global $conexion;
    $data = [];

    $stmt = mysqli_prepare($conexion, "SELECT PI.descripcion, PI.id, PI.proyecto, PI.monto_proyecto, PI.status FROM `proyecto_inversion` AS PI WHERE id_plan = ?");
    $stmt->bind_param('s', $id_plan);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            array_push(
                $data,
                [
                    'id' => $row['id'],
                    'proyecto' => $row['proyecto'],
                    'descripcion' => $row['descripcion'],
                    'status' => $row['status'],
                    'monto_proyecto' => $row['monto_proyecto'],
                    'partidas' => getPartidasXProyecto($row['id'])
                ]
            );
        }
    }
    $stmt->close();
    return json_encode(['success' => $data]);
}

function eliminarProyecto($id)
{
    global $conexion;
    $user_id = $_SESSION['u_id']; // Obtener el user_id de la sesión actual

    try {
        // Iniciar transacción
        $conexion->begin_transaction();

        // Verificar el estado del proyecto
        $stmt = $conexion->prepare("SELECT status FROM `proyecto_inversion` WHERE id = ?");
        $stmt->bind_param('i', $id);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            if ($row['status'] == 1) {
                throw new Exception('No se puede eliminar un proyecto ejecutado');
            }
        } else {
            throw new Exception('El proyecto no existe');
        }
        $stmt->close();

        // Eliminar el proyecto de la tabla proyecto_inversion si el status es 0
        $stmtDeleteProyecto = $conexion->prepare("DELETE FROM `proyecto_inversion` WHERE id = ? AND status = '0'");
        $stmtDeleteProyecto->bind_param("i", $id);
        $stmtDeleteProyecto->execute();
        $affectedRowsProyecto = $stmtDeleteProyecto->affected_rows;
        $stmtDeleteProyecto->close();

        if ($affectedRowsProyecto <= 0) {
            throw new Exception("No se pudo eliminar el proyecto.");
        }

        // Eliminar las partidas asociadas en proyecto_inversion_partidas
        $stmtDeletePartidas = $conexion->prepare("DELETE FROM `proyecto_inversion_partidas` WHERE id_proyecto = ?");
        $stmtDeletePartidas->bind_param("i", $id);
        $stmtDeletePartidas->execute();
        $affectedRowsPartidas = $stmtDeletePartidas->affected_rows;
        $stmtDeletePartidas->close();

        // Registrar en audit_logs
        $sqlAudit = "INSERT INTO audit_logs (action_type, table_name, situation, affected_rows, user_id, timestamp) 
                     VALUES (?, ?, ?, ?, ?, NOW())";
        $stmtAudit = $conexion->prepare($sqlAudit);
        $action_type = 'DELETE';
        $table_name = 'proyecto_inversion - proyecto_inversion_partidas';
        $situation = "id_proyecto=$id";
        $affected_rows = $affectedRowsProyecto + $affectedRowsPartidas; // Total de filas afectadas
        $stmtAudit->bind_param("sssii", $action_type, $table_name, $situation, $affected_rows, $user_id);
        $stmtAudit->execute();
        $stmtAudit->close();

        // Confirmar la transacción
        $conexion->commit();
        return json_encode(['success' => 'Proyecto y partidas asociadas eliminados correctamente']);

    } catch (Exception $e) {
        $conexion->rollback(); // Revertir en caso de error
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}


// Procesar la solicitud
$data = json_decode(file_get_contents("php://input"), true);

if (isset($data["accion"])) {
    $accion = $data["accion"];

    // Nuevos proyectos
    if ($accion === "registrar_proyecto" && isset($data["proyecto"])) {
        echo guardarProyecto($data["proyecto"]);
        // Actualizar plan de inversión
    } elseif ($accion === "update_plan" && isset($data["id_plan"]) && isset($data["monto_total"])) {
        echo actualizarPlanInversion($data["id_plan"], $data["monto_total"]);
        // Actualizar proyecto de inversión
    } elseif ($accion === "update_proyecto" && isset($data["proyecto"])) {
        echo actualizarProyectoInversion($data["proyecto"]);
        // Marcar proyecto como ejecutado
    } elseif ($accion === "ejecutar_proyecto" && isset($data["id_proyecto"])) {
        echo ejecutarProyecto($data["comentario"], $data["id_proyecto"]);
        // Eliminar plan de inversión
    } elseif ($accion === "delete" && isset($data["id_plan"])) {
        echo eliminarPlanInversion($data["id_plan"]);
    } elseif ($accion === 'eliminar_proyecto' && isset($data['id_proyecto'])) {
        echo eliminarProyecto($data['id_proyecto']);
    } elseif ($accion === "get_proyectos" && isset($data["id_plan"])) {
        echo getProyectos($data["id_plan"]);
    } else {
        echo json_encode(["error" => "Acción inválida o datos faltantes."]);
    }
} else {
    echo json_encode(["error" => "Acción no especificada."]);
}
