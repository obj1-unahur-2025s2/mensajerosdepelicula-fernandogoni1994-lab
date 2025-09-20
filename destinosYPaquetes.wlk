import mensajeros.*

//------------DESTINOS----------
object brooklyn {
    method puedePasar(unMensajero) {
            return unMensajero.peso() <= 1000
    }
}

object matrix {
    method puedePasar(unMensajero) {
            return unMensajero.puedeLlamar()
    }
}

//------------PAQUETES----------

/*
object paqueteMuestra {
  var precioPaquete = 200
  var estadoCuenta = 0

    method estaPago() { return precioPaquete == estadoCuenta } 

    method pagarPaquete(monto) {
        estadoCuenta = (estadoCuenta + monto).min(precioPaquete)
    }

    method establecerPrecioPaquete(monto) {
        precioPaquete = monto
    }
} */

object paquete {
  var estaPago = false
  var destino = brooklyn

    method estaPago() = estaPago

    method precio() = 50

    method registrarPago() {
        estaPago = true
    }

    method puedeSerEntregado(unMensajero) {
        return estaPago && destino.puedePasar(unMensajero)
    }

    method cambiarDestino(nuevo) {
        destino = nuevo
    }

}

object paquetito {
  var destino = brooklyn

    method estaPago() = true

    method precio() = 0

    method puedeSerEntregado(unMensajero) {
        return true
    } 

    method cambiarDestino(nuevo) {
        destino = nuevo
    }
}

object paqueton {
    var importePagado = 0
    const destinos = []

    method precio() = 100 * destinos.size()

    method recibirPago(unValor) {
        importePagado = (importePagado + unValor).min(self.precio())
    }

    method estaPago() {
        return importePagado == self.precio()
    }

    method puedeSerEntregado(unMensajero) {
        return destinos.all({aCadaElemento => aCadaElemento.puedePasar(unMensajero)}) && self.estaPago()
    } 

    method agregarDestino(unDestino) {
        destinos.add(unDestino)        
    }
}

