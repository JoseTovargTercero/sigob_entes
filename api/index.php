<?php

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type, Authorization");
    exit(0); // ¡IMPORTANTE! Detener la ejecución después de enviar los encabezados para OPTIONS
}


header("Access-Control-Allow-Origin: *"); // Reemplaza con el/los origen/es permitidos
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization');
header('Access-Control-Allow-Credentials: true'); // Opcional si se envían credenciales

require_once 'controllers/routes.controller.php';


$index = new RoutesController();

$index->index();

?>