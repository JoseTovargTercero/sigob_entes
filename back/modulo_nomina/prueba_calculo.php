<?php
require_once '../sistema_global/conexion.php';
require_once '../sistema_global/session.php';


// URL del servidor
$url = 'http://localhost/sigob/back/modulo_nomina/nom_calculonomina.php';

// Datos a enviar (el objeto JSON)
$data = array(
    "nombre" => "003 Obreros Obreros Aguinaldo",
    "identificador" => "p2",
    "frecuencia" => "5",
    "tipo" => "2",
    "concepto_valor_max" => "4",
);

// Convertir el array a formato JSON
$json = json_encode($data);

// Configurar las opciones de la solicitud
$options = array(
    'http' => array(
        'method' => 'POST',
        'header' => 'Content-Type: application/json',
        'content' => $json
    )
);

// Crear el contexto de la solicitud
$context = stream_context_create($options);

// Realizar la solicitud HTTP POST
$result = file_get_contents($url, false, $context);

// Imprimir la respuesta del servidor
echo $result;
?>
