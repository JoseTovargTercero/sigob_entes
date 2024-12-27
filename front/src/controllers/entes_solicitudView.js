import {
  getEntesAsignacion,
  getEnteSolicitudDozavos,
  getEnteSolicitudesDozavos,
} from '../api/entes_solicitudesDozavos.js'
import { ente_solicitud_dozavo } from '../components/ente_solicitud_dozavo.js'
import { entes_solicitudDozavo_card } from '../components/entes_solicitudDozavo_card.js'
import {
  ejerciciosLista,
  validarEjercicioActual,
} from '../components/form_ejerciciosLista.js'
import {
  loadSolicitudEntesTable,
  validateSolicitudEntesTable,
} from './entes_solicitudTable.js'

const d = document
const w = window

export const validateSolicitudEntesView = async () => {
  let ejercicioFiscal = await ejerciciosLista({
    elementToInsert: 'ejercicios-fiscales',
  })

  validateSolicitudEntesTable()

  if (!ejercicioFiscal) {
    toastNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Seleccione o registre un ejercicio fiscal',
    })
    return
  }

  let data = await getEnteSolicitudesDozavos({
    id_ejercicio: ejercicioFiscal.id,
  })

  loadSolicitudEntesTable({
    id_ejercicio: ejercicioFiscal.id,
    solicitudes: data,
  })

  let date = new Date()

  let solicitud =
    data.length > 0 ? data.find((el) => el.mes === date.getMonth()) : null

  if (data.length > 0 && solicitud) {
    entes_solicitudDozavo_card({
      elementToInsert: 'solicitudes-entes-dozavos-view',
      data: solicitud,
    })
  } else {
    entes_solicitudDozavo_card({
      elementToInsert: 'solicitudes-entes-dozavos-view',
      data: null,
    })
  }

  d.addEventListener('click', async (e) => {
    if (e.target.id === 'solicitud-ente-registrar') {
      if (!ejercicioFiscal) {
        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message: 'Seleccione un ejercicio fiscal',
        })
        return
      }
    }

    if (e.target.dataset.detalleid) {
      scroll(0, 0)

      let formCard = d.getElementById('solicitud-ente-card')
      if (formCard) formCard.remove()

      let solicitud = await getEnteSolicitudDozavos({
        id_ejercicio: ejercicioFiscal.id,
        id: e.target.dataset.detalleid,
      })

      entes_solicitudDozavo_card({
        elementToInsert: 'solicitudes-entes-dozavos-view',
        data: solicitud,
        closed: true,
        reset: async function () {
          let date = new Date()

          console.log(date)

          let solicitud =
            data.length > 0
              ? data.find((el) => el.mes === date.getMonth())
              : null

          if (data.length > 0 && solicitud) {
            entes_solicitudDozavo_card({
              elementToInsert: 'solicitudes-entes-dozavos-view',
              data: solicitud,
            })
          } else {
            entes_solicitudDozavo_card({
              elementToInsert: 'solicitudes-entes-dozavos-view',
              data: null,
            })
          }
        },
      })
    }

    // if (e.target.dataset.validarid) {
    //   pre_solicitudGenerar_card({
    //     elementToInsert: 'solicitudes-dozavos-view',
    //     enteId: e.target.dataset.validarid,
    //     ejercicioId: ejercicioFiscal.id,
    //   })
    // }
    if (e.target.dataset.ejercicioid) {
      // QUITAR CARD SI SE CAMBIA EL AÑO FISCAL
      let formCard = d.getElementById('solicitud-ente-card')
      if (formCard) formCard.remove()

      loadSolicitudEntesTable(e.target.dataset.ejercicioid)
      ejercicioFiscal = await validarEjercicioActual({
        ejercicioTarget: e.target,
      })
    }
  })
}
