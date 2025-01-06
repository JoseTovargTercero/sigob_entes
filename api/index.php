<?php

//  Permitir solicitudes desde http://localhost 
header("Access-Control-Allow-Origin: http://localhost");
// Permitir métodos HTTP específicos 
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
// Permitir encabezados personalizados 
header("Access-Control-Allow-Headers: Content-Type");

require_once 'controllers/routes.controller.php';


header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
// Permitir métodos específicos
header('Access-Control-Allow-Methods: GET, POST, PUT, OPTIONS');

$index = new RoutesController();

$index->index();

?>