import {
  actualizarPlanOperativo,
  getEntePlanOperativoId,
  registrarPlanOperativo,
} from '../api/entes_planOperativo.js'
import {
  confirmNotification,
  hideLoader,
  toastNotification,
  validateInput,
} from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
const d = document

export const entes_planOperativo_form_card = async ({
  elementToInsert,
  ejercicioId,
  reset,
  id,
}) => {
  let fieldList = { objetivo_general: '', codigo: '', fecha_elaboracion: '' }
  let fieldListErrors = {
    objetivo_general: {
      value: true,
      message: 'Objetivo general inválido',
      type: 'textarea',
    },
    // codigo: {
    //   value: true,
    //   message: 'Código inválido',
    //   type: 'Number',
    // },
    // fecha_elaboracion: {
    //   value: true,
    //   message: 'Fecha inválida',
    //   type: 'text',
    // },
  }
  let fieldListOptions = {}
  let fieldListErrorsOptions = {}

  let fieldListDimensiones = {}
  let fieldListErrorsDimensiones = {}

  let nombreCard = 'plan-operativo'

  const oldCardElement = d.getElementById(`${nombreCard}-form-card`)

  if (oldCardElement) {
    closeCard(oldCardElement)
  }

  if (id) {
    let plan = await getEntePlanOperativoId(id, ejercicioId)

    let {
      objetivos_especificos,
      metas_actividades,
      estrategias,
      acciones,
      dimensiones,
      status,
    } = plan.plan_operativo

    console.log(plan)

    fieldList = {
      ...fieldList,
      status,
      id_plan: plan.plan_operativo.id,
      objetivo_general: plan.plan_operativo.objetivo_general,
      objetivos_especificos,
      estrategias,
      acciones,
      dimensiones,
      metas_actividades,
    }
    // let plansito = {
    //   plan_operativo: {
    //     id: 1,
    //     id_ente: 1,
    //     objetivo_general: 'Objetivo general',
    //     objetivos_especificos: ['Especifico1', 'Especifico2'],
    //     estrategias: ['Estrategia1', 'ESTRATEGIA2'],
    //     acciones: ['Accion1', 'Accion2'],
    //     dimensiones: [
    //       {
    //         nombre: 'Dimension1',
    //         descripcion: 'Dimension1 descripcion',
    //       },
    //       {
    //         nombre: 'Dimension2',
    //         descripcion: 'Dimension2 descripcion',
    //       },
    //       {
    //         nombre: 'Dimension3',
    //         descripcion: 'Dimension3 descripcion',
    //       },
    //     ],
    //     id_ejercicio: 3,
    //     status: 0,
    //     metas_actividades: [
    //       {
    //         actividad: 'Meta1',
    //         responsable: 'responsable1',
    //         unidad: 'medida1',
    //       },
    //       {
    //         actividad: 'META2',
    //         responsable: 'RESPNSABLE2',
    //         unidad: 'UNIDAD2',
    //       },
    //     ],
    //   },
    //   ente: {
    //     id: 1,
    //     partida: 1,
    //     sector: '1',
    //     programa: '1',
    //     proyecto: '0',
    //     actividad: '51',
    //     ente_nombre: 'CONSEJO LEGISLATIVO',
    //     tipo_ente: 'J',
    //     juridico: 0,
    //   },
    // }
  }

  const primeraVista = () => {
    let div = `      <div id='card-body-part-1' class='slide-up-animation'>
        <div class='row mb-4'>
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
          <div class=' mb-4 col-4 align-self-start'>
            <h5 class='text-center text-blue-600 mb-2'>
              Objetivos Específicos
            </h5>
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
          <div class='mb-4 col-4 align-self-start'>
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
          <div class='mb-4 col-4 align-self-start'>
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
        </div>
      </div>`
    return div
  }

  let dimensionesView = () => {
    let body = `  <div id='card-body-part-2'>
        <div class='row mb-4'>
          <h5 class='text-center text-blue-600 mb-2'>
            Descripción de dimensiones
          </h5>
          <div id='opciones-container-dimension'></div>
          <div class='text-center'>
            <button
              type='button'
              class='btn btn-sm bg-brand-color-1 text-white'
              data-add='dimension'
            >
              <i class='bx bx-plus'></i> AGREGAR DIMENSIÓN
            </button>
          </div>
        </div>
      </div>`
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

    return body
  }

  const terceraVista = () => {
    let body = `  <div id='card-body-part-3'>
        <div class='row mb-4'>
          <h5 class='text-center text-blue-600 mb-2'>
            Vinculación de plan de presupuesto
          </h5>
          <small>Añada las actividades y metas para el plan operativo</small>
          <div id='opciones-container-metas'></div>
          <div class='text-center'>
            <button
              type='button'
              class='btn btn-sm bg-brand-color-1 text-white'
              data-add='metas'
            >
              <i class='bx bx-plus'></i> AGREGAR ACTIVIDAD
            </button>
          </div>
        </div>
      </div>`
    return body
  }

  let card = ` <div class='card slide-up-animation' id='${nombreCard}-form-card'>
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
      <div class='card-body' id='card-body'>
        <div id='card-body-part-1' class='slide-up-animation'>
          <form>${primeraVista()}</form>
        </div>
      </div>
      <div class='card-footer text-center'>
        <button class='btn btn-secondary' id='btn-previus'>
          Atrás
        </button>
        <button class='btn btn-primary' id='btn-next'>
          Siguiente
        </button>
      </div>
    </div>`

  d.getElementById(elementToInsert).insertAdjacentHTML('afterbegin', card)

  let cardElement = d.getElementById(`${nombreCard}-form-card`)
  let formElement = d.getElementById(`${nombreCard}-form`)
  let cardBody = d.getElementById('card-body')

  let formFocus = 1

  let numsRows = 0

  if (id) {
    let planInputs = d.querySelectorAll('.plan-input')

    planInputs.forEach((input) => {
      input.value = fieldList[input.name]
    })

    console.log(fieldList)
    // CARGAR VISTAS DEL FORMULARIO
    cardBody.insertAdjacentHTML('beforeend', dimensionesView())
    cardBody.insertAdjacentHTML('beforeend', terceraVista())

    let cardBodyPart2 = d.getElementById('card-body-part-2'),
      cardBodyPart3 = d.getElementById('card-body-part-3')

    cardBodyPart2.classList.add('d-none')
    cardBodyPart3.classList.add('d-none')

    // LLENAR CAMPOS DE OPCIONES DEL FORMULARIO
    if (fieldList.objetivos_especificos.length > 0) {
      fieldList.objetivos_especificos.forEach((objetivo) => {
        addRow('objetivo')
        let row = d.querySelector(`[data-row="${numsRows}"]`)

        row.querySelector(`#plan-input-option-${numsRows}`).value = objetivo
      })
    }

    if (fieldList.estrategias.length > 0) {
      fieldList.estrategias.forEach((estrategia) => {
        addRow('estrategia')
        let row = d.querySelector(`[data-row="${numsRows}"]`)

        row.querySelector(`#plan-input-option-${numsRows}`).value = estrategia
      })
    }

    if (fieldList.acciones.length > 0) {
      fieldList.estrategias.forEach((accion) => {
        addRow('accion')
        let row = d.querySelector(`[data-row="${numsRows}"]`)

        row.querySelector(`#plan-input-option-${numsRows}`).value = accion
      })
    }

    if (fieldList.dimensiones.length > 0) {
      fieldList.dimensiones.forEach((dimension) => {
        addRow('dimension')
        let row = d.querySelector(`[data-row="${numsRows}"]`)

        row.querySelector(`#dimension-input-nombre-${numsRows}`).value =
          dimension.nombre
        row.querySelector(`#dimension-input-descripcion-${numsRows}`).value =
          dimension.descripcion
      })
    }

    if (fieldList.metas_actividades.length > 0) {
      fieldList.metas_actividades.forEach((meta) => {
        addRow('metas')
        let row = d.querySelector(`[data-row="${numsRows}"]`)

        row.querySelector(`#meta-input-actividad-${numsRows}`).value =
          meta.actividad
        row.querySelector(`#meta-input-responsable-${numsRows}`).value =
          meta.responsable

        row.querySelector(`#meta-input-unidad-${numsRows}`).value = meta.unidad
      })
    }

    // if (fieldList.metas_actividades.length > 0) {
    //   fieldList.distribuciones.forEach((distribucion) => {
    //     addRow('metas')
    //     let row = d.querySelector(`[data-row="${numsRows}"]`)

    //     row.querySelector(`#distribucion-monto-${numsRows}`).value =
    //       distribucion.monto
    //   })
    // }
  }

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
      reset()
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

  function enviarInformacion(data) {
    if (id) {
      confirmNotification({
        type: NOTIFICATIONS_TYPES.send,
        message: '¿Desea realizar esta actualización?',
        successFunction: async function () {
          let res = await actualizarPlanOperativo({
            id: fieldList.id_plan,
            status: fieldList.status,
            ...data,
          })
          if (res.success) {
            reset()
            closeCard(cardElement)
          }
        },
      })
    } else {
      confirmNotification({
        type: NOTIFICATIONS_TYPES.send,
        message: '¿Está seguro de realizar esta solicitud de traspaso?',
        successFunction: async function () {
          let res = await registrarPlanOperativo(data)
          if (res.success) {
            reset()
            closeCard(cardElement)
          }
        },
      })
    }
  }

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
          cardBody.insertAdjacentHTML('beforeend', dimensionesView())
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

        if (id) {
          btnNext.textContent = 'Actualizar'
        } else {
          btnNext.textContent = 'Enviar'
        }

        if (cardBodyPart3) {
          cardBodyPart3.classList.remove('d-none')
        } else {
          cardBody.insertAdjacentHTML('beforeend', terceraVista())
        }

        formFocus++
        return
      }

      if (formFocus === 3) {
        let data = validarInformacion()

        console.log(data)

        enviarInformacion(data)
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
    let rowsPart2 = Array.from(d.querySelectorAll('[data-row]'))
    let rowsPart3 = Array.from(d.querySelectorAll('[data-row-dimension]'))
    let rowsPart4 = Array.from(d.querySelectorAll('[data-row-metas]'))

    // estrategia, objetivo, accion
    let informacion = {
      id_ejercicio: ejercicioId,
      objetivo_general: fieldList.objetivo_general,
      codigo: fieldList.codigo,
      fecha_elaboracion: fieldList.fecha_elaboracion,
      acciones: [],
      estrategias: [],
      objetivos_especificos: [],
      dimensiones: [],
      metas_actividades: [],
    }

    rowsPart2.forEach((row) => {
      let input = row.querySelector('.plan-input-option')

      if (row.dataset.rowAccion) {
        informacion.acciones.push(input.value)
      }

      if (row.dataset.rowEstrategia) {
        informacion.estrategias.push(input.value)
      }
      if (row.dataset.rowObjetivo) {
        informacion.objetivos_especificos.push(input.value)
      }
    })

    rowsPart3.forEach((row) => {
      let nombre = row.querySelector('.dimension-input-nombre')
      let descripcion = row.querySelector('.dimension-input-descripcion')

      informacion.dimensiones.push({
        nombre: nombre.value,
        descripcion: descripcion.value,
      })
    })

    rowsPart4.forEach((row) => {
      let actividad = row.querySelector('.meta-input-actividad')
      let responsable = row.querySelector('.meta-input-responsable')
      let unidad = row.querySelector('.meta-input-unidad')

      informacion.metas_actividades.push({
        actividad: actividad.value,
        responsable: responsable.value,
        unidad: unidad.value,
      })
    })

    return informacion
  }

  async function addRow(tipo) {
    let newNumRow = numsRows + 1
    numsRows++

    if (tipo === 'dimension') {
      d.getElementById(`opciones-container-${tipo}`).insertAdjacentHTML(
        'beforeend',
        dimensionesRow(newNumRow)
      )
    } else if (tipo === 'metas') {
      d.getElementById(`opciones-container-${tipo}`).insertAdjacentHTML(
        'beforeend',
        metasRow(newNumRow)
      )
    } else {
      d.getElementById(`opciones-container-${tipo}`).insertAdjacentHTML(
        'beforeend',
        optionRow(newNumRow, tipo)
      )
    }

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
    let labelText =
      tipo === 'objetivo'
        ? 'Objetivo específico'
        : tipo === 'accion'
        ? 'Acción'
        : tipo === 'estrategia'
        ? 'Estrategia'
        : 'No especificado'

    let row = `<div class="row slide-up-animation mb-3" data-row='${optionNum}' data-row-${tipo}="${optionNum}">
    <div class="col-md-11">
        <div class="form-floating">
            <input type="text" class="form-control plan-input-option" 
                   name="plan-input-option-${optionNum}" id="plan-input-option-${optionNum}" 
                   placeholder="Campo para ${tipo}">
            <label for="plan-input-option-${optionNum}" class="form-label">${labelText}</label>
        </div>
    </div>
    <div class="col-md-1 d-flex align-items-center justify-content-end">
        <button type="button" class="btn btn-danger btn-sm" data-delete-row='${optionNum}'>
            &times;
        </button>
    </div>
</div>`

    return row
  }

  function dimensionesRow(optionNum) {
    let row = `<div class="row slide-up-animation mb-3" data-row="${optionNum}" data-row-dimension='${optionNum}'>
    <div class="col-md-4">  <div class="form-floating">  <input type="text" class="form-control dimension-input-option dimension-input-nombre" 
                   name="dimension-input-nombre-${optionNum}" id="dimension-input-nombre-${optionNum}" 
                   placeholder="Nombre de dimensión">
            <label for="dimension-input-nombre-${optionNum}" class="form-label">Nombre de dimensión</label>
        </div>
    </div>
    <div class="col-md-7"> 
    <div class="form-floating">
            <input type="text" class="form-control dimension-input-option dimension-input-descripcion" 
                   name="dimension-input-descripcion-${optionNum}" id="dimension-input-descripcion-${optionNum}" 
                   placeholder="Descripción de dimensión">
            <label for="dimension-input-descripcion-${optionNum}" class="form-label">Descripción de dimensión</label>
        </div>
    </div>
    <div class="col-md-1 d-flex align-items-center justify-content-end"> <button type="button" class="btn btn-danger btn-sm" data-delete-row='${optionNum}'>
            &times;
        </button>
    </div>
</div>`

    return row
  }

  function metasRow(optionNum) {
    let row = ` <div class="row slide-up-animation mb-3" data-row='${optionNum}' data-row-metas='${optionNum}'>
    <div class="col-md-5">
        <div class="form-floating">
            <input type="text" class="form-control meta-input-option meta-input-actividad" 
                   name="meta-input-actividad-${optionNum}" id="meta-input-actividad-${optionNum}" 
                   placeholder="Actividad de meta">
            <label for="meta-input-actividad-${optionNum}" class="form-label">Actividad de meta</label>
        </div>
    </div>
    <div class="col-md-4">
        <div class="form-floating">
            <input type="text" class="form-control meta-input-option meta-input-responsable" 
                   name="meta-input-responsable-${optionNum}" id="meta-input-responsable-${optionNum}" 
                   placeholder="Responsable">
            <label for="meta-input-responsable-${optionNum}" class="form-label">Responsable</label>
        </div>
    </div>
    <div class="col-md-2">
        <div class="form-floating">
            <input type="text" class="form-control meta-input-option meta-input-unidad" 
                   name="meta-input-unidad-${optionNum}" id="meta-input-unidad-${optionNum}" 
                   placeholder="Unidad de medida">
            <label for="meta-input-unidad-${optionNum}" class="form-label">Unidad de medida</label>
        </div>
    </div>
     <div class="col-md-2">
        <div class="form-floating">
            <input type="text" class="form-control meta-input-option meta-input-total" 
                   name="meta-input-total-${optionNum}" id="meta-input-total-${optionNum}" 
                   placeholder="Unidad de medida">
            <label for="meta-input-total-${optionNum}" class="form-label">Total</label>
        </div>
    </div>
    <div class="col-md-1 d-flex align-items-center justify-content-end">
        <button type="button" class="btn btn-danger btn-sm" data-delete-row='${optionNum}'>
            &times;
        </button>
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
