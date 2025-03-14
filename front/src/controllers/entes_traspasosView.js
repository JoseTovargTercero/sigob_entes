import { getTraspaso } from '../api/entes_traspasos.js'
import {
  ejerciciosLista,
  validarEjercicioActual,
} from '../components/form_ejerciciosLista.js'
import { entes_traspasosCard } from '../components/entes_traspasosCard.js'
import { entes_traspasosForm_card } from '../components/entes_traspasosForm_card.js'
import { toastNotification } from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'

import {
  loadTraspasosTable,
  validateTraspasosTable,
} from './entes_traspasosTable.js'

const d = document
const w = window
export const validateTraspasosView = async () => {
  let ejercicioFiscal = await ejerciciosLista({
    elementToInsert: 'ejercicios-fiscales',
  })

  console.log(ejercicioFiscal)

  validateTraspasosTable({
    id_ejercicio: ejercicioFiscal ? ejercicioFiscal.id : null,
  })

  d.addEventListener('click', async (e) => {
    if (e.target.id === 'traspasos-registrar') {
      if (!ejercicioFiscal) {
        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message: 'No hay un ejercicio fiscal seleccionado',
        })
        return
      }

      if (ejercicioFiscal.distribucion_partidas.length < 1) {
        toastNotification({
          type: NOTIFICATIONS_TYPES.fail,
          message: 'El ejercicio fiscal no posee una distribucion ',
        })
        return
      }
      entes_traspasosForm_card({
        elementToInsert: 'traspasos-view',
        ejercicioFiscal,
        recargarEjercicio: async function () {
          let ejercicioFiscalElement = d.querySelector(
            `[data-ejercicioid="${ejercicioFiscal.id}"]`
          )
          ejercicioFiscal = await validarEjercicioActual({
            ejercicioTarget: ejercicioFiscalElement,
          })

          loadTraspasosTable(ejercicioFiscal.id)
        },
      })
    }

    if (e.target.dataset.detalleid) {
      entes_traspasosCard({
        elementToInsert: 'traspasos-view',
        data: await getTraspaso(e.target.dataset.detalleid),
        ejercicioFiscal,
      })
    }
    if (e.target.dataset.ejercicioid) {
      ejercicioFiscal = await validarEjercicioActual({
        ejercicioTarget: e.target,
      })
    }
  })
}
