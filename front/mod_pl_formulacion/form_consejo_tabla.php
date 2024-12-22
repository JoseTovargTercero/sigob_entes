<?php
require_once '../../back/sistema_global/session.php';
?>

<?php require_once '../includes/header.php' ?>

<head>
    <title>Distribución presupuestarias</title>

    <link rel="stylesheet" href="../src/styles/style.css">
    <link rel="stylesheet" href="../../src/assets/css/chosen.min.css">

    <script src="../../src/assets/js/chosen.jquery.min.js"></script>
</head>

<body>
    <?php require_once '../includes/menu.php' ?>
    <!-- [ MENU ] -->

    <?php require_once '../includes/top-bar.php' ?>
    <!-- [ top bar ] -->

    <div class="pc-container">
        <div class="pc-content">
            <div class="page-header">
                <div class="page-block">
                    <div class="row align-items-center">
                        <div class="col-md-12">
                            <!-- <div class="page-header-title">
                <h5 class="mb-0"></h5>
              </div> -->

                            <div class=" d-flex justify-content-between">
                                <h4 class="fw-bold py-3 mb-4">
                                    <span class="text-muted fw-light">Formulación / </span>
                                    <span class="text-muted fw-light">Teoría y leyes /</span> Consejo
                                </h4>
                                <!-- <div class="row" id="ejercicios-fiscales">
                                </div> -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ Main Content ] start -->
            <div class="row mb3">

                <div class="col-lg-12 mb-3" id="consejo-view">
                    <div class="card">
                        <div class="card-header d-flex justify-content-between">
                            <div class="">
                                <h5 class="mb-0">Información de ente legislativo</h5>
                                <small class="mt-0 text-muted">Actualice la información del ente legislativo</small>
                            </div>

                        </div>
                        <div class="card-body" id="consejo-view-body">
                            <!-- <div class="table-responsive p-1">
                                <table id="consejo-table" class="table table-striped" style="width:100%">
                                    <thead class="w-100">

                                        <th>PRESIDENTE</th>
                                        <th>SECRETARIO</th>

                                        <th>DOMICILIO</th>
                                        <th>TELEFONO</th>
                                        <th>WEB</th>
                                        <th>EMAIL</th>
                                        <th>CONSEJO LOCAL</th>
                                        <th>ACCIONES</th>

                                    </thead>

                                </table> -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- [ worldLow section ] end -->
            <!-- [ Recent Users ] end -->
        </div>
        <!-- [ Main Content ] end -->
    </div>
    </div>


















</body>

<script type="module" src="../app.js"></script>

<script src="../../src/assets/js/notificaciones.js"></script>

<!-- DATATABLES -->
<script src="../../src/assets/js/plugins/simplebar.min.js"></script>
<script src="../../src/assets/js/plugins/bootstrap.min.js"></script>
<script src="../../src/assets/js/pcoded.js"></script>
<script src="../../src/assets/js/plugins/feather.min.js"></script>

</html>