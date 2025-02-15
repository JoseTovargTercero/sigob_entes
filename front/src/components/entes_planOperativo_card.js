import { getEntePlanOperativo } from '../api/entes_planOperativo.js'
import {
  confirmNotification,
  hideLoader,
  insertOptions,
  toastNotification,
  validateInput,
} from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
import { entes_planOperativo_form_card } from './entes_planOperativo_form_card.js'
const d = document

export const entes_planOperativo_card = ({
  elementToInsert,
  close = false,
  data,
  closed,
}) => {
  let fieldList = { ejemplo: '' }
  let fieldListErrors = {
    ejemplo: {
      value: true,
      message: 'mensaje de error',
      type: 'text',
    },
  }

  let nombreCard = 'plan-operativo'

  const oldCardElement = d.getElementById(`${nombreCard}-card`)

  if (oldCardElement) {
    closeCard(oldCardElement)
  }

  if (close) return

  console.log(data)

  const alertSolicitud = () => {
    return `  <div class='card-body'>
        <div class='alert alert-info'>
          <b>No existen planes operativos previos para este periodo.</b>
          <button class='btn btn-sm btn-info' id="plan-operativo-registrar">Crear plan</button>
        </div>
      </div>`
  }

  let cardBody = () => {
    // let obj = {
    //   id: 1,
    //   id_ente: 1,
    //   objetivo_general: 'Objetivo general',
    //   objetivos_especificos: ['Especifico1', 'Especifico2'],
    //   estrategias: ['Estrategia1', 'ESTRATEGIA2'],
    //   acciones: ['Accion1', 'Accion2'],
    //   dimensiones: [
    //     {
    //       nombre: 'Dimension1',
    //       descripcion: 'Dimension1 descripcion',
    //     },
    //     {
    //       nombre: 'Dimension2',
    //       descripcion: 'Dimension2 descripcion',
    //     },
    //     {
    //       nombre: 'Dimension3',
    //       descripcion: 'Dimension3 descripcion',
    //     },
    //   ],
    //   id_ejercicio: 3,
    //   status: 0,
    //   metas_actividades: [
    //     {
    //       actividad: 'Meta1',
    //       responsable: 'responsable1',
    //       unidad: 'medida1',
    //     },
    //     {
    //       actividad: 'META2',
    //       responsable: 'RESPNSABLE2',
    //       unidad: 'UNIDAD2',
    //     },
    //   ],
    // }

    let {
      objetivos_especificos,
      estrategias,
      acciones,
      metas_actividades,
      dimensiones,
      objetivo_general,
    } = data.plan_operativo

    let objetivos_especificosLi = objetivos_especificos.map(
      (objetivo, index) => {
        return ` <li class='list-group-item'>
          <b>${index + 1}:</b> ${objetivo}
        </li>`
      }
    )
    let estrategiasLi = estrategias.map((objetivo, index) => {
      return ` <li class='list-group-item'>
          <b>${index + 1}:</b> ${objetivo}
        </li>`
    })
    let accionesLi = acciones.map((objetivo, index) => {
      return ` <li class='list-group-item'>
          <b>${index + 1}:</b> ${objetivo}
        </li>`
    })

    let metas = metas_actividades.map((meta) => {
      return `   <li class='list-group-item'>
          <strong>${meta.actividad}</strong>
          <br />
          Responsable: ${meta.responsable}
          <br />
          Unidad de medida: ${meta.unidad}
        </li>`
    })

    let dimensionesLi = dimensiones.map((dimension) => {
      return `   <li class='list-group-item'>
          <strong>${dimension.nombre}</strong>
          <br />
          Responsable: ${dimension.descripcion}
        </li>`
    })

    let div = `    <div class='card-body'>
    <div class="row mb-2">
    <h3 class="text-center text-blue-800">${objetivo_general}</h3>
    </div>
        <div class='row mb-2'>
          <div class='col'>
            <h4 class='text-center'>Objetivos específicos</h4>
            ${objetivos_especificosLi.join('')}
          </div>
          <div class='col'>
            <h4 class='text-center'>Estrategias</h4>${estrategiasLi.join('')}
          </div>
        </div>

        <div class='row mb-2'>
          <div class='col'>
            <h4 class='text-center'>Acciones</h4>${accionesLi.join('')}
          </div>
          <div class='col'>
            <h4 class='text-center'>Dimensiones</h4>${dimensionesLi.join('')}
          </div>
        </div>
        <div class='row mb-2'>
          <h4 class='text-center'>Metas y Actividades</h4>${metas.join('')}
        </div>
      </div>
     
      `

    return div
  }

  const validarFooter = () => {
    return data === null
      ? ''
      : ` <div class="card-footer text-center">
    <span class="btn btn-sm btn-success">ESTADO</span>
    <button class="btn btn-sm btn-warning" data-editarid="${data.plan_operativo.id}">Editar</button>
    
    </div>`
  }

  let card = `   <div class='card slide-up-animation' id='${nombreCard}-card'>
      <div class='card-header d-flex justify-content-between'>
        <div class=''>
          <h5 class='mb-0'>Información sobre el plan operativo</h5>
          <small class='mt-0 text-muted'>
            ${
              data === null
                ? 'No posee planes operativos para el ejercicio fiscal actual'
                : ` Certifique la información del plan operativo`
            }
          </small>
        </div>
        ${
          closed
            ? `  <button
              data-close='btn-close-report'
              type='button'
              class='btn btn-danger'
              aria-label='Close'
            >
              &times;
            </button>`
            : ''
        }
      </div>
      ${data === null ? alertSolicitud() : cardBody()}
      ${validarFooter()}
    </div>`

  d.getElementById(elementToInsert).insertAdjacentHTML('afterbegin', card)

  let cardElement = d.getElementById(`${nombreCard}-card`)

  function closeCard(card) {
    // validateEditButtons()
    card.remove()
    card.removeEventListener('click', validateClick)
    card.removeEventListener('input', validateInputFunction)

    return false
  }

  function validateClick(e) {
    if (e.target.dataset.close) {
      closeCard(cardElement)
    }

    if (e.target.dataset.editarid) {
      closeCard(cardElement)
      entes_planOperativo_form_card({
        elementToInsert: 'plan-operativo-view',
        id: data.plan_operativo.id,
        ejercicioId: data.plan_operativo.id_ejercicio,
        reset: async function () {
          let plan = await getEntePlanOperativo(
            data.plan_operativo.id_ejercicio
          )

          entes_planOperativo_card({
            elementToInsert: 'plan-operativo-view',
            data: plan,
            closed: false,
          })
        },
      })
    }
  }

  async function validateInputFunction(e) {
    fieldList = validateInput({
      target: e.target,
      fieldList,
      fieldListErrors,
      type: fieldListErrors[e.target.name].type,
    })
  }

  // CARGAR LISTA DE PARTIDAS

  function enviarInformacion(data) {}

  //   formElement.addEventListener('submit', (e) => e.preventDefault())

  cardElement.addEventListener('input', validateInputFunction)
  cardElement.addEventListener('click', validateClick)
}
