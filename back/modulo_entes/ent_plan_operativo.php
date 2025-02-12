<?php
function gestionarPlanOperativo($data)
{
    global $conexion;

    try {
        if (!isset($data['accion'])) {
            return json_encode(["error" => "No se ha especificado acción."]);
        }

        $accion = $data['accion'];

        // Acción: Consultar todos los registros
        if ($accion === 'consulta') {
            return consultarPlanesOperativos($data);
        }

        // Acción: Consultar un registro por ID
        if ($accion === 'consulta_id') {
            return consultarPlanOperativoPorId($data);
        }

        // Acción: Registrar una nueva solicitud
        if ($accion === 'registrar') {
            return registrarPlanOperativo($data);
        }

        // Acción: Actualizar un registro
        if ($accion === 'update') {
            return actualizarPlanOperativo($data);
        }

        // Acción: Eliminar un registro (rechazar)
        if ($accion === 'delete') {
            return eliminarPlanOperativo($data);
        }


    } catch (Exception $e) {
        registrarError($e->getMessage());
        return json_encode(['error' => $e->getMessage()]);
    }
}





function registrarPlanOperativo($data) {
    global $conexion;
    
    try {
        if (!isset($data['objetivo_general']) || !isset($data['codigo']) || !isset($data['id_ejercicio']) || !isset($_SESSION['id_ente'])) {
            return json_encode(["error" => "Faltan datos obligatorios para registrar el plan operativo."]);
        }
        
        $idEnte = $_SESSION['id_ente'];
        $idEjercicio = $data['id_ejercicio'];
        
        // Verificar si ya existe un registro para este id_ente y id_ejercicio
        $sqlVerificar = "SELECT COUNT(*) AS total FROM plan_operativo WHERE id_ente = ? AND id_ejercicio = ?";
        $stmtVerificar = $conexion->prepare($sqlVerificar);
        $stmtVerificar->bind_param("ii", $idEnte, $idEjercicio);
        $stmtVerificar->execute();
        $resultadoVerificar = $stmtVerificar->get_result();
        $filaVerificar = $resultadoVerificar->fetch_assoc();
        
        if ($filaVerificar['total'] > 0) {
            return json_encode(["error" => "Ya existe un plan operativo registrado para este ente en el ejercicio fiscal indicado."]);
        }
        
        // Obtener el año del ejercicio fiscal
        $sqlEjercicio = "SELECT ano FROM ejercicio_fiscal WHERE id = ?";
        $stmtEjercicio = $conexion->prepare($sqlEjercicio);
        $stmtEjercicio->bind_param("i", $idEjercicio);
        $stmtEjercicio->execute();
        $resultadoEjercicio = $stmtEjercicio->get_result();
        $filaEjercicio = $resultadoEjercicio->fetch_assoc();
        
        if (!$filaEjercicio) {
            return json_encode(["error" => "El id_ejercicio proporcionado no es válido."]);
        }
        
        $ano = $filaEjercicio['ano'];
        $fechaElaboracion = "$ano-01-01";
        
        // Validación de dimensiones
        $dimensionesPermitidas = ['politica', 'cultura', 'socio_productivo', 'social_educativa', 'salud', 'seguridad', 'servicios', 'ambiente'];
        if (isset($data['dimensiones'])) {
            foreach ($data['dimensiones'] as $dimension) {
                // Verificar si el nombre de la dimensión es uno de los permitidos
                if (!in_array(strtolower($dimension['nombre']), $dimensionesPermitidas)) {
                    return json_encode(["error" => "Las dimensiones deben contener los textos válidos: 'politica', 'cultura', 'socio_productivo', 'social_educativa', 'salud', 'seguridad', 'servicios' y 'ambiente'."]);
                }
            }
        }
        
        // Iniciar transacción
        $conexion->begin_transaction();
        
        // Insertar en plan_operativo
        $sqlInsertar = "INSERT INTO plan_operativo (id_ente, objetivo_general, objetivos_especificos, estrategias, accciones, dimensiones, id_ejercicio, fecha_elaboracion, codigo, status) 
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
        
        $stmtInsertar = $conexion->prepare($sqlInsertar);
        
        // Convertir arrays a JSON
        $objetivosEspecificos = json_encode($data['objetivos_especificos']);
        $estrategias = json_encode($data['estrategias']);
        $accciones = json_encode($data['accciones']);
        $dimensiones = json_encode($data['dimensiones']);
        
        $stmtInsertar->bind_param("issssssis", $idEnte, $data['objetivo_general'], $objetivosEspecificos, $estrategias, $accciones, $dimensiones, $idEjercicio, $fechaElaboracion, $data['codigo']);
        $stmtInsertar->execute();
        
        if ($stmtInsertar->affected_rows > 0) {
            $conexion->commit();
            return json_encode(["success" => "Registro exitoso"]);
        } else {
            $conexion->rollback();
            return json_encode(["error" => "No se pudo registrar el plan operativo."]);
        }
    } catch (Exception $e) {
        $conexion->rollback();
        registrarError($e->getMessage());
        return json_encode(["error" => $e->getMessage()]);
    }
}



