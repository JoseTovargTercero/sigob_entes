import { eliminarPartida } from '../api/partidas.js'
import { form_partida_form_card } from '../components/form_partidas_form_card.js'
import { form_partidaCopia_form_card } from '../components/form_partidasCopia_form_card.js'
import { confirmNotification } from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
import {
  deletePartidaRow,
  validatePartidasTable,
} from './form_partidasTable.js'

const d = document

export const validatePartidasView = () => {
  validatePartidasTable()

  let btnNewElement = d.getElementById('partida-registrar')

  d.addEventListener('click', async (e) => {
    if (e.target.id === 'partida-registrar') {
      btnNewElement.setAttribute('disabled', true)
      form_partida_form_card({ elementToInsert: 'partidas-view' })
    }

    if (e.target.dataset.eliminarid) {
      confirmNotification({
        type: NOTIFICATIONS_TYPES.send,
        message: '¿Desea eliminar esta partida?',
        successFunction: async function () {
          let row = e.target.closest('tr')
          eliminarPartida(e.target.dataset.eliminarid)
          deletePartidaRow({ row })
          if (d.getElementById('partida-form-card')) {
            location.reload()
          }
        },
      })
    }

    if (e.target.dataset.editarid) {
      scroll(0, 0)
      //   gastosRegistrarCointaner.classList.add('hide')
      e.target.setAttribute('disabled', true)
      btnNewElement.setAttribute('disabled', true)

      form_partida_form_card({
        elementToInsert: 'partidas-view',
        id: e.target.dataset.editarid,
      })
    }
    if (e.target.dataset.copiaid) {
      scroll(0, 0)
      //   gastosRegistrarCointaner.classList.add('hide')
      e.target.setAttribute('disabled', true)
      btnNewElement.setAttribute('disabled', true)

      form_partidaCopia_form_card({
        elementToInsert: 'partidas-view',
        id: e.target.dataset.copiaid,
      })
    }
  })
}

function validateEditButtons() {
  d.getElementById('partida-registrar').removeAttribute('disabled')

  let editButtons = d.querySelectorAll('[data-editarid][disabled]')

  if (editButtons.length < 1) return

  editButtons.forEach((btn) => {
    if (btn.hasAttribute('disabled')) {
      btn.removeAttribute('disabled')
    }
  })
}
