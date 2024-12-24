import {
  getEntesAsignacion,
  getEntesAsignaciones,
  getEnteSolicitudesDozavos,
} from '../api/entes_solicitudesDozavos.js'
import {
  confirmNotification,
  hideLoader,
  insertOptions,
  separadorLocal,
  toastNotification,
  validateInput,
} from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
const d = document

let asignacionEnte = {
  id: 10,
  id_ente: 4,
  monto_total: '60000',
  id_ejercicio: 3,
  fecha: '2024-12-23',
  status: '1',
  status_cerrar: 0,
  partida: 0,
  ente_nombre:
    'SECRETARIA DEL DESPACHO DEL GOBERNADOR YSECRETARIA DE LA GESTION PUBLICA',
  tipo_ente: 'J',
  sector: '1',
  programa: '4',
  proyecto: '0',
  actividad: '51',
  actividades_entes: [
    {
      actividad_id: 4,
      id_ente: 4,
      distribucion:
        '[{"id_distribucion":"19","monto":20000},{"id_distribucion":"20","monto":20000}]',
      monto_total: '60000',
      status: 1,
      id_ejercicio: 3,
      actividad: '51',
      ente_nombre:
        'SECRETARIA DEL DESPACHO DEL GOBERNADOR Y SECRETARIA DE LA GESTION PUBLICA',
      distribucion_partidas: [
        {
          id_distribucion: '19',
          monto: 20000,
          id_partida: 725,
          id_sector: 1,
          id_programa: 4,
          sector_informacion: {
            id: 1,
            sector: '01',
            denominacion: 'DIRECCIÓN SUPERIOR DEL ESTADO',
          },
          programa_informacion: {
            id: 4,
            sector: '1',
            programa: '04',
            denominacion:
              'DIRECCION, COORDINACION PARA LAS POLITICAS DEL ESTADO',
          },
          id: 725,
          partida: '401.00.00.00.0000',
          nombre: null,
          descripcion: 'GASTOS DE PERSONAL',
          status: 0,
        },
        {
          id_distribucion: '20',
          monto: 20000,
          id_partida: 726,
          id_sector: 1,
          id_programa: 4,
          sector_informacion: {
            id: 1,
            sector: '01',
            denominacion: 'DIRECCIÓN SUPERIOR DEL ESTADO',
          },
          programa_informacion: {
            id: 4,
            sector: '1',
            programa: '04',
            denominacion:
              'DIRECCION, COORDINACION PARA LAS POLITICAS DEL ESTADO',
          },
          id: 726,
          partida: '401.01.00.00.0000',
          nombre: null,
          descripcion: 'Sueldos, salarios y otras retribuciones',
          status: 0,
        },
      ],
    },
    {
      actividad_id: 5,
      id_ente: 4,
      distribucion:
        '[{"id_distribucion":"21","monto":10000},{"id_distribucion":"22","monto":10000}]',
      monto_total: '60000',
      status: 1,
      id_ejercicio: 3,
      actividad: '52',
      ente_nombre: 'SECRETARIA EJECUTIVA',
      distribucion_partidas: [
        {
          id_distribucion: '21',
          monto: 10000,
          id_partida: 725,
          id_sector: 1,
          id_programa: 4,
          sector_informacion: {
            id: 1,
            sector: '01',
            denominacion: 'DIRECCIÓN SUPERIOR DEL ESTADO',
          },
          programa_informacion: {
            id: 4,
            sector: '1',
            programa: '04',
            denominacion:
              'DIRECCION, COORDINACION PARA LAS POLITICAS DEL ESTADO',
          },
          id: 725,
          partida: '401.00.00.00.0000',
          nombre: null,
          descripcion: 'GASTOS DE PERSONAL',
          status: 0,
        },
        {
          id_distribucion: '22',
          monto: 10000,
          id_partida: 727,
          id_sector: 1,
          id_programa: 4,
          sector_informacion: {
            id: 1,
            sector: '01',
            denominacion: 'DIRECCIÓN SUPERIOR DEL ESTADO',
          },
          programa_informacion: {
            id: 4,
            sector: '1',
            programa: '04',
            denominacion:
              'DIRECCION, COORDINACION PARA LAS POLITICAS DEL ESTADO',
          },
          id: 727,
          partida: '401.01.01.00.0000',
          nombre: null,
          descripcion: 'Sueldos básicos personal fijo a tiempo completo',
          status: 0,
        },
      ],
    },
  ],
  dependencias: [
    {
      id: 5,
      partida: 1,
      ue: '4',
      sector: '1',
      programa: '4',
      proyecto: '0',
      actividad: '52',
      ente_nombre: 'SECRETARIA EJECUTIVA',
      tipo_ente: 'J',
    },
    {
      id: 6,
      partida: 0,
      ue: '4',
      sector: '1',
      programa: '4',
      proyecto: '0',
      actividad: '53',
      ente_nombre: 'CONTRATACIONES PUBLICAS',
      tipo_ente: 'J',
    },
    {
      id: 7,
      partida: 0,
      ue: '4',
      sector: '1',
      programa: '4',
      proyecto: '0',
      actividad: '54',
      ente_nombre: 'ASESORIA JURIDICA',
      tipo_ente: 'J',
    },
    {
      id: 133,
      partida: 0,
      ue: '4',
      sector: '1',
      programa: '4',
      proyecto: '0',
      actividad: '51',
      ente_nombre:
        'SECRETARIA DEL DESPACHO DEL GOBERNADOR Y SECRETARIA DE LA GESTION PUBLICA',
      tipo_ente: 'J',
    },
  ],
}

