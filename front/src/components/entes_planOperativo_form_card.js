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
  let fieldList = { objetivo_general: '', codigo: '', fecha_elaboracion: '' }
  let fieldListErrors = {
    objetivo_general: {
      value: true,
      message: 'mensaje de error',
      type: 'textarea',
    },
    codigo: {
      value: true,
      message: 'Código inválido',
      type: 'Number',
    },
    fecha_elaboracion: {
      value: true,
      message: 'Fecha inválida',
      type: 'text',
    },
  }
  let fieldListOptions = {}
  let fieldListErrorsOptions = {}

  let nombreCard = 'plan-operativo'

  const oldCardElement = d.getElementById(`${nombreCard}-form-card`)

  if (oldCardElement) {
    closeCard(oldCardElement)
  }

  const segundaVista = () => {
    let div = `      <div id="card-body-part-2" class="slide-up-animation">
        <div class='row mb-4'>
          <h5 class='text-center text-blue-600 mb-2'>Objetivos Específicos</h5>
          <div id='opciones-container-objetivo'></div>
          <div class='text-center'>
            <button
              type='button'
              class='btn btn-sm bg-brand-color-1 text-white'
              data-add='objetivo'
            >
              <i class='bx bx-plus'></i> AGREGAR OBJETIVO
            </button>
          </div>
        </div>
        <div class='row mb-4'>
          <h5 class='text-center text-blue-600 mb-2'>Estrategias</h5>
          <div id='opciones-container-estrategia'></div>
          <div class='text-center'>
            <button
              type='button'
              class='btn btn-sm bg-brand-color-1 text-white'
              data-add='estrategia'
            >
              <i class='bx bx-plus'></i> AGREGAR ESTRATEGIA
            </button>
          </div>
        </div>
        <div class='row mb-4'>
          <h5 class='text-center text-blue-600 mb-2'>Acciones</h5>
          <div id='opciones-container-accion'></div>
          <div class='text-center'>
            <button
              type='button'
              class='btn btn-sm bg-brand-color-1 text-white'
              data-add='accion'
            >
              <i class='bx bx-plus'></i> AGREGAR ACCIÓN
            </button>
          </div>
        </div>
      </div>`
    return div
  }

  let dimensionesView = () => {
    let form = `<div id='card-body-part-3' class='slide-up-animation'>
        <form>
          <h5>DESCRIPCION DE LAS DIMENSIONES</h5>
          <div class='row'>
            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='dimension_politica'>
                  Politica
                </label>
                <textarea
                  rows='4'
                  class='form-control dimension-input'
                  name='dimension_politica'
                  id='dimension_politica'
                  placeholder='Política'
                ></textarea>
              </div>
            </div>

            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='dimension_cultural'>
                  Cultural
                </label>
                <textarea
                  rows='4'
                  class='form-control dimension-input'
                  name='dimension_cultural'
                  id='dimension_cultural'
                  placeholder='Cultural'
                ></textarea>
              </div>
            </div>
            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='dimension_socio_productivo'>
                  Socio productivo
                </label>
                <textarea
                  rows='4'
                  class='form-control dimension-input'
                  name='dimension_socio_productivo'
                  id='dimension_socio_productivo'
                  placeholder='Socio productivo'
                ></textarea>
              </div>
            </div>

            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='dimension_social_educativa'>
                  Social educativa
                </label>
                <textarea
                  rows='4'
                  class='form-control dimension-input'
                  name='dimension_social_educativa'
                  id='dimension_social_educativa'
                  placeholder='Social educativa'
                ></textarea>
              </div>
            </div>
          </div>
          <div class='row'>
            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='dimension_salud'>
                  salud
                </label>
                <textarea
                  rows='4'
                  class='form-control dimension-input'
                  name='dimension_salud'
                  id='dimension_salud'
                  placeholder='Salud'
                ></textarea>
              </div>
            </div>

            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='dimension_seguridad'>
                  Seguridad
                </label>
                <textarea
                  rows='4'
                  class='form-control dimension-input'
                  name='dimension_seguridad'
                  id='dimension_seguridad'
                  placeholder='seguridad'
                ></textarea>
              </div>
            </div>
            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='dimension_servicios'>
                  Servicios
                </label>
                <textarea
                  rows='4'
                  class='form-control dimension-input'
                  name='dimension_servicios'
                  id='dimension_servicios'
                  placeholder='Socio productivo'
                ></textarea>
              </div>
            </div>
            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='dimension_ambiente'>
                  Ambiente
                </label>
                <textarea
                  rows='4'
                  class='form-control dimension-input'
                  name='dimension_ambiente'
                  id='dimension_ambiente'
                  placeholder='Socio productivo'
                ></textarea>
              </div>
            </div>
          </div>
        </form>
      </div>`

    return form
  }

  let card = `  <div class='card slide-up-animation' id='${nombreCard}-form-card'>
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
      <div class='card-body' id="card-body">
      <div id="card-body-part-1" class="slide-up-animation">
        <form>
          <div class='row'>
            <div class='form-group'>
              <label class='form-label' for='objetivo_general'>
                Objetivo general
              </label>
              <input
                class='form-control plan-input'
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
                  class='form-control plan-input'
                  name='codigo'
                  id='codigo'
                  placeholder='Código...'
                />
              </div>
            </div>
            <div class='col'>
              <div class='form-group'>
                <label class='form-label' for='fecha_elaboracion'>
                  Fecha elaboración
                </label>
                <input
                  class='form-control plan-input'
                  name='fecha_elaboracion'
                  id='fecha_elaboracion'
                  placeholder='Fecha elaboración'
                  type="date"
                />
              </div>
            </div>
          </div>
        </form>
        
      </div>
      
    </div>
    <div class='card-footer'>
       <button class='btn btn-secondary' id='btn-previus'>
          Atrás
        </button>
        <button class='btn btn-primary' id='btn-next'>
          Siguiente
        </button>
      </div>
      </div>
    `

  d.getElementById(elementToInsert).insertAdjacentHTML('afterbegin', card)

  let cardElement = d.getElementById(`${nombreCard}-form-card`)
  let formElement = d.getElementById(`${nombreCard}-form`)
  let cardBody = d.getElementById('card-body')

  let formFocus = 1

  let numsRows = {}

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

    if (e.target.dataset.add) {
      addRow(e.target.dataset.add)
    }

    if (e.target.dataset.deleteRow) {
      deleteRow(e.target.dataset.deleteRow)
    }

    validateFormFocus(e)
  }

  async function validateInputFunction(e) {
    if (e.target.classList.contains('plan-input')) {
      fieldList = validateInput({
        target: e.target,
        fieldList,
        fieldListErrors,
        type: fieldListErrors[e.target.name].type,
      })
    }
  }

  // CARGAR LISTA DE PARTIDAS

  function enviarInformacion(data) {}

  //   formElement.addEventListener('submit', (e) => e.preventDefault())

  cardElement.addEventListener('input', validateInputFunction)
  cardElement.addEventListener('click', validateClick)

  async function validateFormFocus(e) {
    let btnNext = d.getElementById('btn-next')
    let btnPrevius = d.getElementById('btn-previus')

    // let btnAdd = d.getElementById('btn-add')
    let cardBodyPart1 = d.getElementById('card-body-part-1')
    let cardBodyPart2 = d.getElementById('card-body-part-2')
    let cardBodyPart3 = d.getElementById('card-body-part-3')

    if (e.target === btnNext) {
      if (formFocus === 1) {
        let planInputs = d.querySelectorAll('.plan-input')

        planInputs.forEach((input) => {
          fieldList = validateInput({
            target: input,
            fieldList,
            fieldListErrors,
            type: fieldListErrors[input.name].type,
          })
        })

        if (Object.values(fieldListErrors).some((el) => el.value)) {
          toastNotification({
            type: NOTIFICATIONS_TYPES.fail,
            message: 'Hay campos inválidos',
          })
          return
        }

        cardBodyPart1.classList.add('d-none')

        if (cardBodyPart2) {
          cardBodyPart2.classList.remove('d-none')
        } else {
          cardBody.insertAdjacentHTML('beforeend', segundaVista())
        }

        if (btnPrevius.hasAttribute('disabled'))
          btnPrevius.removeAttribute('disabled')

        formFocus++
        return
      }
      if (formFocus === 2) {
        // let planInputsOptions = d.querySelectorAll('.plan-input-option')

        // planInputsOptions.forEach((input) => {
        //   fieldListOptions = validateInput({
        //     target: input,
        //     fieldListOptions,
        //     fieldListErrorsOptions,
        //     type: fieldListErrorsOptions[input.name].type,
        //   })
        // })

        // if (Object.values(fieldListErrorsOptions).some((el) => el.value)) {
        //   toastNotification({
        //     type: NOTIFICATIONS_TYPES.fail,
        //     message: 'Hay campos inválidos',
        //   })
        //   return
        // }

        cardBodyPart2.classList.add('d-none')
        btnNext.textContent = 'Enviar'

        if (cardBodyPart3) {
          cardBodyPart3.classList.remove('d-none')
        } else {
          cardBody.insertAdjacentHTML('beforeend', dimensionesView())
        }

        formFocus++
        return
      }

      if (formFocus === 3) {
        validarInformacion()

        confirmNotification({
          type: NOTIFICATIONS_TYPES.send,
          message: '¿Está seguro de realizar esta solicitud de traspaso?',
          successFunction: function () {
            enviarInformacion()
          },
        })
      }
    }

    if (e.target === btnPrevius) {
      if (formFocus === 3) {
        cardBodyPart2.classList.remove('d-none')
        btnNext.textContent = 'Siguiente'

        if (cardBodyPart3) {
          cardBodyPart3.classList.add('d-none')
        }

        formFocus--
        return
        // confirmNotification({
        //   type: NOTIFICATIONS_TYPES.send,
        //   message: 'Si continua se borrarán los cambios hechos aquí',
        //   successFunction: function () {
        //     cardBodyPart2.remove()

        //     cardBodyPart1.classList.remove('d-block')
        //     cardBodyPart1.classList.add('d-none')
        //     btnNext.textContent = 'Siguiente'
        //     // btnAdd.classList.remove('d-none')

        //     partidasSeleccionadas = []
        //     cardBody.innerHTML += seleccionPartidas()
        //     validarSeleccionPartidasTable()

        //     formFocus--
        //   },
        // })
      }
      if (formFocus === 2) {
        cardBodyPart1.classList.remove('d-none')

        if (cardBodyPart2) {
          cardBodyPart2.classList.add('d-none')
        }

        formFocus--

        btnPrevius.setAttribute('disabled', true)

        return
      }
    }
  }

  const validarInformacion = () => {
    let rowsPart1 = Array.from(d.querySelectorAll('.plan-input'))
    let rowsPart2 = Array.from(d.querySelectorAll('.plan-input-option'))
    let rowsPart3 = Array.from(d.querySelectorAll('.dimension-input'))

    // estrategia, objetivo, accion
    let informacion = {
      objetivo_general: fieldList.objetivo_general,
      codigo: fieldList.codigo,
      fecha_elaboracion: fieldList.fecha_elaboracion,
      acciones: [],
      estrategias: [],
      objetivos: [],
      dimensiones: [],
    }

    rowsPart2.forEach((input) => {
      console.log(input)

      if (input.dataset.accion) {
        informacion.acciones.push(input.value)
      }

      if (input.dataset.estrategia) {
        informacion.estrategias.push(input.value)
      }
      if (input.dataset.objetivo) {
        informacion.objetivos.push(input.value)
      }
    })

    rowsPart3.forEach((input) => {
      informacion.dimensiones.push({
        nombre: input.name,
        descripcion: input.value,
      })
    })

    console.log(informacion)
  }

  async function addRow(tipo) {
    let newNumRow = numsRows + 1
    numsRows++

    d.getElementById(`opciones-container-${tipo}`).insertAdjacentHTML(
      'beforeend',
      optionRow(newNumRow, tipo)
    )

    fieldListOptions[`plan-input-option-${newNumRow}`] = ''
    fieldListErrorsOptions[`plan-input-option-${newNumRow}`] = {
      value: true,
      message: 'Campo inválido',
      type: 'textarea',
    }
  }

  function deleteRow(id) {
    confirmNotification({
      type: NOTIFICATIONS_TYPES.send,
      message: '¿Desea eliminar esta opción?',
      successFunction: function () {
        let row = d.querySelector(`[data-row="${id}"]`)

        // ELIMINAR ESTADO Y ERRORES DE INPUTS

        delete fieldListOptions[`plan-input-option-${id}`]
        delete fieldListErrorsOptions[`plan-input-option-${id}`]

        if (row) numsRows--
        row.remove()
      },
    })
  }

  function optionRow(optionNum, tipo) {
    let row = ` <div class='row slide-up-animation' data-row='${optionNum}' data-row-${tipo}="${optionNum}">
        <div class='col-sm'>
          <div class='form-group'>
            <label for='plan-input-option' class='form-label'>
              Campo para ${tipo}
            </label>
            <div class='row'>
              <div class='col'>
                <input
                  class='form-control plan-input-option'
                  type='text'
                  name='plan-input-option-${optionNum}'
                  id='plan-input-option-${optionNum}'
                  placeholder='Escribir...'
                />
              </div>
              <div class='col-2'>
                <button
                  type='button'
                  class='btn btn-danger'
                  data-delete-row='${optionNum}'
                >
                  ELIMINAR
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>`

    return row
  }
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
