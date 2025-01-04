<?php


define('HOST', 'localhost');
define('DB', 'sigobnet_sigob_entes');
define('CHARSET', 'utf8mb4');

define('PASSWORD', "");
define('USER', 'root');

$conexion = new mysqli(constant('HOST'), constant('USER'), constant('PASSWORD'), constant('DB'));
$conexion->set_charset(constant('CHARSET'));

if ($conexion->connect_error) {
    die('Error de conexion: ' . $conexion->connect_error);
}

date_default_timezone_set('America/Manaus');

