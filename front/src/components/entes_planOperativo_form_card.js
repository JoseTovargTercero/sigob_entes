import {
  confirmNotification,
  hideLoader,
  insertOptions,
  toastNotification,
  validateInput,
} from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
const d = document

export const entes_planOperativo_form_card = ({ elementToInsert }) => {
  let fieldList = { ejemplo: '' }
  let fieldListErrors = {
    ejemplo: {
      value: true,
      message: 'mensaje de error',
      type: 'text',
    },
  }

  let nombreCard = 'plan-operativo'

  const oldCardElement = d.getElementById(`${nombreCard}-form-card`)

  if (oldCardElement) {
    closeCard(oldCardElement)
  }

  let card = `    <div class='card slide-up-animation' id='${nombreCard}-form-card'>
      <div class='card-header d-flex justify-content-between'>
        <div class=''>
          <h5 class='mb-0'>Plan operativo</h5>
          <small class='mt-0 text-muted'>
            Complete todos los campos a continuación
          </small>
        </div>
        <button
          data-close='btn-close'
          type='button'
          class='btn btn-danger'
          aria-label='Close'
        >
          &times;
        </button>
      </div>
      <div class='card-body'>
        <form>
          <div class='row'>
            <div class='form-group'>
              <label class='form-label' for='objetivo_general'>
                Objetivo general
              </label>
              <input
                class='form-control'
                name='objetivo_general'
                id='objetivo_general'
                placeholder='Objetivo general'
              />
            </div>
          </div>
          <div class='row'>
            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='codigo'>
                  Objetivo general
                </label>
                <input
                  class='form-control'
                  name='codigo'
                  id='codigo'
                  placeholder='Código...'
                />
              </div>
            </div>
            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='fecha_elaboracion'>
                  Objetivo general
                </label>
                <input
                  class='form-control'
                  name='fecha_elaboracion'
                  id='fecha_elaboracion'
                  placeholder='Objetivo general'
                />
              </div>
            </div>
          </div>
        </form>
      </div>
      <div class='card-footer'>
        <button class='btn btn-primary' id='${nombreCard}-guardar'>
          Generar plan
        </button>
      </div>
    </div>`

  d.getElementById(elementToInsert).insertAdjacentHTML('afterbegin', card)

  let cardElement = d.getElementById(`${nombreCard}-form-card`)
  let formElement = d.getElementById(`${nombreCard}-form`)

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

function chosenSelect() {
  let select = ` <div class='form-group'>
        <label for='search-select-${nombreCard}' class='form-label'>
          Seleccione el sector
        </label>
        <select
          class='form-select ${nombreCard}-input chosen-select'
          name='id_sector'
          id='search-select-${nombreCard}'
        >
          <option>Elegir...</option>
        </select>
      </div>`

  let options = [`<option>Elegir...</option>`]
  let data

  data.fullInfo.forEach((sector) => {
    let option = `<option value='${sector.id}'>${sector.sector}.${sector.programa}.${sector.proyecto} - ${sector.nombre}</option>`
    options.push(option)
  })

  selectEjercicio.innerHTML = options.join('')

  $('.chosen-select')
    .chosen()
    .change(function (obj, result) {
      console.log('changed: %o', arguments)
    })
}
