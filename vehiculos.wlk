object bici {
    method peso() = 5
}

object camion {
  var numAcoplados = 1

    method peso() = 500 * (numAcoplados.max(1))


    method cantidadDeAcoplados(nuevaCantidad) {
            numAcoplados = nuevaCantidad
    }
}