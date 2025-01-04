<?php

$path = explode('/', $_SERVER['REQUEST_URI']);
$path = array_filter($path);

$method = $_SERVER['REQUEST_METHOD'];

function validateRoutes($path, $method)
{
    if (count($path) < 2) {
        return ['status' => 404, 'result' => 'No encontrado'];
    }

    $json = ['status' => 200, 'result' => ''];
    $path = explode('?', $path[2]);

    if ($path[0] === 'solicitudes') {
        require_once '../../config/conexion.php';
        require_once '../../controllers/solicitudes.controller.php';

        $solicitudesController = new SolicitudesController($conexion);

        switch ($method) {
            case 'GET':
                return handleGetRequest($solicitudesController);

            case 'POST':
                return handlePostRequest($solicitudesController);

            case 'DELETE':
                return handleDeleteRequest($solicitudesController);

            default:
                return ['status' => 405, 'result' => 'Método no permitido'];
        }
    }

    return ['status' => 404, 'result' => 'Ruta no encontrada'];
}

function handleGetRequest($controller)
{
    $params = $_GET;

    if (!isset($params['id_ejercicio'])) {
        return ['status' => 400, 'result' => 'Falta el id del ejercicio'];
    }

    $dataRequest = [];
    if (isset($params['id'])) {
        $dataRequest = ['accion' => 'consulta_id', 'id' => $params['id'], 'id_ejercicio' => $params['id_ejercicio']];
        $resultado = $controller->consultarSolicitudPorId($dataRequest);
    } elseif (isset($params['mes'])) {
        $dataRequest = ['accion' => 'consulta_mes', 'mes' => $params['mes'], 'id_ejercicio' => $params['id_ejercicio']];
        $resultado = $controller->consultarSolicitudPorMes($dataRequest);
    } else {
        $dataRequest = ['accion' => 'consulta', 'id_ejercicio' => $params['id_ejercicio']];
        $resultado = $controller->consultarSolicitudes($dataRequest);
    }

    return processResult($resultado);
}

function handlePostRequest($controller)
{
    $data = json_decode(file_get_contents('php://input'), true);

    if (!isset($data['accion'])) {
        return ['status' => 400, 'result' => 'Falta la acción'];
    }

    switch ($data['accion']) {
        case 'gestionar':
            if (!isset($data['id'], $data['accion_gestion'])) {
                return ['status' => 400, 'result' => 'Faltan parámetros para gestionar'];
            }
            return $controller->gestionarSolicitudDozavos2($data['id'], $data['accion_gestion'], $data['codigo'] ?? '');

        case 'registrar':
            return $controller->registrarSolicitudozavo($data);

        case 'update':
            return $controller->actualizarSolicitudozavo($data);

        default:
            return ['status' => 400, 'result' => 'Acción no válida'];
    }
}

function handleDeleteRequest($controller)
{
    $data = json_decode(file_get_contents('php://input'), true);

    if (!isset($data['accion'])) {
        return ['status' => 400, 'result' => 'Falta la acción'];
    }

    switch ($data['accion']) {
        case 'rechazar':
            return $controller->rechazarSolicitud($data);

        case 'delete':
            return $controller->eliminarSolicitudozavo($data);

        default:
            return ['status' => 400, 'result' => 'Acción no válida'];
    }
}

function processResult($resultado)
{
    if (isset($resultado['error'])) {
        return ['status' => 400, 'result' => $resultado['error']];
    }

    return ['status' => 200, 'result' => $resultado];
}

$json = validateRoutes($path, $method);

echo json_encode($json, http_response_code($json['status']));


// if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_SERVER['REQUEST_URI'])) {
//     $uri = $_SERVER['REQUEST_URI'];
//     $segments = explode('/', trim($uri, '/'));

//     if (count($segments) >= 2 && $segments[0] === 'api' && $segments[1] === 'solicitudes') {
//         // Handle the solicitudes functionality
//         header('Content-Type: application/json');
//         echo json_encode(['message' => 'Handling solicitudes']);
//     } else {
//         // Invalid endpoint
//         http_response_code(404);
//         echo json_encode(['error' => 'Endpoint not found']);
//     }
// } else {
//     // Invalid method
//     http_response_code(405);
//     echo json_encode(['error' => 'Method not allowed']);
// }


