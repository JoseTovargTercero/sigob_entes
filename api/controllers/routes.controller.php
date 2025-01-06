<?php

header("Access-Control-Allow-Origin: *"); // Reemplaza con el/los origen/es permitidos
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header('Access-Control-Allow-Headers: Origin, Content-Type, Authorization');
header('Access-Control-Allow-Credentials: true'); // Opcional si se envían credenciales

class RoutesController
{
    public function index()
    {

        // Cargar las variables del archivo .env
        $this->loadEnv(dirname(__DIR__) . DIRECTORY_SEPARATOR . ".env");

        // Obtener la API key desde el archivo .env
        $apiKeyEnv = $_ENV['API_KEY'] ?? null;

        // Obtener los encabezados de la solicitud
        $headers = getallheaders();

        // Verificar si el encabezado Authorization está presente
        if (!isset($headers['Authorization'])) {
            http_response_code(401);
            echo json_encode(["status" => "error", "message" => "Authorization header missing"]);
            exit;
        }

        // Obtener la API key del encabezado Authorization
        $apiKeyHeader = $headers['Authorization'];

        // Comparar la API key del encabezado con la del archivo .env
        if ($apiKeyEnv === $apiKeyHeader) {
            // API key correcta, gestionar la petición
            include_once './routes/routes.php';
        } else {
            // API key incorrecta
            http_response_code(403);
            echo json_encode(["status" => "error", "message" => "Invalid API key"]);
            exit;
        }
    }

    private function loadEnv($filePath)
    {
        if (!file_exists($filePath)) {
            throw new Exception("El archivo .env no se encuentra en $filePath");
        }

        $lines = file($filePath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

        foreach ($lines as $line) {
            if (strpos(trim($line), '#') === 0) {
                continue;
            }

            list($key, $value) = explode('=', $line, 2);
            $key = trim($key);
            $value = trim($value, '"');

            $_ENV[$key] = $value;
            $_SERVER[$key] = $value;
        }
    }
}
