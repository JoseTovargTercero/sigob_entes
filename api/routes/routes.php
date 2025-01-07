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
        $path[0] === 'solicitudes'
    ) {

        require_once dirname(__DIR__, 2) . DIRECTORY_SEPARATOR . "back" . DIRECTORY_SEPARATOR . "sistema_global" . DIRECTORY_SEPARATOR . "conexion.php";
        require_once '.../../controllers/solicitudes.controller.php';

        $solicutudesController = new SolicitudesController($conexion);

        // Variables para las solicitudes
        $dataRequest = [];

        switch ($method) {
            case 'GET':

                $resultado = [];

                $params = $_GET;

                // if (!isset($params['id_ejercicio'])) {
                //     return ['status' => 400, 'error' => 'Falta el id del ejercicio'];
                // }

                if (isset($params['id'])) {
                    // Acción para consultar un registro por ID
                    $dataRequest = ['accion' => 'consulta_id', 'id' => $params['id']];
                    $resultado = $solicutudesController->consultarSolicitudPorId($dataRequest); // Llamar a la función de consulta por mes
                }
                // if (isset($params['mes'])) {
                //     // Acción para consultar registros por mes
                //     $dataRequest = ['accion' => 'consulta_mes', 'mes' => $params['mes'], 'id_ejercicio' => $params['id_ejercicio']];
                //     $resultado = $solicutudesController->consultarSolicitudPorMes($dataRequest); // Llamar a la función de consulta por mes
                // } 
                else {
                    // Acción para consultar todos los registros
                    $dataRequest = ['accion' => 'consulta'];
                    $resultado = $solicutudesController->consultarSolicitudes($dataRequest);

                }

                if (array_key_exists('error', $resultado)) {
                    $resultado = ['status' => 200, 'error' => $resultado['error']];
                } else {
                    $resultado = ['status' => 200, 'success' => $resultado['success']];
                }
                return $resultado;

            case 'POST':

                $resultado = [];
                $data = json_decode(file_get_contents('php://input'), true);


                if (!isset($data['accion'])) {
                    return ['status' => 200, 'error' => 'No se ha enviado la acción'];
                }
                $accion = $data['accion'];

                if ($accion === 'gestionar') {
                    // Acción para gestionar la solicitud
                    if (!isset($data['id']) || !isset($data['accion_gestion'])) {
                        return ['status' => 200, 'error' => 'Faltan parámetros para gestionar'];
                    }
                    $dataRequest = $data;
                    $resultado = $solicutudesController->gestionarSolicitudDozavos2($dataRequest["id"], $dataRequest["accion_gestion"], $data['codigo'] ?? ''); // Llamar a la función de consulta por mes

                    if (array_key_exists('compromiso', $resultado)) {
                        return ['status' => 200, 'success' => $resultado['success'], "compromiso" => $resultado['compromiso']];
                    }
                }

                if ($accion === 'registrar') {
                    // Acción para registrar una nueva solicitud
                    $dataRequest = array_merge(['id_ejercicio' => $data['id_ejercicio']], $data);
                    $resultado = $solicutudesController->registrarSolicitudozavo($dataRequest); // Llamar a la función de consulta por mes

                }

                if (empty($resultado)) {
                    return ['status' => 200, 'error' => 'Accion no permitida'];
                }

                if (array_key_exists('error', $resultado)) {
                    $resultado = ['status' => 200, 'error' => $resultado['error']];
                } else {
                    $resultado = ['status' => 200, 'success' => $resultado['success']];
                }
                return $resultado;




            case 'DELETE':
            // if ($accion === 'rechazar') {
            //     // Acción para rechazar la solicitud
            //     return rechazarSolicitud($data);
            // }

            // if ($accion === 'delete') {
            //     // Acción para eliminar la solicitud
            //     return eliminarSolicitudozavo($data);
            // }
            // break;

            default:
                return ['status' => 200, 'error' => 'Método no permitido'];
        }
    }

    return ['status' => 200, 'error' => 'Ruta no encontrada'];
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


