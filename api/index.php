<?php

require_once 'controllers/routes.controller.php';

$allowedOrigins = [
    '',      // Correcto para localhost sin puerto
    'http://localhost:3000', // Correcto para localhost con puerto 3000
    // Añade aquí los orígenes de producción cuando despliegues
];


header('Access-Control-Allow-Origin: http://localhost');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
// Permitir métodos específicos
header('Access-Control-Allow-Methods: GET, POST, PUT');

$index = new RoutesController();

$index->index();

?>