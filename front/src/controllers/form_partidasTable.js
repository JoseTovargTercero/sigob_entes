import { getFormPartidas } from '../api/partidas.js'

const tableLanguage = {
  decimal: '',
  emptyTable: 'No hay datos disponibles en la tabla',
  info: 'Mostrando _START_ a _END_ de _TOTAL_ entradas',
  infoEmpty: 'Mostrando 0 a 0 de 0 entradas',
  infoFiltered: '(filtrado de _MAX_ entradas totales)',
  infoPostFix: '',
  thousands: ',',
  lengthMenu: 'Mostrar _MENU_',
  loadingRecords: 'Cargando...',
  processing: '',
  search: 'Buscar:',
  zeroRecords: 'No se encontraron registros coincidentes',
  paginate: {
    first: 'Primera',
    last: 'Última',
    next: 'Siguiente',
    previous: 'Anterior',
  },
  aria: {
    orderable: 'Ordenar por esta columna',
    orderableReverse: 'Orden inverso de esta columna',
  },
}

let partidasTable
export const validatePartidasTable = async () => {
  partidasTable = new DataTable('#partidas-table', {
    columns: [
      { data: 'partida' },
      {
        data: 'descripcion',
        render: function (data) {
          return `<div class="text-left">${data}</div>`
        },
      },
      { data: 'acciones' },
    ],
    responsive: true,
    scrollY: 400,
    language: tableLanguage,
    layout: {
      topStart: function () {
        let toolbar = document.createElement('div')
        toolbar.innerHTML = `
            <h5 class="text-center">Lista de partidas</h5>
                      `
        return toolbar
      },
      topEnd: { search: { placeholder: 'Buscar...' } },
      bottomStart: 'info',
      bottomEnd: 'paging',
    },
  })

  loadPartidasTable()
}

export const loadPartidasTable = async () => {
  let partidas = await getFormPartidas()

  if (!Array.isArray(partidas.fullInfo)) return

  if (!partidas || partidas.error) return

  let datosOrdenados = [...partidas.fullInfo].sort((a, b) => a.id - b.id)
  let data = datosOrdenados.map((el) => {
    // Verificar si la partida termina en ".0000"
    const mostrarPrimerBoton = el.partida.endsWith('.0000')

    return {
      partida: el.partida,
      nombre: el.nombre,
      descripcion: el.descripcion,
      acciones: `
        ${
          mostrarPrimerBoton
            ? `<button class="btn btn-sm bg-brand-color-1 text-white btn-add" data-copiaid="${el.id}"></button>`
            : ''
        }
        <button class="btn btn-sm bg-brand-color-2 text-white btn-update" data-editarid="${
          el.id
        }"></button>
        <button class="btn btn-danger btn-sm btn-destroy" data-eliminarid="${
          el.id
        }"></button>
      `,
    }
  })

  partidasTable.clear().draw()
  partidasTable.rows.add(data).draw()
}

export async function deletePartidaRow({ id, row }) {
  partidasTable.row(row).remove().draw()
}
