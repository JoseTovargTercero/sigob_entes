<?php

//  Permitir solicitudes desde http://localhost 
header("Access-Control-Allow-Origin: *");
// Permitir métodos HTTP específicos 
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
// Permitir encabezados personalizados 
header("Access-Control-Allow-Headers: Content-Type");

require_once 'controllers/routes.controller.php';


$index = new RoutesController();

$index->index();

?>