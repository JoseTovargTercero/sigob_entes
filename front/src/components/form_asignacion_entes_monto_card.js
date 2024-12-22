import { asignarMontoEnte, getEnte } from "../api/form_entes.js";
import { selectTables } from "../api/globalApi.js";
import { loadAsignacionEntesTable } from "../controllers/form_asignacionEntesTable.js";
import {
  confirmNotification,
  hideLoader,
  insertOptions,
  separarMiles,
  toastNotification,
  validateInput,
} from "../helpers/helpers.js";
import { NOTIFICATIONS_TYPES } from "../helpers/types.js";
import { form_asignacion_entes_card } from "./form_asignacion_entes_card.js";
const d = document;

export const form_asignacion_entes_monto_card = async ({
  elementToInset,
  enteId,
  ejercicioFiscal,
  actualizar,
}) => {
  let montos = {
    total: ejercicioFiscal.situado,
    restante: ejercicioFiscal.restante,
    distribuido: ejercicioFiscal.distribuido,
    acumulado: 0,
  };

  let fieldList = { monto: 0 };
  let fieldListErrors = {
    monto: {
      value: true,
      message: "Monto inválido",
      type: "number3",
    },
  };

  let ente = await getEnte(enteId);

  ente.dependencias.forEach((el) => {
    fieldList.monto += Number(el.distribucion_sumatoria);
  });

  const oldCardElement = d.getElementById("asignacion-ente-monto-form-card");
  // if (oldCardElement) oldCardElement.remove();

  let card = `<div class='card slide-up-animation' id='asignacion-ente-monto-form-card'>
      <div class='card-header d-flex justify-content-between'>
          <h5 class='mb-0'>Asignación de presupuesto</h5>
        <button
          data-close='btn-close'
          type='button'
          class='btn btn-sm btn-danger'
          aria-label='Close'
        >
          &times;
        </button>
      </div>
      <div class='card-body'>
      <div class="text-center">
      <h5>${ente.ente_nombre}</h5>


           <span class="me-2">  ${ente.sector_informacion.sector || "00"}.${
    ente.programa_informacion.programa || "0"
  }.${ente.proyecto == 0 ? "00" : ente.proyecto}.${
    ente.actividad == 0 ? "00" : ente.actividad
  }</span>
       ${
         ente.tipo_ente === "J"
           ? "<span class='badge bg-primary'>Jurídico</span>"
           : "<span class='badge bg-success'>Descentralizado</span>"
       }


      </div>

${
  fieldList.monto > 0
    ? `<form id='asignacion-ente-monto-form' class="mb-0 mt-3">
              <div class='row'>
                <div class='form-group mt-4 w-50 text-center' style="margin: auto;">
                  <label class='form-label' for='monto'>
                    MONTO TOTAL ASIGNADO AL ENTE
                  </label>
                  <input
                    type='text'
                    name='monto'
                    id='monto'
                    class='form-control text-center'
                    value='${separarMiles(fieldList.monto)}'
                    disabled
                    placeholder='Presupuesto total'
                  />
                </div>
              </div>
            </form>`
    : ` <form id='asignacion-ente-monto-form' class="mb-0 mt-3">
              <div class='row'>
                <div class='form-group mt-4 w-50 text-center' style="margin: auto;">
                  <label class='form-label' for='monto'>
                    MONTO TOTAL ASIGNADO AL ENTE
                  </label>
                  <input
                    type='number'
                    name='monto'
                    id='monto'
                    class='form-control text-center'
                    placeholder='Presupuesto total'
                  />
                </div>
              </div>
            </form>`
}
 ${
   fieldList.monto == 0
     ? `<h6 class="mt-2 text-muted text-center" style="margin-top: 3px !important;font-size: 13px;">
         Monto disponible en el ejercicio fiscal: ${separarMiles(
           ejercicioFiscal.restante_situado_asignacion
         )}
       </h6>`
     : ""
 }
      </div>

      <div class='card-footer text-center pt-0'>
        <button class='btn btn-primary' id='asignacion-ente-monto-guardar'>
          Continuar
        </button>
      </div>
    </div>`;

  d.getElementById(elementToInset).insertAdjacentHTML("afterbegin", card);

  let cardElement = d.getElementById("asignacion-ente-monto-form-card");
  let formElement = d.getElementById("asignacion-ente-monto-form");

  const closeCard = () => {
    // validateEditButtons()
    cardElement.remove();
    cardElement.removeEventListener("click", validateClick);
    cardElement.removeEventListener("input", validateInputFunction);

    return false;
  };

  function validateClick(e) {
    if (e.target.dataset.close) {
      closeCard();
      form_asignacion_entes_card({
        elementToInset: "asignacion-entes-view",
        ejercicioFiscal,
      });
    }

    if (e.target.id === "asignacion-ente-monto-guardar") {
      // console.log(fieldList);
      if (!Number(fieldList.monto)) {
        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message: "Monto inválido",
        });
        return;
      }

      enviarInformacion();
    }
  }

  async function validateInputFunction(e) {
    if (e.target.id === "monto") {
      fieldList = validateInput({
        target: e.target,
        fieldList,
        fieldListErrors,
        type: fieldListErrors[e.target.name].type,
      });

      //   actualizarMontoRestante()

      if (
        Number(e.target.value) >
        Number(ejercicioFiscal.restante_situado_asignacion)
      ) {
        e.target.value = ejercicioFiscal.restante_situado_asignacion;
        fieldList.monto = e.target.value;
        d.getElementById("monto-total-asignado").textContent = e.target.value;

        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message:
            "No se puede superar el monto disponible del ejercicio fiscal",
        });
        return;
      }
      d.getElementById("monto-total-asignado").textContent = e.target.value;

      if (!e.target.value) {
        d.getElementById("monto-total-asignado").textContent = 0;
      }
    }
  }

  function enviarInformacion() {
    confirmNotification({
      type: NOTIFICATIONS_TYPES.send,
      message: `¿Desea asignar ${separarMiles(
        fieldList.monto
      )} Bs. a este ente?`,
      successFunction: async function () {
        let res = await asignarMontoEnte({
          id_ejercicio: ejercicioFiscal.id,
          monto_total: fieldList.monto,
          id_ente: ente.id,
        });

        if (res.success) {
          // form_asignacion_entes_card({
          //   elementToInset: 'asignacion-entes-view',
          //   ejercicioFiscal,
          // })
          actualizar();

          closeCard();
        }
      },
    });
  }

  function actualizarMontoRestante() {
    let montoElement = d.getElementById("monto-total-asignado");

    let inpu = d.getElementById("monto");

    // REINICIAR MONTO ACUMULADO
    montos.acumulado = 0;

    montos.acumulado += inpu.value;

    let diferenciaSolicitado = montos.total_solicitado - montos.acumulado;

    if (montos.acumulado > montos.distribuido) {
      montoElement.innerHTML = `<span class="text-danger">${montos.acumulado}</span>`;
      return;
    }

    if (diferenciaSolicitado < 0) {
      montoElement.innerHTML = `<span class="text-warning">${montos.acumulado}</span>`;
      return;
    }
    if (diferenciaSolicitado > 0) {
      montoElement.innerHTML = `<span class="text-success">${montos.acumulado}</span>`;
      return;
    }
    if (diferenciaSolicitado === 0) {
      montoElement.innerHTML = `<span class="text-secondary">${montos.acumulado}</span>`;
      return;
    }
  }

  formElement.addEventListener("submit", (e) => e.preventDefault());

  cardElement.addEventListener("input", validateInputFunction);
  cardElement.addEventListener("click", validateClick);
};
