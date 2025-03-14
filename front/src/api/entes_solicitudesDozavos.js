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
const entesSolicitudesDozavosUrl = `${APP_URL}${config.MODULE_NAMES.ENTES}ent_solicitud_dozavos.php`

const getEntesAsignaciones = async (id_ejercicio) => {
  showLoader()
  try {
    const res = await fetch(entesDistribucionUrl, {
      method: 'POST',
      body: JSON.stringify({ accion: 'consultar', id_ejercicio }),
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

const getEntesAsignacion = async (id_ejercicio) => {
  showLoader()
  try {
    let res = await fetch(entesDistribucionUrl, {
      method: 'POST',
      body: JSON.stringify({
        accion: 'consultar_por_id',
        id_ejercicio,
      }),
    })

    if (!res.ok) throw { status: res.status, statusText: res.statusText }

    // const clone = res.clone()

    // let text = await clone.text()
    // console.log(text)

    const json = await res.json()

    console.log(json)
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
    console.log(e)

    return confirmNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Error al obtener distribucion de ente',
    })
  } finally {
    hideLoader()
  }
}

const getEnteSolicitudesDozavos = async ({ id_ejercicio }) => {
  showLoader()
  try {
    let res = await fetch(entesSolicitudesDozavosUrl, {
      method: 'POST',
      body: JSON.stringify({ accion: 'consulta', id_ejercicio }),
    })

    // console.log(res)

    if (!res.ok) throw { status: res.status, statusText: res.statusText }

    // const clone = res.clone()
    // const text = await clone.text()

    // console.log(text)

    const json = await res.json()

    // console.log(json)

    if (json.success) {
      return json.success
    }
    if (json.error) {
      toastNotification({
        type: NOTIFICATIONS_TYPES.fail,
        message: json.error,
      })
    }
    return json
  } catch (e) {
    console.log(e)

    return confirmNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Error al obtener solicitudes',
    })
  } finally {
    hideLoader()
  }
}

const getEnteSolicitudDozavos = async ({ id_ejercicio, id }) => {
  showLoader()
  try {
    let res = await fetch(entesSolicitudesDozavosUrl, {
      method: 'POST',
      body: JSON.stringify({ accion: 'consulta_id', id_ejercicio, id }),
    })

    // console.log(res)

    if (!res.ok) throw { status: res.status, statusText: res.statusText }

    const clone = res.clone()
    const text = await clone.text()

    console.log(text)

    const json = await res.json()

    // console.log(json)

    if (json.success) {
      return json.success
    }
    if (json.error) {
      toastNotification({
        type: NOTIFICATIONS_TYPES.fail,
        message: json.error,
      })
    }
    return json
  } catch (e) {
    console.log(e)

    return confirmNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Error al obtener solicitudes',
    })
  } finally {
    hideLoader()
  }
}

const getEnteSolicitudDozavosMes = async ({ id_ejercicio }) => {
  showLoader()
  try {
    let res = await fetch(entesSolicitudesDozavosUrl, {
      method: 'POST',
      body: JSON.stringify({ accion: 'consulta_mes', id_ejercicio }),
    })

    // console.log(res)

    if (!res.ok) throw { status: res.status, statusText: res.statusText }

    // const clone = res.clone()
    // const text = await clone.text()

    // console.log(text)

    const json = await res.json()

    console.log(json)

    if (json.hasOwnProperty('success')) {
      return json.success
    }
    if (json.error) {
      toastNotification({
        type: NOTIFICATIONS_TYPES.fail,
        message: json.error,
      })
    }
    return json
  } catch (e) {
    console.log(e)

    return confirmNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Error al obtener solicitudes',
    })
  } finally {
    hideLoader()
  }
}

const registrarEnteSolicitudDozavo = async (data) => {
  showLoader()
  try {
    let res = await fetch(entesSolicitudesDozavosUrl, {
      method: 'POST',
      body: JSON.stringify({ accion: 'registrar', ...data }),
    })

    if (!res.ok) throw { status: res.status, statusText: res.statusText }

    const clone = res.clone()
    const text = await clone.text()

    console.log(text)
    const json = await res.json()

    if (json.success) {
      toastNotification({
        type: NOTIFICATIONS_TYPES.done,
        message: json.success,
      })
    }
    if (json.error) {
      toastNotification({
        type: NOTIFICATIONS_TYPES.fail,
        message: json.error,
      })
    }
    return json
  } catch (e) {
    console.log(e)

    return confirmNotification({
      type: NOTIFICATIONS_TYPES.fail,
      message: 'Error al obtener solicitudes',
    })
  } finally {
    hideLoader()
  }
}

export {
  getEntesAsignaciones,
  getEntesAsignacion,
  getEnteSolicitudesDozavos,
  getEnteSolicitudDozavos,
  getEnteSolicitudDozavosMes,
  registrarEnteSolicitudDozavo,
}
