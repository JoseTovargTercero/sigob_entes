import {
  getEntesAsignacion,
  getEntesAsignaciones,
  getEnteSolicitudesDozavos,
} from '../api/entes_solicitudesDozavos.js'
import {
  confirmNotification,
  hideLoader,
  insertOptions,
  toastNotification,
  validateInput,
} from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
const d = document

export const ente_solicitud_dozavo = async ({
  elementToInsert,
  ejercicioId,
}) => {
  let fieldList = { ejemplo: '' }
  let fieldListErrors = {
    ejemplo: {
      value: true,
      message: 'mensaje de error',
      type: 'text',
    },
  }

  console.log(ejercicioId)

  if (!ejercicioId) {
    toastNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Seleccione o registre un ejercicio fiscal',
    })
    return
  }

  let enteData = await getEntesAsignaciones(ejercicioId)
  let enteSolicitudData = await getEnteSolicitudesDozavos(ejercicioId)
  console.log(enteData)
  console.log(enteSolicitudData)

  let nombreCard = 'ente-solicitud-dozavo'

  const haveAsignation = () => {
    if (enteData.length === 0) {
      return ` <div
          class='alert alert-warning'
        >
          <strong>Atención:</strong> Este ente no posee una distribución
          presupuestaria asignada. Contacte a la administración.
        </div>`
    }
  }

  const oldCardElement = d.getElementById(`${nombreCard}-form-card`)
  if (oldCardElement) oldCardElement.remove()

  let card = `<div class='card slide-up-animation' id='${nombreCard}-form-card'>
        <div class='card-header d-flex justify-content-between'>
          <div class=''>
            <h5 class='mb-0'>Información sobre distribucion presupuestaria a Ente</h5>
            <small class='mt-0 text-muted'>Visualice el total asignado y la distribucion presupuestaria hacia el Ente</small>
          </div>
        
        </div>
        <div class='card-body'>
        ${haveAsignation()}
        </div>
        <div class='card-footer'>
          <button class='btn btn-primary' id='${nombreCard}-guardar'>
            Guardar
          </button>
        </div>
      </div>`

  d.getElementById(elementToInsert).insertAdjacentHTML('afterbegin', card)

  let cardElement = d.getElementById(`${nombreCard}-form-card`)
  let formElement = d.getElementById(`${nombreCard}-form`)

  const closeCard = () => {
    // validateEditButtons()
    cardElement.remove()
    cardElement.removeEventListener('click', validateClick)
    cardElement.removeEventListener('input', validateInputFunction)

    return false
  }

  function validateClick(e) {
    if (e.target.dataset.close) {
      closeCard()
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
