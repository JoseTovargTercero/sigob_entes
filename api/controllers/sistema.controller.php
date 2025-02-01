<?php



header('Content-Type: application/json');
// require_once '../../back/modulo_entes/pre_compromisos.php';




class SistemaController
{
    public function __construct($conexion)
    {
        $this->conexion = $conexion;
    }

    private $conexion;

    public function actualizarTablas($informacion)
    {

        $this->conexion->begin_transaction(); // Iniciar transacción

        try {
            $respuestas = [];
            foreach ($informacion as $datos) {

                $tabla = $datos["tabla"];
                $datos = $datos["datos"];

                $resultado = $this->compararDatos($tabla, $datos);

                if (!empty($resultado)) {
                    $insercion = $this->insertarDatos($tabla, $resultado);
                    if (isset($insercion["error"])) {
                        throw new Exception($insercion["error"]);
                    }
                    if ($insercion["success"] !== true) {
                        throw new Exception($insercion["error"]); // Lanzar excepción si falla la inserción
                    }
                }
                $respuestas[] = ["tabla" => $tabla, "resultado" => count($resultado) . " registros insertados"];
            }


            $this->conexion->commit();
            return ["success" => ["mensaje" => "Tablas actualizadas correctamente", "respuestas" => $respuestas]];

        } catch (Exception $e) {
            $this->conexion->rollback();
            return ["error" => $e->getMessage()];

        }
    }

    private function insertarDatos($tabla, $datos)
    {
        try {
            foreach ($datos as $dato) { // Iterar sobre los datos a insertar
                $campos = array_keys($dato);
                $valores = array_values($dato);

                $placeholders = str_repeat('?, ', count($valores) - 1) . '?';
                $sql = "INSERT INTO $tabla (" . implode(", ", $campos) . ") VALUES ($placeholders)";
                $stmt = $this->conexion->prepare($sql);

                // Bind de los parámetros en la consulta de inserción
                $tipos = str_repeat('s', count($valores)); // Asumimos que todos los valores son strings
                $stmt->bind_param($tipos, ...$valores);

                $stmt->execute();

                if (!$stmt) {
                    throw new Exception("Error al insertar datos en la tabla $tabla: " . $stmt->error);
                }
            }
            return ["success" => true];
        } catch (Exception $e) {
            return ["error" => $e->getMessage()];
        }
    }

    private function compararDatos($tabla, $datosNuevos)
    {
        $registros = $this->consultarTablas($tabla);
        $datos = $this->filtrarDatos($datosNuevos, $registros);
        return $datos;
    }

    private function filtrarDatos($datos, $registros)
    {
        $datosFiltrados = [];
        foreach ($datos as $dato) {
            $existe = false;
            foreach ($registros as $registro) {
                if ($dato["id"] == $registro['id']) {
                    $existe = true;
                    break;
                }
            }

            if (!$existe) {
                $datosFiltrados[] = $dato;
            }

        }
        return $datosFiltrados;
    }

    private function consultarTablas($tablaName)
    {

        try {
            $sql = "SELECT * FROM $tablaName";
            $stmt = $this->conexion->prepare($sql);

            $stmt->execute();

            if (!$stmt) {
                throw new Exception("Error al consultar la tabla $tablaName");
            }

            $result = $stmt->get_result();
            $data = [];
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }

            return $data;

        } catch (Exception $e) {
            return ["error" => $e->getMessage()];
        }



    }



}








