<?php
require_once '../../back/sistema_global/session.php';
?>

<?php require_once '../includes/header.php' ?>

<head>
  <link rel="stylesheet" href="../src/styles/style.css">

  <title>TABULADORES</title>
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
                <h5 class="mb-0">Tabuladores</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- [ Main Content ] start -->
      <div class="row mb3">

        <div class="col-lg-12 mb-3" id="tabulator-table-view">
          <div class="card">
            <div class="card-header">
              <div class="">
                <h5 class="mb-0">Lista de tabuladores registrados</h5>
                <small class="mt-0 text-muted">Cree y administre los tabuladores</small>
              </div>
            </div>
            <div class="card-body">
              <div class="table-responsive p-1">
                <table id="tabulator-table" class="table table-striped" style="width:100%">
                  <thead class="w-100">
                    <th>NOMBRES</th>
                    <th>PASOS</th>
                    <th>GRADOS</th>
                    <th>AÑOSxPASO</th>
                    <th>ACCIONES</th>
                  </thead>
                  <tbody>

                  </tbody>
                </table>
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
<script type="module" src="../src/controllers/tabuladorTable.js"></script>
<script src="../../src/assets/js/notificaciones.js"></script>

<!-- DATATABLES -->
<script src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.1/js/dataTables.bootstrap5.js"></script>
<script src="../../src/assets/js/plugins/simplebar.min.js"></script>
<script src="../../src/assets/js/plugins/bootstrap.min.js"></script>
<script src="../../src/assets/js/pcoded.js"></script>
<script src="../../src/assets/js/plugins/feather.min.js"></script>

</html>