<?php
require_once '../../back/sistema_global/conexion.php';
require_once '../../back/sistema_global/session.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Pago de nómina</title>
    <!-- [Meta] -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="stylesheet" href="../src/styles/style.css">

</head>
<?php require_once '../includes/header.php' ?>

<body data-pc-preset="preset-1" data-pc-sidebar-caption="true" data-pc-direction="ltr" data-pc-theme="light">
    <div class="loader-bg">
        <div class="loader-track">
            <div class="loader-fill"></div>
        </div>
    </div>

    <?php require_once '../includes/menu.php' ?>
    <!-- [ MENU ] -->

    <?php require_once '../includes/top-bar.php' ?>
    <!-- [ top bar ] -->

    <!-- [ Main Content ] start -->
    <div class="pc-container">
        <div class="pc-content">
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="page-header-title">
                                <h5 class="mb-0">Petición de nomina</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] start -->
            <div class="row mb3">
                <!-- [ worldLow section ] start -->
                <div class="col-xl-12">
                    <div class="card" id="request-historial">
                        <div class="card-header">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <h5 class="mb-0">Peticion de nomina</h5>
                                    <small class="text-muted mt-0">Administre las peticiones de nomina</small>
                                </div>
                            </div>
                        </div>
                        <div class="card-body request-table-container ">

                            <div class="mb-2 mx-auto slide-up-animation" id="request-table">
                                <table id='request-table-historial' class='table table-striped mx-auto'
                                    style='width:100%'>
                                    <thead>
                                        <th class="">CORRELATIVO</th>
                                        <th class="">NOMBRE</th>
                                        <th class="">IDENTIFICADOR</th>
                                        <th class="">FECHA</th>
                                        <th class="">ESTATUS</th>
                                        <th class="">ACCIONES</th>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>

                            <form class="request-step-container hide slide-up-animation" id="form-request-container">
                                <nav class="my-auto nav nav-pills nav-justified">
                                    <span class="nav-link active" data-part="part1">Empezar cálculo</span>
                                    <span class="nav-link" data-part="part2">Verificar empleados</span>
                                    <span class="nav-link" data-part="part3">En revisión</span>
                                </nav>

                                <div class="request-step slide-up-animation" id="request-step-1">
                                    <h5 class="mb-2">Peticion de nomina</h5>
                                    <div class="row">

                                        <div class="mb-2 col-sm-3 ">
                                            <label for="grupo" class="form-label">Grupo de nomina</label>
                                            <small class="text-muted mt-0 d-block mb-2">Seleccione un grupo de
                                                nomina</small>

                                            <select id="grupo" name="grupo" class="form-control" size="4">
                                                <?php
                                                $stmt = mysqli_prepare($conexion, "SELECT id, codigo, nombre FROM `nominas_grupos` ORDER BY codigo");
                                                $stmt->execute();
                                                $result = $stmt->get_result();
                                                if ($result->num_rows > 0) {
                                                    while ($row = $result->fetch_assoc()) {
                                                        echo '<option value="' . $row['id'] . '">' . $row['codigo'] . ' - ' . $row['nombre'] . '</option>';
                                                    }
                                                }
                                                $stmt->close();
                                                ?>
                                            </select>
                                        </div>


                                        <div class="mb-2 col-sm-3 ">
                                            <label for="nomina" class="form-label">Nómina</label>
                                            <small class="text-muted mt-0 d-block mb-2">Seleccione la nómina a
                                                registrar</small>
                                            <select id="nomina" name="nomina" class="form-control" size="4">
                                                <option value="">Seleccionar grupo de nómina</option>
                                            </select>
                                        </div>
                                        <div class="mb-2 col-sm-3  hide slide-up-animation">
                                            <label for="frecuencia" class="form-label">Mes del año</label>
                                            <small class="text-muted mt-0 d-block mb-2">Seleccione el mes</small>

                                            <select id="mes" name="mes" class="form-control" size="4">
                                                <option value="1">Enero</option>
                                                <option value="2">Febrero</option>
                                                <option value="3">Marzo</option>
                                                <option value="4">Abril</option>
                                                <option value="5">Mayo</option>
                                                <option value="6">Junio</option>
                                                <option value="7">Julio</option>
                                                <option value="8">Agosto</option>
                                                <option value="9">Septiembre</option>
                                                <option value="10">Octubre</option>
                                                <option value="11">Noviembre</option>
                                                <option value="12">Diciembre</option>
                                            </select>
                                        </div>
                                        <div class="mb-2 col-sm-3 ">
                                            <label for="frecuencia" class="form-label">Frecuencia</label>
                                            <small class="text-muted mt-0 d-block mb-2">Seleccione cuando se
                                                pagará</small>
                                            <select id="frecuencia" name="frecuencia" class="form-control" size="4">
                                                <option value="">Seleccionar una nómina</option>


                                            </select>
                                        </div>

                                    </div>

                                </div>

                                <div class="request-step hide slide-up-animation" id="request-step-2">
                                    <h5 class="mb-2 text-center">Nomina calculada y lista para solicitar revisión</h5>
                                    <!-- <h3 class="mb-2 text-center" id="">nombre_nomina</h3> -->
                                    <small class="text-muted mb-4 text-center d-block">
                                        ¿Desea realizar cambios a los empleados en nómina?
                                    </small>

                                    <button class="btn btn-secondary btn-sm d-block mx-auto"
                                        id="show-employee-list">Estatus de empleados</button>
                                </div>
                                <div class="request-step hide slide-up-animation" id="request-step-3">
                                    <h5 class="mb-2 text-center">¡Casi listo!</h5>
                                    <h3 class="mb-2 text-center">¡Resumen generado!</h3>
                                    <small class="text-muted mb-4 text-center d-block">
                                        Asignaciones, aportes, deducciones:
                                    </small>
                                    <button class="btn btn-primary btn-lg d-block mx-auto" id="btn-send-request">Generar
                                        Petición</button>
                                </div>

                                <div class="d-flex justify-content-center gap-2 align-items-center">
                                    <button class="btn btn-secondary " id="btn-previus" disabled>Anterior</button>
                                    <button class="btn btn-primary" id="btn-next">Siguiente</button>
                                </div>

                            </form>


                        </div>



                        <!-- <div class="loader-container card-footer py-4" id="employee-pay-loader">
                            <div class="loader"></div>
                        </div> -->
                    </div>

                    <!-- <div class="hide" id="request-form-information">
                        <div class="card">
                            <div class="card-header d-flex align-items-center justify-content-between">

                                <h5 class="mb-0">Información de la petición</h5>
                                <small class="text-muted mt-0">Verifique los datos de la petición</small>

                            </div>
                        </div>
                        <div id="request-form-information-body"></div>
                    </div> -->
                </div>
                <!-- [ worldLow section ] end -->
                <!-- [ Recent Users ] end -->
            </div>
            <!-- [ Main Content ] end -->
        </div>
    </div>


    <!-- [ Main Content ] end -->
    <script type="module" src="../app.js"></script>
    <script src="../../src/assets/js/notificaciones.js"></script>

    <!-- <script type="module" src="../src/controllers/peticionesNominaForm.js"></script> -->
    <script type="module" src="../src/controllers/peticionesHistoricoTable.js"></script>
    <script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.1/js/dataTables.bootstrap5.js"></script>
    <script src="../../src/assets/js/plugins/simplebar.min.js"></script>
    <script src="../../src/assets/js/plugins/bootstrap.min.js"></script>
    <script src="../../src/assets/js/pcoded.js"></script>
    <script src="../../src/assets/js/plugins/feather.min.js"></script>
    <script src="../../src/assets/js/main.js"></script>
    <!-- <script>
        const url_back = '../../back/modulo_nomina/nom_empleados_pagar_back.php';


        function obt_nominas() {
            let grupo = this.value
            if (grupo == '') {
                return
            }
            console.log('grupo')
            $.ajax({
                url: url_back,
                type: 'POST',
                data: {
                    select: true,
                    grupo: grupo
                },
                success: function (response) {
                    $('#nomina').html('<option value="">Selección</option>');
                    if (response) {
                        var data = JSON.parse(response);


                        for (var i = 0; i < data.length; i++) {
                            $('#nomina').append('<option value="' + data[i] + '">' + data[i] + '</option>');
                        }
                    }
                }
            });
        }

        function obt_nomina() {
            let nomina = this.value
            console.log(nomina)
            if (nomina == '') {
                return
            }

            $.ajax({
                url: '../../../sigob/back/modulo_nomina/nom_calculonomina.php',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    nombre: nomina
                }),
                success: function (response) {
                    console.log('Respuesta del servidor:', response);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log('Error en la petición:', textStatus, errorThrown);
                }
            });

        }

        $(document).ready(function () {
            document.getElementById('grupo').addEventListener('change', obt_nominas);
            document.getElementById('nomina').addEventListener('change', obt_nomina);
        });
    </script> -->

</body>

</html>