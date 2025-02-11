import {
  confirmNotification,
  hideLoader,
  insertOptions,
  toastNotification,
  validateInput,
} from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
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

  const alertSolicitud = () => {
    return `  <div class='card-body'>
        <div class='alert alert-info'>
          <b>No existen planes operativos previos para este periodo.</b>
          <button class='btn btn-sm btn-info' id="plan-operativo-registrar">Crear plan</button>
        </div>
      </div>`
  }

  let card = `<div class='card slide-up-animation' id='${nombreCard}-card'>
        <div class='card-header d-flex justify-content-between'>
          <div class=''>
            <h5 class='mb-0'>Información sobre el plan operativo</h5>
            <small class='mt-0 text-muted'> ${
              data === null
                ? 'No posee planes operativos para el ejercicio fiscal actual'
                : ` Certifique la información del plan operativo`
            }</small>
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
        ${
          data === null
            ? alertSolicitud()
            : `<div class='card-body text-center'>
            
            
          </div>
          <div class='card-footer d-flex align-items-center justify-content-center gap-2 py-0'>
           
            </div>`
        }
      
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
