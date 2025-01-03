<?php

$path = explode(separator: '/', string: $_SERVER['REQUEST_URI']);
$path = array_filter($path);

$method = $_SERVER['REQUEST_METHOD'];

function validateRoutes($path, $method)
{

    if (count($path) == 1) {
        return $json = ['status' => 404, 'result' => 'No encontrado'];
    }


    // MODIFICAR RESULTADO A MEDIDA DE QUE SE OBTENGAN LOS DATOS
    $json = ['status' => 200, 'result' => ''];

    $data = json_decode(file_get_contents('php://input'), true);

    if (isset($data['accion'])) {
        return $json = ['status' => 500, 'result' => 'Acción no especificada'];
    }

    $accion = $data['accion'];

    if ($path) {
        if ($path[2] == 'solicitudes') {

            $dataRequest = [];

            switch ($method) {
                case $method == 'GET':
                    $dataRequest = isset($data['id']) ? json_encode(['accion' => 'consulta_id', 'id' => $data['id']]) : json_encode(['accion' => 'consulta']);

                    // FUNCIONES PARA CONSULTAR SOLICITUDES

                    break;
                case $method == 'POST':

                    if ($accion === 'gestionar') {
                        $dataRequest = json_encode(['accion' => $accion, 'accion_gestion' => $data['accion_gestion'], 'id' => $data['id']]);

                        // FUNCIÓN PARA GESTIONAR
                    }

                    if ($accion === 'registrar') {
                        $dataRequest = json_encode(['accion' => $accion]);

                        // FUNCIÓN PARA REGISTRAR
                    }





                    $json['result'] = 'POST';
                    break;
                // case $method == 'DELETE':
                //     $json['result'] = 'DELETE';
                //     break;
            }
        }
    }


    return $json;
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


