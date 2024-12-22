<?php
require_once '../../back/sistema_global/conexion.php';
require_once '../../back/sistema_global/session.php';

$titulo = 'Programas';


?>
<!DOCTYPE html>
<html lang="es">

<head>
  <title><?php echo $titulo ?></title>
  <!-- [Meta] -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">



  <style>
    table tr td:nth-child(1),
    table tr td:nth-child(2),
    table tr th:nth-child(1),
    table tr th:nth-child(2) {
      text-align: center !important;
      /* Alineación al centro, puedes cambiarla a 'left' o 'right' */
    }
  </style>

</head>
<?php require_once '../includes/header.php' ?>
<script src="../../src/assets/js/chosen.jquery.min.js"></script>
<link rel="stylesheet" href="../../src/assets/css/chosen.min.css">

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




      <div class=" d-flex justify-content-between">
        <h4 class="fw-bold py-3 mb-4">
          <span class="text-muted fw-light">Formulación /</span> <?php echo $titulo ?>
        </h4>
      </div>





      <div class="row ">
        <div class="col-lg-12" id="vista_registro">
          <div class="card">
            <div class="card-body">
              <div class="d-flex flex-column">
                <div class="card-title mb-auto d-flex justify-content-between">
                  <h5 class="mb-0">Nuevo programa</h5>

                </div>


                <div class="mt-2 card-body">

                  <div class="mb-3">
                    <label for="partida" class="form-label">Denominación</label>
                    <input type="text" id="nombre" class="form-control" placeholder="Nombre del programa">
                  </div>

                  <div class="mb-4">
                    <label for="sector" class="form-label">Sector</label>
                    <select id="sector" name="sector" class="form-control chosen-select">
                      <option value="">Seleccione</option>
                    </select>
                  </div>

                  <div class="mb-3">
                    <label for="programa" class="form-label">Programa</label>
                    <input type="number" min="0" class="form-control" id="programa" name="programa" placeholder="Programa">
                  </div>


                  <div class="mb-3 d-flex justify-content-between">
                    <button class="btn btn-secondary" id="btn-cancelar-registro">Cancelar</button>
                    <button class="btn btn-primary" id="btn-registro">Guardar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>


        <div class="col-lg-12" id="vista-tabla">
          <div class="card">
            <div class="card-body">
              <div class="d-flex flex-column">
                <div class="card-title mb-auto d-flex justify-content-between">
                  <h5 class="mb-0"><?php echo $titulo ?></h5>
                  <button class="btn btn-info btn-sm" onclick="nuevoProyecto()">
                    <i class="bx bx-plus"></i>
                    Nuevo programa
                  </button>
                </div>


                <div class="mt-2 card-body">

                  <table class="table" id="table">
                    <thead>
                      <tr>
                        <th style="width: 5%;">#</th>
                        <th>Sector</th>
                        <th>Programa</th>
                        <th>Nombre</th>
                        <th style="width: 5%;"></th>
                        <th style="width: 5%;"></th>
                      </tr>
                    </thead>
                    <tbody>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>



      <!-- [ Main Content ] end -->
      <script src="../../src/assets/js/plugins/simplebar.min.js"></script>
      <script src="../../src/assets/js/plugins/bootstrap.min.js"></script>
      <script src="../../src/assets/js/pcoded.js"></script>
      <script src="../../src/assets/js/plugins/feather.min.js"></script>
      <script src="../../src/assets/js/notificaciones.js"></script>
      <script src="../../src/assets/js/main.js"></script>
      <script src="../../src/assets/js/ajax_class.js"></script>

      <script src="../../src/assets/js/amcharts5/index.js"></script>
      <script src="../../src/assets/js/amcharts5/themes/Animated.js"></script>
      <script src="../../src/assets/js/amcharts5/xy.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/autonumeric@4.6.0"></script>


      <script>
        const url_back = '../../back/modulo_pl_formulacion/form_programas_back.php'
        let datos = []




        dbh_select('pl_sectores').then(response => {
          if (response.success) {
            response.success.forEach(item => {
              $('#sector').append(`<option value="${item.id}">${item.sector}.${item.denominacion}</option>`)
            });
            $('.chosen-select').chosen().trigger("chosen:updated");
          }
        }).catch(error => {
          console.error("Error al obtener la información:", error);
        });



        // DATA TABLE
        var DataTable = $("#table").DataTable({
          language: lenguaje_datat
        });


        let accion

        // iniciar nuevo registro de sector
        function nuevoProyecto() {
          accion = 'registrar'
          $('#vista_registro').removeClass('hide')
          $('#vista-tabla').addClass('hide')
          $('#vista_datalles').addClass('hide')
        }


        var edt
        // Mostrar interfaz para editar proyecto existente
        function editarProyecto(id) {
          $('#vista_datalles').addClass('hide')
          edt = id
          accion = 'actualizar'
          $('#nombre').val(datos[id]['0'])
          $('#programa').val(datos[id]['2'])
          $("#sector").eq(0).val(datos[id]['1']).trigger("chosen:updated");
          $('#vista_registro').removeClass('hide')
          $('#vista-tabla').addClass('hide')
        }



        function cancelarRegistro() {
          $('#vista_registro').addClass('hide')
          $('#vista-tabla').removeClass('hide')
        }
        document.getElementById('btn-cancelar-registro').addEventListener('click', cancelarRegistro)






        // GUARDAR REGISTRO
        document.getElementById('btn-registro').addEventListener('click', function() {
          $(".border-danger").removeClass("border-danger");

          let errors = false

          const nombre = $("#nombre").val();
          const sector = $("#sector").val();
          const programa = $("#programa").val();

          (!validarCampo('nombre') ? errors = true : '');
          (!validarCampo('sector') ? errors = true : '');
          (!validarCampo('programa') ? errors = true : '');


          if (sector == '') {
            $('#sector').next('.chosen-container').addClass('border-danger');
            errors = true;

          }
          if (programa < 0 || programa.length != 2) {
            $('#programa').addClass('border-danger')
            toast_s('error', 'El valor del campo es incorrecto')
            errors = true;
          }

          // Si hay errores, detener la ejecución
          if (errors) {
            return;
          }

          const data = {
            nombre: nombre.trim(),
            sector: sector,
            programa: programa,
            id: null
          }

          // enviar los datos al back con el nuevo formato
          if (accion == 'actualizar') {
            data.id = edt
          }

          $.ajax({
            url: url_back,
            type: "json",
            contentType: 'application/json',
            data: JSON.stringify({
              data: data,
              accion: accion
            }),
            success: function(response) {
              if (response.success) {
                toast_s('success', 'Sector ' + (accion == 'update_proyecto' ? 'actualizado' : 'registrado') + ' con éxito')
                get_tabla()
                cancelarRegistro()

                $("#nombre").val('');
                $("#programa").val('');
                $("#sector").eq(0).val('').trigger("chosen:updated");

              } else {
                console.log(response)
                toast_s('error', response.error)
              }
            },
            error: function(xhr, status, error) {
              console.log(xhr.responseText);
            },
          });
        });


        /**
         * Deletes a record with the specified ID.
         * @param {number} id - The ID of the record to be deleted.
         * @returns {boolean} - Returns true if the record is deleted successfully, false otherwise.
         */
        function eliminar(id) {
          Swal.fire({
            title: "¿Estás seguro?",
            text: "¡No podrás revertir esto!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#04a9f5",
            cancelButtonColor: "#d33",
            confirmButtonText: "Sí, eliminarlo!",
            cancelButtonText: "Cancelar",
          }).then((result) => {
            if (result.isConfirmed) {
              $.ajax({
                url: url_back,
                type: "json",
                contentType: 'application/json',
                data: JSON.stringify({
                  accion: 'borrar',
                  id: id
                }),
                success: function(response) {
                  if (response.success) {
                    get_tabla()
                    toast_s("success", "Eliminado con éxito");
                  } else {
                    toast_s("error", response.error);
                  }
                },
                error: function(xhr, status, error) {
                  console.error(xhr.responseText);
                  console.error(error);
                },
              });
            }
          });
        }

        document.addEventListener('click', function(event) {

          if (event.target.closest('.btn-delete')) { // ACCION DE ELIMINAR
            const id = event.target.closest('.btn-delete').getAttribute('data-delete-id');
            eliminar(id);
          }
          if (event.target.closest('.btn-edit')) { // ACCION DE ELIMINAR
            const id = event.target.closest('.btn-edit').getAttribute('data-edit-id');
            editarProyecto(id);
          }
          if (event.target.closest('.btn-detalles-p')) { // ACCION DE ELIMINAR
            const id = event.target.closest('.btn-detalles-p').getAttribute('data-id-proyecto');
            getDetallesProyecto(id);
          }
        });



        function get_tabla() {
          $.ajax({
            url: sistema.tablas,
            type: "json",
            contentTyrepe: 'application/json',
            data: JSON.stringify({
              table: 'pl_programas',
              config: '_lista_programas'
            }),
            success: function(response) {
              let data_tabla = [] // Informacion de la tabla
              if (response.success) {
                let count = 1;
                DataTable.clear()

                response.success.forEach(function(item) {

                  datos[item.id] = [
                    item.denominacion,
                    item.sector,
                    item.programa,
                    item.sector_n,
                    item.id
                  ]

                  data_tabla.push([
                    count++,
                    item.sector_n,
                    item.programa,
                    item.denominacion,
                    `<button class="btn btn-edit btn-sm bg-brand-color-2 text-white " data-edit-id="${item.id}"><i class="bx bx-edit-alt"></i></button>`,
                    `<button class="btn btn-danger btn-sm btn-delete" data-delete-id="${item.id}"><i class="bx bx-trash"></i></button>`
                  ]);



                });


                DataTable.rows.add(data_tabla).draw()
              }
            },
            error: function(xhr, status, error) {
              console.error(xhr.responseText);
              console.error(error);
            },
          });
        }
        get_tabla()


        // Cargar chosen y ocultar area de registro
        $(document).ready(function() {
          $('.chosen-select').chosen({}).change(function(obj, result) {
            console.debug("changed: %o", arguments);
          });
          $('#vista_registro').addClass('hide')
        })
      </script>

</body>

</html>