<?php


// URL del servidor
$url = 'http://localhost/sigob/back/modulo_nomina/nom_comparacion_nominas.php/';

// Datos a enviar (el objeto JSON)
$data = array(
    "correlativo" => "00002",
    "nombre_nomina" => "Obreros",
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
