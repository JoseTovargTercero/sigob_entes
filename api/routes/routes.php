<?php

$path = explode('/', $_SERVER['REQUEST_URI']);
$path = array_filter($path);

$method = $_SERVER['REQUEST_METHOD'];
function validateRoutes($path, $method)
{
    if (count($path) < 3) {
        return ['status' => 404, 'error' => 'No encontrado'];
    }

    $json = ['status' => 200, 'success' => ''];

    $path = explode('?', $path[3]);

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
                    $paramsIdEjercicio = isset($params['id_ejercicio']) ? $params['id_ejercicio'] : null;
                    $dataRequest = ['accion' => 'consulta', 'id_ejercicio' => $paramsIdEjercicio];
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


                }

                if ($accion === 'registrar') {
                    // Acción para registrar una nueva solicitud
                    $dataRequest = array_merge(['id_ejercicio' => $data['id_ejercicio']], $data);
                    $resultado = $solicutudesController->registrarSolicitudozavo($dataRequest); // Llamar a la función de consulta por mes

                }

                if ($accion === 'entregar') {
                    // Acción para actualizar el estado de la solicitud
                    $dataRequest = $data['id'];
                    $resultado = $solicutudesController->actualizarStatusSolicitud($dataRequest); // Llamar a la función de update status

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

                if (!isset($params['id_ejercicio'])) {
                    return ["status" => 200, "error" => "No se ha especificado el ejercicio fiscal"];
                }

                if (isset($params['id'])) {
                    // Acción para consultar un registro por ID
                    $dataRequest = $params['id'];
                    $resultado = $asignacionController->consultarAsignacionPorId($dataRequest);
                } else {
                    // Acción para consultar todos los registros
                    $dataRequest = $params["id_ejercicio"];

                    $resultado = $asignacionController->consultarTodasAsignaciones($dataRequest);
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

                if ($accion === 'consultar_secretarias' && isset($data['id_ejercicio'])) {

                    $dataRequest = $data["id_ejercicio"];

                    $todo = isset($data['todo']) ? $data['todo'] : false;


                    $resultado = $asignacionController->consultarAsignacionesSecretaria($dataRequest, $todo);
                }

                if ($accion === 'consultar_disponibilidad') {
                    $resultado = $asignacionController->consultarDisponibilidad($data['distribuciones'], $data['id_ejercicio']);
                }

                if ($accion === 'actualizar_distribucion') {
                    $resultado = $asignacionController->actualizarDistribucion($data['distribuciones'], $data['id_ejercicio']);
                }



                if (empty($resultado)) {
                    return ['status' => 200, 'error' => 'Accion no permitida'];
                }
                // } elseif ($accion === 'update' && isset($data['id']) && isset($data['id_ente']) && isset($data['monto_total']) && isset($data['id_ejercicio'])) {
                //     // Acción para actualizar una asignación
                //     $dataRequest = $data;
                //     $resultado = $asignacionController->actualizarAsignacionEnte($dataRequest);
                // } else {
                //     $resultado = ['status' => 200, 'error' => 'Acción no válida o faltan datos'];
                // }

                if (array_key_exists('error', $resultado)) {
                    $resultado = ['status' => 200, 'error' => $resultado['error']];
                } else {
                    $resultado = ['status' => 200, 'success' => $resultado['success']];
                }
                return $resultado;

            case 'DELETE':

                // $resultado = [];
                // $data = json_decode(file_get_contents('php://input'), true);

                // if (isset($data['id'])) {
                //     // Acción para eliminar una asignación
                //     $dataRequest = ['id' => $data['id']];
                //     $resultado = $asignacionController->eliminarAsignacionEnte($dataRequest);
                // } else {
                //     $resultado = ['status' => 200, 'error' => 'Faltan datos para eliminar'];
                // }

                // if (array_key_exists('error', $resultado)) {
                //     $resultado = ['status' => 200, 'error' => $resultado['error']];
                // } else {
                //     $resultado = ['status' => 200, 'success' => $resultado['success']];
                // }
                // return $resultado;

            default:
                return ['status' => 200, 'error' => 'Método no permitido'];
        }
    }

    if (
        $path[0] === 'sistema'
    ) {

        require_once dirname(__DIR__, 2) . DIRECTORY_SEPARATOR . "back" . DIRECTORY_SEPARATOR . "sistema_global" . DIRECTORY_SEPARATOR . "conexion.php";
        require_once dirname(__DIR__, 1) . DIRECTORY_SEPARATOR . "controllers" . DIRECTORY_SEPARATOR . "sistema.controller.php";

        $sistemaController = new SistemaController($conexion);

        switch ($method) {
            case 'POST';
                $resultado = [];
                $data = json_decode(file_get_contents('php://input'), true);

                if (!isset($data['accion'])) {
                    return ['status' => 200, 'error' => 'No se ha enviado la acción'];
                }
                $accion = $data['accion'];

                if ($accion === 'actualizar_tablas') {

                    if (!isset($data['informacion'])) {
                        return ['status' => 200, 'error' => 'No se ha enviado la información correctamente'];
                    }

                    $resultado = $sistemaController->actualizarTablas($data['informacion']);
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



            default:
                return ['status' => 200, 'error' => 'Método no permitido'];
        }
    }

    return ['status' => 200, 'error' => "Ruta no encontrada $path[0], $path[1], $path[2], $path[3]"];
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
