import { getPartidas } from '../api/partidas.js'
import {
  aceptarDozavo,
  deleteSolicitudDozavo,
  rechazarDozavo,
} from '../api/pre_solicitudesDozavos.js'
import { deleteSolicitudDozeavoRow } from '../controllers/pre_solicitudesDozavosTable.js'
import {
  confirmNotification,
  separadorLocal,
  tableLanguage,
  toastNotification,
} from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES, meses } from '../helpers/types.js'
import { pre_identificarCompromiso } from './pre_identificarCompromiso.js'

const d = document
export const entes_solicitudDozavo_card = async ({
  elementToInsert,
  data,
  closed,
  reset = false,
}) => {
  // closed es para saber si se puede cerrar la card

  const modalElemet = d.getElementById('card-solicitud-dozavo')
  if (modalElemet) modalElemet.remove()

  const partidasLi = () => {
    return data.partidas
      ? data.partidas
          .map((partida) => {
            return ` <tr class=''>
              <td class=''>
                ${partida.partida}
              </td>
               <td class=''>
                ${separadorLocal(partida.monto)}
              </td>
              <td class=''>
                ${partida.descripcion}
              </td>
             
            </tr>`
          })
          .join('')
      : `   <li>No posee partidas asociadas</li>`
  }

  const alertSolicitud = () => {
    return `  <div class='card-body'>
        <div class='alert alert-info'>
          <b>No existen solicitudes previas para este periodo.</b>
          <button class='btn btn-sm btn-info'>Crear solicitud</button>
        </div>
      </div>`
  }

  let card = `<div class='card slide-up-animation pb-2' id='card-solicitud-dozavo'>
      <div class='card-header d-flex justify-content-between'>
        <div class=''>
          <h5 class='mb-0'>Información de solicitud de dozavo</h5>
          <small class='mt-0 text-muted'>
            Certifique la información de la solicitud de dozavo para el mes de  <b>${
              meses[data.mes]
            }</b>
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
      ${
        data === null
          ? alertSolicitud()
          : `<div class='card-body text-center'>
            <div class='w-100 align-self-center fs-6'>
              <div class='row'>
                <div class='col-sm'>
                  <b>Ente: </b>
                  <p>${data.ente_nombre}</p>
                </div>
                <div class='col-sm'>
                  <b>Tipo de ente: </b>
                  <p>
                    ${data.tipo_ente === 'J' ? 'Jurídico' : 'Descentralizado'}
                  </p>
                </div>
                <div class='col-sm'>
                  <b>Monto total: </b>
                  <p>${separadorLocal(data.monto)}</p>
                </div>
                <div class='col-sm'>
                  <b>Descripción: </b>
                  <p>${data.descripcion}</p>
                </div>
              </div>

              <div class='row'>
                <div class='col-sm'>
                  <b>Fecha de orden / Mes: </b>
                  <p>
                    ${data.fecha} - ${meses[data.mes]}
                  </p>
                </div>
                <div class='col-sm'>
                  <b>Orden: </b>
                  <p>${data.numero_orden}</p>
                </div>
                <div class='col-sm'>
                  <b>Tipo: </b>
                  <p>${data.tipo == 'A' ? 'Aumenta' : 'Disminuye'}</p>
                </div>
                <div class='col-sm'>
                  <b>Compromiso: </b>
                  <p>${data.numero_compromiso}</p>
                </div>
              </div>
            </div>
            <div class='w-100'>
              <table
                class='table table-xs table-responsive mx-auto'
                style='width: 100%'
                id='solicitud-partidas'
              >
                <thead>
                  <th>Partida</th>
                  <th>Monto</th>
                  <th>descripcion</th>
                </thead>
                <tbody>${partidasLi()}</tbody>
              </table>
            </div>
            <div class='card-footer d-flex align-items-center justify-content-center gap-2 py-0'>
              ${
                data.status === 0
                  ? ` <span class='p-2 rounded text-white bg-green-600 text-bold'>
              Comprometido
            </span>`
                  : ` <span class='p-2 rounded text-white bg-yellow-600 text-bold'>
              PENDIENTE
            </span>`
              }
            </div>
          </div>`
      }
    </div>`

  d.getElementById(elementToInsert).insertAdjacentHTML('beforebegin', card)

  let listDataTable = new DataTable('#solicitud-partidas', {
    responsive: true,
    scrollY: 120,
    language: tableLanguage,
    layout: {
      topStart: function () {
        let toolbar = document.createElement('div')
        toolbar.innerHTML = `
        <h5 class="text-center">Lista de partidas afectadas</h5>
                  `
        return toolbar
      },
      topEnd: { search: { placeholder: 'Buscar...' } },
      bottomStart: 'info',
      bottomEnd: 'paging',
    },
  })
  const closeModalCard = () => {
    let cardElement = d.getElementById('card-solicitud-dozavo')

    cardElement.remove()
    d.removeEventListener('click', validateClick)
    // formElement.removeEventListener('input', validateInputFunction)

    return false
  }

  function validateClick(e) {
    if (e.target.dataset.close) {
      closeModalCard()
      if (reset) {
        reset()
      }
    }
  }

  d.addEventListener('click', validateClick)
}