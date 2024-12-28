import {
  getEntesAsignacion,
  getEnteSolicitudDozavos,
  getEnteSolicitudDozavosMes,
  getEnteSolicitudesDozavos,
} from '../api/entes_solicitudesDozavos.js'
import { ente_solicitud_dozavo } from '../components/ente_solicitud_dozavo.js'
import { entes_solicitudDozavo_card } from '../components/entes_solicitudDozavo_card.js'
import { entes_solicitudGenerar_card } from '../components/entes_solicitudDozavoForm_card.js'
import {
  ejerciciosLista,
  validarEjercicioActual,
} from '../components/form_ejerciciosLista.js'
import { toastNotification } from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
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

  loadSolicitudEntesTable({
    id_ejercicio: ejercicioFiscal.id,
  })

  let solicitudMesActual = await getEnteSolicitudDozavosMes({
    id_ejercicio: ejercicioFiscal.id,
  })

  entes_solicitudDozavo_card({
    elementToInsert: 'solicitudes-entes-dozavos-view',
    data: solicitudMesActual,
  })

  d.addEventListener('click', async (e) => {
    if (e.target.id === 'solicitud-ente-registrar') {
      if (!ejercicioFiscal) {
        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message: 'Seleccione un ejercicio fiscal',
        })
        return
      }

      entes_solicitudGenerar_card({
        elementToInsert: 'solicitudes-entes-dozavos-view',
        ejercicioId: ejercicioFiscal.id,
        reset: function () {
          getEnteSolicitudDozavosMes({
            id_ejercicio: ejercicioFiscal.id,
          }).then((data) => {
            entes_solicitudDozavo_card({
              elementToInsert: 'solicitudes-entes-dozavos-view',
              data: data,
            })
          })
        },
      })
    }

    if (e.target.dataset.detalleid) {
      // CERRAR FORMULARIO
      entes_solicitudGenerar_card({
        elementToInsert: 'solicitudes-entes-dozavos-view',
        close: true,
      })

      scroll(0, 0)

      let solicitud = await getEnteSolicitudDozavos({
        id_ejercicio: ejercicioFiscal.id,
        id: e.target.dataset.detalleid,
      })

      entes_solicitudDozavo_card({
        elementToInsert: 'solicitudes-entes-dozavos-view',
        data: solicitud,
        closed: true,
        reset: function () {
          // CARGAR SOLICITUD DE MES POR DEFECTO EN CASO DE CERRAR LA CARD DE DETALLES

          getEnteSolicitudDozavosMes({
            id_ejercicio: ejercicioFiscal.id,
          }).then((data) => {
            entes_solicitudDozavo_card({
              elementToInsert: 'solicitudes-entes-dozavos-view',
              data: data,
            })
          })
        },
      })
    }

    if (e.target.dataset.ejercicioid) {
      // QUITAR CARD SI SE CAMBIA EL AÑO FISCAL
      let formCard = d.getElementById('solicitud-ente-card')
      if (formCard) formCard.remove()

      loadSolicitudEntesTable({ id_ejercicio: e.target.dataset.ejercicioid })
      ejercicioFiscal = await validarEjercicioActual({
        ejercicioTarget: e.target,
      })

      entes_solicitudGenerar_card({
        elementToInsert: 'solicitudes-entes-dozavos-view',
        close: true,
      })

      getEnteSolicitudDozavosMes({
        id_ejercicio: ejercicioFiscal.id,
      }).then((data) => {
        entes_solicitudDozavo_card({
          elementToInsert: 'solicitudes-entes-dozavos-view',
          data: data,
        })
      })
    }
  })
}