function consultarPlanesOperativos($data)
{
    global $conexion;

    if (!isset($data['id_ejercicio'])) {
        return json_encode(["error" => "No se ha especificado el ID del ejercicio."]);
    }

    $idEnte = $_SESSION["id_ente"];
    $idEjercicio = $data['id_ejercicio'];

    try {
        $conexion->begin_transaction();

        $sql = "SELECT * FROM plan_operativo WHERE id_ente = ? AND id_ejercicio = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("ii", $idEnte, $idEjercicio);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                // Decodificar JSON de dimensiones
                $row['dimensiones'] = json_decode($row['dimensiones'], true);
            }
        } else {
            $conexion->rollback();
            return json_encode(["success" => "No se encontraron registros en plan_operativo."]);
        }

        // Consultar la información del ente
        $sqlEnte = "SELECT * FROM entes WHERE id = ?";
        $stmtEnte = $conexion->prepare($sqlEnte);
        $stmtEnte->bind_param("i", $idEnte);
        $stmtEnte->execute();
        $resultEnte = $stmtEnte->get_result();
        $ente = $resultEnte->fetch_assoc();
        $row['ente'] = $ente ?: null; // Si no se encuentra, se asigna como null

        $conexion->commit();
        return json_encode(["success" => $row]);
    } catch (Exception $e) {
        $conexion->rollback();
        return json_encode(["error" => "Error: " . $e->getMessage()]);
    }
}

function consultarPlanOperativoPorId($data)
{
    global $conexion;

    if (!isset($data['id']) || !isset($data['id_ejercicio'])) {
        return json_encode(["error" => "No se ha especificado ID o ID del ejercicio para la consulta."]);
    }

    $id = $data['id'];
    $idEjercicio = $data['id_ejercicio'];
    $idEnte = $_SESSION["id_ente"];

    try {
        $conexion->begin_transaction();

        $sql = "SELECT * FROM plan_operativo WHERE id = ? AND id_ente = ? AND id_ejercicio = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("iii", $id, $idEnte, $idEjercicio);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            // Decodificar JSON de dimensiones
            $row['dimensiones'] = json_decode($row['dimensiones'], true);
        } else {
            $conexion->rollback();
            return json_encode(["error" => "No se encontró el registro con el ID especificado o el ejercicio no coincide."]);
        }

        // Consultar la información del ente
        $sqlEnte = "SELECT * FROM entes WHERE id = ?";
        $stmtEnte = $conexion->prepare($sqlEnte);
        $stmtEnte->bind_param("i", $idEnte);
        $stmtEnte->execute();
        $resultEnte = $stmtEnte->get_result();
        $ente = $resultEnte->fetch_assoc();
        $row['ente'] = $ente ?: null; // Si no se encuentra, se asigna como null

        $conexion->commit();
        return json_encode(["success" => $row]);
    } catch (Exception $e) {
        $conexion->rollback();
        return json_encode(["error" => "Error: " . $e->getMessage()]);
    }
}


