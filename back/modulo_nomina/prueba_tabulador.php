<?php


// URL del servidor
$url = 'http://localhost/sigob/back/modulo_nomina/nom_tabulador_registro.php/';

// Datos a enviar (el objeto JSON)
$data = array(
    "nombre" => "tabulador_regional_001",
    "grados" => 3,
    "pasos" => 3,
    "aniosPasos" => 5,
    "tabulador" => [
        ["G1", "P1", 1],
        ["G1", "P2", 2],
        ["G1", "P3", 3],
        ["G2", "P1", 4],
        ["G2", "P2", 5],
        ["G2", "P3", 6],
        ["G3", "P1", 7],
        ["G3", "P2", 8],
        ["G3", "P3", 246.15]
    ]
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
