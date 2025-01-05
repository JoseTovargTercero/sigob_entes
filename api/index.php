<?php

require_once 'controllers/routes.controller.php';

$allowedOrigins = [
    'http://localhost',      // Correcto para localhost sin puerto
    'http://localhost:3000', // Correcto para localhost con puerto 3000
    // Añade aquí los orígenes de producción cuando despliegues
];

if (isset($_SERVER['HTTP_ORIGIN']) && in_array($_SERVER['HTTP_ORIGIN'], $allowedOrigins)) {
    header('Access-Control-Allow-Origin: ' . $_SERVER['HTTP_ORIGIN']);
} else {
    header('Access-Control-Allow-Origin: *');
}
// Permitir métodos específicos
header('Access-Control-Allow-Methods: GET, POST, PUT');

$index = new RoutesController();

$index->index();

?>