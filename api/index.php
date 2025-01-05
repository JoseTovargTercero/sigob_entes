<?php

require_once 'controllers/routes.controller.php';

// CORS
// Permitir acceso desde cualquier origen
header('Access-Control-Allow-Origin: *');
// Permitir métodos específicos
header('Access-Control-Allow-Methods: GET, POST, PUT');

$index = new RoutesController();

$index->index();

?>