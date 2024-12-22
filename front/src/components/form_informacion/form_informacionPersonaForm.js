import {
  actualizarPersonaData,
  registrarGobernacionData,
  registrarPersonaData,
} from '../../api/form_informacion.js'
import { loadPersonaTable } from '../../controllers/form_informacionTables.js'
import {
  confirmNotification,
  hideLoader,
  insertOptions,
  toastNotification,
  validateInput,
} from '../../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../../helpers/types.js'
const d = document

export const form_informacionPersonaForm = ({ elementToInsert, data }) => {
  let fieldList = {
    nombres: '',
    cargo: '',
  }

  let nombreComponente = 'persona'

  let fieldListErrors = {
    nombres: {
      value: true,
      message: 'mensaje de error',
      type: 'text',
    },
    cargo: {
      value: true,
      message: 'mensaje de error',
      type: 'text',
    },
  }
  const oldCardElement = d.getElementById(`${nombreComponente}-form-card`)
  if (oldCardElement) oldCardElement.remove()

  let card = `    <div class='card slide-up-animation' id='${nombreComponente}-form-card'>
      <div class='card-header d-flex justify-content-between'>
        <div class=''>
          <h5 class='mb-0'>Formulario gobernación</h5>
          <small class='mt-0 text-muted'>Introduzca los datos requeridos</small>
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
      <form id="${nombreComponente}-form">
      <div class='row mb-3'>
          <div class='col'>
              <label class="form-label" for='nombres'>Nombre y apellido</label>
              <input
                  type='text'
                  class='form-control ${nombreComponente}-input'
                  id='nombres'
                  name='nombres'
                  placeholder='Nombre y apellido...'
                  
              />
          </div>
          <div class='col'>
              <label class="form-label" for='cargo'>Cargo</label>
              <input
                  type='text'
                  class='form-control ${nombreComponente}-input'
                  id='cargo'
                  name='cargo'
                  placeholder='Cargo...'
                  
              />
          </div>
          
      </div>
  
  </form>
  
      </div>
      <div class='card-footer'>
        <button class='btn btn-primary' id='${nombreComponente}-guardar'>
          Guardar
        </button>
      </div>
    </div>`

  d.getElementById(elementToInsert).insertAdjacentHTML('afterbegin', card)

  if (data) {
    let inputs = d.querySelectorAll(`.${nombreComponente}-input`)
    inputs.forEach((input) => {
      input.value = data[input.name]
    })

    fieldList.id = data.id
  }

  let cardElement = d.getElementById(`${nombreComponente}-form-card`)
  let formElement = d.getElementById(`${nombreComponente}-form`)

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

    if (e.target.id === `${nombreComponente}-guardar`) {
      let inputs = d.querySelectorAll(`.${nombreComponente}-input`)

      inputs.forEach((input) => {
        fieldList = validateInput({
          target: input,
          fieldList,
          fieldListErrors,
          type: fieldListErrors[input.name].type,
        })
      })

      let validaciones = Object.values(fieldListErrors)

      if (validaciones.some((el) => el.value)) {
        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message: 'Rellene los campos requeridos',
        })
      } else {
        enviarInformacion()
      }
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

  function enviarInformacion(info) {
    if (fieldList.id) {
      confirmNotification({
        type: NOTIFICATIONS_TYPES.send,
        message: '¿Desea actualizar este registro?',
        successFunction: async function () {
          let res = await actualizarPersonaData({ info: fieldList })
          if (res.success) {
            loadPersonaTable()
            closeCard()
          }
        },
      })
    } else {
      confirmNotification({
        type: NOTIFICATIONS_TYPES.send,
        message: '¿Desea realizar este registro?',
        successFunction: async function () {
          let res = await registrarPersonaData({ info: fieldList })
          if (res.success) {
            loadPersonaTable()
            closeCard()
          }
        },
      })
    }
  }

  formElement.addEventListener('submit', (e) => e.preventDefault())

  cardElement.addEventListener('input', validateInputFunction)
  cardElement.addEventListener('click', validateClick)
}
