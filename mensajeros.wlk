import vehiculos.*

object roberto {
  var vehiculo = bici

    method peso() {
        return 90 + vehiculo.peso()
    }
    
    method puedeLlamar() = false

    method cambiarVehiculo(nuevo) {
        vehiculo = nuevo
    }
}

object cNorris {

    method peso() = 80

    method puedeLlamar() = true

}

object neo {
  var tieneCredito = true  

    method peso() = 0

    method puedeLlamar() {
      return  tieneCredito
    }
/*
    method actualizarCredito(nuevoEstado) {
        tieneCredito = nuevoEstado
    }
*/
    method cargarCredito() {
        tieneCredito = true
    }    

    method agotarCredito() {
        tieneCredito = false
    }
}
