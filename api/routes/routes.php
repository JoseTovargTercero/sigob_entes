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

    // Obtener los datos de la solicitud
    $data = json_decode(file_get_contents('php://input'), true);

    if (!isset($data['accion'])) {
        return ['status' => 500, 'result' => 'Acción no especificada'];
    }

    $accion = $data['accion'];

    if ($path[2] == 'solicitudes') {

        // Variables para las solicitudes
        $dataRequest = [];

        switch ($method) {
            case 'GET':
                if (isset($data['id'])) {
                    // Acción para consultar un registro por ID
                    $dataRequest = ['accion' => 'consulta_id', 'id' => $data['id']];
                    return consultarSolicitudPorId($dataRequest); // Llamar a la función de consulta por ID
                } elseif (isset($data['mes'])) {
                    // Acción para consultar registros por mes
                    $dataRequest = ['accion' => 'consulta_mes', 'mes' => $data['mes']];
                    return consultarSolicitudPorMes($dataRequest); // Llamar a la función de consulta por mes
                } else {
                    // Acción para consultar todos los registros
                    $dataRequest = ['accion' => 'consulta'];
                    return consultarSolicitudes($dataRequest); // Llamar a la función de consulta general
                }

            case 'POST':
                if ($accion === 'gestionar') {
                    // Acción para gestionar la solicitud
                    if (!isset($data['id']) || !isset($data['accion_gestion'])) {
                        return ['status' => 400, 'result' => 'Faltan parámetros para gestionar'];
                    }
                    return gestionarSolicitudDozavos2($data['id'], $data['accion_gestion'], $data['codigo'] ?? '');

                }

                if ($accion === 'registrar') {
                    // Acción para registrar una nueva solicitud
                    return registrarSolicitudozavo($data);
                }

                if ($accion === 'update') {
                    // Acción para actualizar un registro
                    return actualizarSolicitudozavo($data);
                }

                break;

            case 'DELETE':
                if ($accion === 'rechazar') {
                    // Acción para rechazar la solicitud
                    return rechazarSolicitud($data);
                }

                if ($accion === 'delete') {
                    // Acción para eliminar la solicitud
                    return eliminarSolicitudozavo($data);
                }
                break;

            default:
                return ['status' => 405, 'result' => 'Método no permitido'];
        }
    }

    return ['status' => 404, 'result' => 'Ruta no encontrada'];
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


