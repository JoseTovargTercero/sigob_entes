import {
  confirmNotification,
  hideLoader,
  mapData,
  showLoader,
  toastNotification,
} from '../helpers/helpers.js'
import { NOTIFICATIONS_TYPES } from '../helpers/types.js'
import { config, APP_URL } from './urlConfig.js'

const entesDistribucionUrl = `${APP_URL}${config.MODULE_NAMES.ENTES}ent_asignacion_entes.php`

const obtenerDistribucionSecretaria = async (id_ejercicio) => {
  showLoader()
  try {
    const res = await fetch(entesDistribucionUrl, {
      method: 'POST',
      body: JSON.stringify({ accion: 'consultar_secretarias', id_ejercicio }),
    })

    const clone = res.clone()
    const text = await clone.text()

    if (!res.ok) {
      console.error('Respuesta del servidor (no ok):', text)
      throw { status: res.status, statusText: res.statusText }
    }

    let json
    try {
      json = await res.json()
    } catch (jsonError) {
      console.error('Error al parsear JSON:', jsonError)
      console.error('Respuesta cruda:', text)
      throw jsonError
    }

    if (json.success) {
      return json.success
    }

    if (json.error) {
      toastNotification({
        type: NOTIFICATIONS_TYPES.fail,
        message: json.error,
      })
      return json
    }
  } catch (e) {
    console.error('Error general:', e)
    return confirmNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Error al obtener distribucion de entes',
    })
  } finally {
    hideLoader()
  }
}

export { obtenerDistribucionSecretaria }
