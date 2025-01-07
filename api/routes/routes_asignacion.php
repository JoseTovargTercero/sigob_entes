<?php

$path = explode('/', $_SERVER['REQUEST_URI']);
$path = array_filter($path);

$method = $_SERVER['REQUEST_METHOD'];
function validateRoutes($path, $method)
{
    if (count($path) < 2) {
        return ['status' => 404, 'error' => 'No encontrado'];
    }

    $json = ['status' => 200, 'success' => ''];

    $path = explode('?', $path[2]);

    if (
        $path[0] === 'asignaciones'
    ) {

        require_once dirname(__DIR__, 2) . DIRECTORY_SEPARATOR . "back" . DIRECTORY_SEPARATOR . "sistema_global" . DIRECTORY_SEPARATOR . "conexion.php";
        require_once '.../../controllers/asignacion.controller.php';

        $asignacionController = new AsignacionController($conexion);

        // Variables para las asignaciones
        $dataRequest = [];

        switch ($method) {
            case 'GET':

                $resultado = [];

                $params = $_GET;

                if (isset($params['id'])) {
                    // Acción para consultar un registro por ID
                    $dataRequest = ['accion' => 'consultar_por_id', 'id' => $params['id']];
                    $resultado = $asignacionController->consultarAsignacionPorId($dataRequest);
                } else {
                    // Acción para consultar todos los registros
                    $dataRequest = ['accion' => 'consultar'];
                    $resultado = $asignacionController->consultarTodasAsignaciones($dataRequest);
                }

                if (array_key_exists('error', $resultado)) {
                    $resultado = ['status' => 400, 'error' => $resultado['error']];
                } else {
                    $resultado = ['status' => 200, 'success' => $resultado['success']];
                }
                return $resultado;

            case 'POST':

                $resultado = [];
                $data = json_decode(file_get_contents('php://input'), true);

                if (!isset($data['accion'])) {
                    return ['status' => 400, 'error' => 'No se ha enviado la acción'];
                }
                $accion = $data['accion'];

                if ($accion === 'insert' && isset($data['id_ente']) && isset($data['monto_total']) && isset($data['id_ejercicio'])) {
                    // Acción para insertar una asignación
                    $dataRequest = $data;
                    $resultado = $asignacionController->insertarAsignacionEnte($dataRequest);
                } elseif ($accion === 'update' && isset($data['id']) && isset($data['id_ente']) && isset($data['monto_total']) && isset($data['id_ejercicio'])) {
                    // Acción para actualizar una asignación
                    $dataRequest = $data;
                    $resultado = $asignacionController->actualizarAsignacionEnte($dataRequest);
                } else {
                    $resultado = ['status' => 400, 'error' => 'Acción no válida o faltan datos'];
                }

                if (array_key_exists('error', $resultado)) {
                    $resultado = ['status' => 400, 'error' => $resultado['error']];
                } else {
                    $resultado = ['status' => 200, 'success' => $resultado['success']];
                }
                return $resultado;

            case 'DELETE':

                $resultado = [];
                $data = json_decode(file_get_contents('php://input'), true);

                if (isset($data['id'])) {
                    // Acción para eliminar una asignación
                    $dataRequest = ['id' => $data['id']];
                    $resultado = $asignacionController->eliminarAsignacionEnte($dataRequest);
                } else {
                    $resultado = ['status' => 400, 'error' => 'Faltan datos para eliminar'];
                }

                if (array_key_exists('error', $resultado)) {
                    $resultado = ['status' => 400, 'error' => $resultado['error']];
                } else {
                    $resultado = ['status' => 200, 'success' => $resultado['success']];
                }
                return $resultado;

            default:
                return ['status' => 405, 'error' => 'Método no permitido'];
        }
    }

    return ['status' => 404, 'error' => 'Ruta no encontrada'];
}

$json = validateRoutes($path, $method);

echo json_encode($json, http_response_code($json['status']));

?>
