<?php

require_once 'controllers/routes.controller.php';


header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
// Permitir métodos específicos
header('Access-Control-Allow-Methods: GET, POST, PUT');

$index = new RoutesController();

$index->index();

?>