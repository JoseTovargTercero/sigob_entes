import { getEntePlanOperativo } from '../api/entes_planOperativo.js'
import {
  getEntesAsignacion,
  getEnteSolicitudDozavos,
  getEnteSolicitudDozavosMes,
  getEnteSolicitudesDozavos,
} from '../api/entes_solicitudesDozavos.js'
import { ente_solicitud_dozavo } from '../components/ente_solicitud_dozavo.js'
import { entes_planOperativo_card } from '../components/entes_planOperativo_card.js'
import { entes_planOperativo_form_card } from '../components/entes_planOperativo_form_card.js'
import { entes_solicitudDozavo_card } from '../components/entes_solicitudDozavo_card.js'
import { entes_solicitudGenerar_card } from '../components/entes_solicitudDozavoForm_card.js'
import {
  ejerciciosLista,
  validarEjercicioActual,
} from '../components/form_ejerciciosLista.js'
import { toastNotification } from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
import {
  loadPlanOperativo,
  validatePlanOperativoTable,
} from './entes_planOperativoTable.js'
import {
  loadSolicitudEntesTable,
  validateSolicitudEntesTable,
} from './entes_solicitudTable.js'

const d = document
const w = window

export const validatePlanOperativoView = async () => {
  let ejercicioFiscal = await ejerciciosLista({
    elementToInsert: 'ejercicios-fiscales',
  })

  validatePlanOperativoTable()

  loadPlanOperativo({
    id_ejercicio: ejercicioFiscal ? ejercicioFiscal.id : null,
  })

  if (!ejercicioFiscal) {
    toastNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Seleccione o registre un ejercicio fiscal',
    })
    return
  }

  let data = await getEntePlanOperativo(ejercicioFiscal.id)

  entes_planOperativo_card({
    elementToInsert: 'plan-operativo-view',
    data,
    closed: false,
  })

  d.addEventListener('click', async (e) => {
    if (e.target.id === 'plan-operativo-registrar') {
      if (!ejercicioFiscal) {
        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message: 'Seleccione un ejercicio fiscal',
        })
        return
      }

      entes_planOperativo_form_card({
        elementToInsert: 'plan-operativo-view',
        ejercicioId: ejercicioFiscal ? ejercicioFiscal.id : null,
        reset: function () {
          getEntePlanOperativo(ejercicioFiscal.id).then((data) => {
            entes_planOperativo_card({
              elementToInsert: 'plan-operativo-view',
              data,
              closed: false,
            })
          })
        },
      })
    }

    if (e.target.dataset.detalleid) {
      // CERRAR FORMULARIO

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

      ejercicioFiscal = await validarEjercicioActual({
        ejercicioTarget: e.target,
      })
    }
  })
}
