function validateUrl() {
  let url = new URL(window.location.href)
  let protocol = url.protocol
  let host = url.host
  let pathname = url.pathname

  return `${protocol}//${host}`
}

const config = {
  BASE_URL: validateUrl(),
  APP_NAME: 'sigob_entes',
  DIR: 'back',
  MODULE_NAMES: {
    ENTES: 'modulo_entes',
    GLOBAL: 'sistema_global',
    FORMULACION: 'modulo_pl_formulacion',
  },
}

console.log(config)

export default config