let dozavo = {
  success: {
    id: 23,
    numero_orden: 'O00001-2024',
    numero_compromiso: '0',
    descripcion: 'asdasd',
    monto: '5000',
    fecha: '2024-12-24',
    partidas: [
      {
        id: 19,
        monto: 1666.67,
        partida: '401.00.00.00.0000',
        nombre: null,
        descripcion: 'GASTOS DE PERSONAL',
      },
      {
        id: 20,
        monto: 1666.67,
        partida: '401.01.00.00.0000',
        nombre: null,
        descripcion: 'Sueldos, salarios y otras retribuciones',
      },
      {
        id: 21,
        monto: 833.33,
        partida: '401.00.00.00.0000',
        nombre: null,
        descripcion: 'GASTOS DE PERSONAL',
      },
      {
        id: 22,
        monto: 833.33,
        partida: '401.01.01.00.0000',
        nombre: null,
        descripcion: 'Sueldos básicos personal fijo a tiempo completo',
      },
    ],
    id_ente: 4,
    tipo: 'D',
    mes: 11,
    status: 1,
    id_ejercicio: 3,
    ente: {
      id: 4,
      partida: 0,
      sector: '1',
      programa: '4',
      proyecto: '0',
      actividad: '51',
      ente_nombre:
        'SECRETARIA DEL DESPACHO DEL GOBERNADOR YSECRETARIA DE LA GESTION PUBLICA',
      tipo_ente: 'J',
    },
  },
}

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

  let nombreCard = 'ente-solicitud-dozavo'

  let enteSolicitudData = null

  const haveAsignation = () => {
    if (!enteData) {
      return ` <div
          class='alert alert-warning'
        >
          <strong>Atención:</strong> Este ente no posee una distribución
          presupuestaria asignada. Contacte a la administración.
        </div>`
    } else {
      return informacionEnte()
    }
  }

  const haveSolicitud = () => {
    if (!enteSolicitudData) {
      return ` <div class='alert alert-info'>
          <b>No existen solicitudes previas para este periodo.</b>
          <button class='btn btn-sm btn-info'>Crear solicitud</button>
        </div>`
    }
  }

  const oldCardElement = d.getElementById(`${nombreCard}-form-card`)
  if (oldCardElement) oldCardElement.remove()

  let card = ` <div class='card slide-up-animation' id='${nombreCard}-form-card'>
      <div class='card-header d-flex justify-content-between'>
        <div class=''>
          <h5 class='mb-0'>
            Información sobre distribucion presupuestaria a Ente
          </h5>
          <small class='mt-0 text-muted'>
            Visualice el total asignado y la distribucion presupuestaria hacia
            el Ente
          </small>
        </div>
      </div>
      <div class='card-body'>
         <div class='row'>
          <h5 class='mb-0'>Solicitud de dozavos</h5>${haveSolicitud()}
        </div>
        <div class='card-footer'>
          <button class='btn btn-primary' id='${nombreCard}-guardar'>
            Guardar
          </button>
        </div>
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

const informacionEnte = () => {
  let dependencias = enteData.dependencias

  let actividadesEnte = enteData.actividades_entes
  console.log(enteData)
  console.log(enteSolicitudData)

  let nombreCard = 'ente-solicitud-dozavo'

  const listaDependencias = () => {
    let dozavoMontoTotal = 0
    let montosActividadDistribuido = {}
    let montosActividadDozavo = {}
    actividadesEnte.forEach((distribucion) => {
      montosActividadDozavo[distribucion.actividad] = 0
      montosActividadDistribuido[distribucion.actividad] = 0
      distribucion.distribucion_partidas.forEach((partida) => {
        let doceavaParte = Number(partida.monto) / 12

        dozavoMontoTotal += doceavaParte
        montosActividadDozavo[distribucion.actividad] += doceavaParte
        montosActividadDistribuido[distribucion.actividad] += partida.monto
      })
    })

    // Guardar total de dozavo
    fieldList.dozavoMontoTotal = dozavoMontoTotal

    let dependenciasElement =
      dependencias.length > 0
        ? dependencias
            .filter((dependencia) =>
              actividadesEnte.some(
                (distribucionActividad) =>
                  distribucionActividad.actividad === dependencia.actividad
              )
            )
            .sort((a, b) => a.actividad - b.actividad)
            .map((dependencia) => {
              return `<li class='list-group-item'>
                  <p class='mb-2'>${dependencia.ente_nombre}</p>

                  <p class='mb-0'>
                    <b>Actividad: </b>
                    <span class='px-2 rounded text-secondary'>
                      ${dependencia.actividad}
                    </span>
                  </p>
                  <p class="mb-0">
                    <b>Distribuido: </b>
                    <span class='px-2 rounded text-secondary'>
                      ${separadorLocal(
                        montosActividadDistribuido[dependencia.actividad]
                      )}
                      Bs
                    </span>
                  </p>
                  <p class="mb-0">
                    <b>Dozavo:</b>
                    <span class='px-2 rounded text-secondary'>
                      ${separadorLocal(
                        montosActividadDozavo[dependencia.actividad]
                      )}
                      Bs
                    </span>
                  </p>
                </li>`
            })
            .join('')
        : ''

    return `
          <ul class='list-group mb-4'>${dependenciasElement}</ul>        
      `
  }

  const crearFilas = () => {
    let fila = []

    actividadesEnte.forEach((distribucion) => {
      distribucion.distribucion_partidas.forEach((partida) => {
        let dozavo = partida.monto / 12
        let codigo = `${
          partida.sector_informacion ? partida.sector_informacion.sector : '0'
        }.${
          partida.programa_informacion
            ? partida.programa_informacion.programa
            : '0'
        }.${
          // partida.proyecto_informacion == 0
          //   ? '00'
          //   : partida.proyecto_informacion.proyecto
          '00'
        }.${distribucion.actividad == 0 ? '00' : distribucion.actividad}`

        fila.push(`        <td>${codigo}</td>
          <td>${partida.partida}</td>
          <td>${separadorLocal(partida.monto)} Bs</td>
          <td>${separadorLocal(dozavo.toFixed(3))} Bs</td>
          </tr>`)
      })
    })

    return fila.join('')
  }

  let cardEnte = `    <div class='card-body'>
        <div class='row'>
          <div class='text-center col-sm-6'>
            <h5>Actividades:</h5>${listaDependencias()}
          </div>
        </div>
        <div>
          <table
            id='distribucion-ente-table'
            class='table table-striped table-sm'
          >
            <thead>
              <th>S/P/P/A</th>
              <th>PARTIDA</th>
              <th>MONTO</th>
              <th>DOZAVO</th>
            </thead>
            <tbody>${crearFilas()}</tbody>
          </table>
        </div>
        <div class='card-footer d-flex align-items-center justify-content-center gap-2 py-2'>
          <button class='btn btn-primary' id='solicitud-generar'>
            Generar solicitud
          </button>
          <button class='btn btn-danger' id='solicitud-cancelar'>
            Cancelar
          </button>
        </div>
      </div>`

  return cardEnte
}