function actualizarPlanOperativo($data)
{
    global $conexion;

    if (!isset($data['id'], $data['objetivo_general'], $data['objetivos_especificos'], $data['estrategias'], $data['accciones'], $data['dimensiones'], $data['id_ejercicio'], $data['codigo'])) {
        return json_encode(["error" => "Faltan datos o el ID para actualizar el plan operativo."]);
    }

    $idEnte = $_SESSION['id_ente'];
    $idPlan = $data['id'];

    try {
        // Verificar el estado del plan operativo
        $sqlVerificar = "SELECT status FROM plan_operativo WHERE id = ? AND id_ente = ?";
        $stmtVerificar = $conexion->prepare($sqlVerificar);
        $stmtVerificar->bind_param("ii", $idPlan, $idEnte);
        $stmtVerificar->execute();
        $resultadoVerificar = $stmtVerificar->get_result();
        $filaVerificar = $resultadoVerificar->fetch_assoc();

        if (!$filaVerificar) {
            return json_encode(["error" => "El plan operativo no existe."]);
        }

        if ($filaVerificar['status'] == 1) {
            return json_encode(["error" => "No se puede modificar el plan operativo porque está en estado aprobado (status = 1)."]);
        }

        // Validación de dimensiones
        $dimensionesPermitidas = ['politica', 'cultura', 'socio_productivo', 'social_educativa', 'salud', 'seguridad', 'servicios', 'ambiente'];
        foreach ($data['dimensiones'] as $dimension) {
            if (!in_array(strtolower($dimension['nombre']), $dimensionesPermitidas)) {
                return json_encode(["error" => "Las dimensiones deben contener los textos válidos: 'politica', 'cultura', 'socio_productivo', 'social_educativa', 'salud', 'seguridad', 'servicios' y 'ambiente'."]);
            }
        }

        $conexion->begin_transaction();

        $sql = "UPDATE plan_operativo SET objetivo_general = ?, objetivos_especificos = ?, estrategias = ?, accciones = ?, dimensiones = ?, id_ejercicio = ?, codigo = ? WHERE id = ? AND id_ente = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("ssssssisi", $data['objetivo_general'], json_encode($data['objetivos_especificos']), json_encode($data['estrategias']), json_encode($data['accciones']), json_encode($data['dimensiones']), $data['id_ejercicio'], $data['codigo'], $data['id'], $idEnte);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            $conexion->commit();
            return json_encode(["success" => "Plan operativo actualizado con éxito."]);
        } else {
            $conexion->rollback();
            return json_encode(["error" => "No se pudo actualizar el plan operativo o no hubo cambios."]);
        }
    } catch (Exception $e) {
        $conexion->rollback();
        return json_encode(["error" => "Error: " . $e->getMessage()]);
    }
}

function eliminarPlanOperativo($data)
{
    global $conexion;

    if (!isset($data['id'])) {
        return json_encode(["error" => "No se ha especificado ID para eliminar."]);
    }

    $idEnte = $_SESSION['id_ente'];
    $idPlan = $data['id'];

    try {
        // Verificar el estado del plan operativo
        $sqlVerificar = "SELECT status FROM plan_operativo WHERE id = ? AND id_ente = ?";
        $stmtVerificar = $conexion->prepare($sqlVerificar);
        $stmtVerificar->bind_param("ii", $idPlan, $idEnte);
        $stmtVerificar->execute();
        $resultadoVerificar = $stmtVerificar->get_result();
        $filaVerificar = $resultadoVerificar->fetch_assoc();

        if (!$filaVerificar) {
            return json_encode(["error" => "El plan operativo no existe."]);
        }

        if ($filaVerificar['status'] == 1) {
            return json_encode(["error" => "No se puede eliminar el plan operativo porque está en estado aprobado (status = 1)."]);
        }

        $conexion->begin_transaction();

        $sql = "DELETE FROM plan_operativo WHERE id = ? AND id_ente = ?";
        $stmt = $conexion->prepare($sql);
        $stmt->bind_param("ii", $idPlan, $idEnte);
        $stmt->execute();

        if ($stmt->affected_rows > 0) {
            $conexion->commit();
            return json_encode(["success" => "Plan operativo eliminado con éxito."]);
        } else {
            $conexion->rollback();
            return json_encode(["error" => "No se pudo eliminar el plan operativo."]);
        }
    } catch (Exception $e) {
        $conexion->rollback();
        return json_encode(["error" => "Error: " . $e->getMessage()]);
    }
}




$data = json_decode(file_get_contents("php://input"), true);
echo gestionarPlanOperativo($data);

 ?>