<?php
require_once '../../back/sistema_global/session.php';
?>

<?php require_once '../includes/header.php' ?>

<head>
  <link rel="stylesheet" href="../src/styles/style.css">
  <title>PERSONAL</title>
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
              <div class="page-header-title">
                <h5 class="mb-0">Control de peticiones de nómina</h5>
                <small class="text-muted mt-0 d-block mb-2">Consulte la nómina a revisar</small>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- [ Main Content ] start -->
      <div class="row mb3">
        <!-- [ worldLow section ] start -->
        <div class="col-xl-12 mb-3">
          <div class="card mx-auto" id="request-nom-form">
            <div class="card-header">
              <div>
                <h5 class="mb-0">Peticiones de pago</h5>
                <small class="mt-0 text-muted">Revisar las peticiones de nómina</small>
              </div>
            </div>
            <div class="card-body d-block" id="employee-table-container">
              <table id="regcon-request-table" class="table table-sm table-striped" style="width:100%">
                <thead class="w-100">
                  <th class="">CORRELATIVO</th>
                  <th class="">NOMBRE</th>
                  <th class="">IDENTIFICADOR</th>
                  <th class="">FECHA DE SOLICITUD</th>
                  <th class="">ACCIONES</th>
                </thead>
                <tbody>

                </tbody>
              </table>
            </div>
            <!-- <div class="card-body col-lg-8 mx-auto">
              <div></div>
              <div class="forum-group">
                <div class="row mx-auto align-items-end">
                  <div class="col-lg-8">
                    <label for="nomina" class="form-label">Seleccionar nómina</label>
                    <small class="text-muted mt-0 d-block mb-2">Seleccione la nómina a registrar</small>
                    <select id="select-nomina" name="select-nomina" class="form-control">
                      <option value="">Seleccionar petición de nómina</option>
                    </select>
                  </div>
                  <div class="col-lg-2 align-items-center">
                    <button class="btn btn-primary" id="consultar-nomina">Consultar</button>
                  </div>
                </div>
              </div>

            </div> -->
          </div>
          <div class="request-informacion hide slide-up-animation" id="request-information">

            <div class='d-flex justify-content-center gap-2 mb-2'>
              <button class='btn btn-secondary btn-lg' id="reset-request">DESHACER</button>
              <button class='btn btn-danger btn-lg' id="deny-request" data-correlativo="">RECHAZAR</button>
              <button class='btn btn-primary btn-lg' id="confirm-request"
                data-correlativo="${registro_actual.correlativo}">CONFIRMAR</button>
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
<!-- DATATABLES -->
<script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.1/js/dataTables.bootstrap5.js"></script>
<script src="../../src/assets/js/plugins/simplebar.min.js"></script>
<script src="../../src/assets/js/plugins/bootstrap.min.js"></script>
<script src="../../src/assets/js/pcoded.js"></script>
<script src="../../src/assets/js/plugins/feather.min.js"></script>
<script src="../../src/assets/js/notificaciones.js"></script>

</html>