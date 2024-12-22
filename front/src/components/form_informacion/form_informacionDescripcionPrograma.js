import {
  actualizarDescripcionProgramaData,
  getProgramasData,
  getSectoresData,
  registrarDescripcionProgramaData,
} from '../../api/form_informacion.js'
import { selectTables } from '../../api/globalApi.js'
import { loadDescripcionProgramaTable } from '../../controllers/form_informacionTables.js'
import {
  confirmNotification,
  hideLoader,
  insertOptions,
  toastNotification,
  validateInput,
} from '../../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../../helpers/types.js'
const d = document

export const form_informacionDescripcionProgramaForm = async ({
  elementToInsert,
  data,
}) => {
  let fieldList = {
    id_sector: '',
    id_programa: '',
    descripcion: '',
  }
  let nombreComponente = 'descripcion-programa'

  if (data) {
    fieldList.id = data.id
    fieldList.id_sector = data.id_sector
    fieldList.id_programa = data.id_programa
    fieldList.descripcion = data.descripcion

    // let inputs = d.querySelectorAll(`.${nombreComponente}-input`)

    // inputs.forEach((input) => {
    //   input.value = data[input.name]
    // })
  }

  let sectores = await selectTables('pl_sectores')

  console.log(fieldList)
  let optionsSectores = sectores
    .map((option) => {
      if (Number(option.id) === Number(fieldList.id_sector)) {
        return `<option value="${option.id}" selected>${option.sector} - ${option.denominacion}</option>`
      } else {
        return `<option value="${option.id}">${option.sector} - ${option.denominacion}</option>`
      }
    })
    .join('')

  let fieldListErrors = {
    descripcion: {
      value: true,
      message: 'Descripcion vacía',
      type: 'textarea',
    },
  }
  const oldCardElement = d.getElementById(`${nombreComponente}-form-card`)
  if (oldCardElement) oldCardElement.remove()

  let card = `<div class='card slide-up-animation' id='${nombreComponente}-form-card'>
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
        <form id='${nombreComponente}-form'>
          <div class='row mb-3'>
            <div class='col'>
              <div class='form-group'>
                <label for='search-select-sector' class='form-label'>
                  Seleccione el sector
                </label>
                <select
                  class='form-select t chosen-sector'
                  name='id_sector'
                  id='search-select-sector'
                >
                  <option>Elegir...</option>${optionsSectores}
                </select>
              </div>
            </div>

            <div class='col'>
              <div class='form-group'>
                <label for='search-select-programa' class='form-label'>
                  Seleccione el prgorama
                </label>
                <select
                  class='form-select t chosen-programa'
                  name='id_programa'
                  id='search-select-programa'
                >
                  <option>Elegir...</option>
                </select>
              </div>
            </div>
          </div>
          <div class='row mb-3'>
            <div class='col'>
              <label class='form-label' for='descripcion'>
                Descripción
              </label>

              <textarea
                class='form-control ${nombreComponente}-input'
                id='descripcion'
                name='descripcion'
                rows='8'
              ></textarea>
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

  let cardElement = d.getElementById(`${nombreComponente}-form-card`)
  let formElement = d.getElementById(`${nombreComponente}-form`)

  $('.chosen-sector')
    .chosen()
    .change(function (obj, result) {
      fieldList.id_sector = result.selected
      console.log('changed: %o', result)

      selectTables('pl_programas').then((res) => {
        let optionsPrograma = [`<option value=''>Elegir programa...</option>`]

        res.forEach((programa) => {
          if (programa.sector === fieldList.id_sector) {
            let option = `<option value='${programa.id}'>${programa.programa} - ${programa.denominacion}</option>`
            optionsPrograma.push(option)
          }
        })

        d.getElementById('search-select-programa').innerHTML =
          optionsPrograma.join('')
        $('.chosen-programa').trigger('chosen:updated')
      })
    })

  $('.chosen-programa')
    .chosen()
    .change(function (obj, result) {
      fieldList.id_programa = result.selected
      console.log(fieldList.id_programa)
    })

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
      console.log(fieldList)

      let inputs = d.querySelectorAll(`.${nombreComponente}-input`)

      inputs.forEach((input) => {
        fieldList = validateInput({
          target: input,
          fieldList,
          fieldListErrors,
          type: fieldListErrors[input.name].type,
        })
      })

      if (Object.values(fieldList).some((values) => !values)) {
        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message: 'Llene los campos',
        })
        return
      } else {
        enviarInformacion()
      }

      enviarInformacion()
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
          let res = await await actualizarDescripcionProgramaData({
            info: fieldList,
          })
          if (res.success) {
            loadDescripcionProgramaTable()
            closeCard()
          }
        },
      })
    } else {
      confirmNotification({
        type: NOTIFICATIONS_TYPES.send,
        message: '¿Desea realizar este registro?',
        successFunction: async function () {
          let res = await registrarDescripcionProgramaData({ info: fieldList })
          if (res.success) {
            closeCard()
            loadDescripcionProgramaTable()
          }
        },
      })
    }
  }

  formElement.addEventListener('submit', (e) => e.preventDefault())

  cardElement.addEventListener('input', validateInputFunction)
  cardElement.addEventListener('click', validateClick)
}
