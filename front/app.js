import { validatePlanOperativoView } from './src/controllers/entes_planOperativoView.js'
import { validateSolicitudEntesView } from './src/controllers/entes_solicitudView.js'
import { validateTraspasosView } from './src/controllers/entes_traspasosView.js'

import { validateAsignacionEntesView } from './src/controllers/form_asignacionEntesView.js'

const d = document

d.addEventListener('DOMContentLoaded', (e) => {
  // GLOBAL

  // ENTES
  const solicitudEntesView = d.getElementById('solicitudes-entes-dozavos-view')
  const entesAsignacionView = d.getElementById('entes-asignacion-view')
  const planOperativoView = d.getElementById('plan-operativo-view')
  const traspasosView = d.getElementById('traspasos-view')

  // NOMINA

  // ENTES

  if (solicitudEntesView) {
    validateSolicitudEntesView()
  }
  if (entesAsignacionView) {
    validateAsignacionEntesView()
  }
  if (planOperativoView) {
    validatePlanOperativoView()
  }

  if (traspasosView) {
    validateTraspasosView()
  }
})
