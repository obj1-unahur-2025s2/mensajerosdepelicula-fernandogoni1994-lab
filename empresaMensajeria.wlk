import destinosYPaquetes.*
import mensajeros.*

object empresa {
    const mensajeros = []
    const paquetesEnviados = []     //3.4
    const paquetesPendientes = []   //3.4

    
    method contratar(unMensajero) {
        mensajeros.add(unMensajero)
    }

    method despedir(unMensajero) {
        mensajeros.remove(unMensajero)
    }

    method despedirATodos() {
        mensajeros.clear()
    }

    method esGrande() {
        return mensajeros.size() > 2
    }


    method puedeEntregarPrimerEmpleado(unPaquete) {
        return if(not mensajeros.isEmpty()) {
            unPaquete.puedeSerEntregado(mensajeros.first())
        } else {false}
    }


    method pesoUltimoMensajero() {
        return if(not mensajeros.isEmpty()) {
            mensajeros.last().peso()
        }
    }

// 3.1
    method empresaPuedeEntregar(unPaquete) {
        return mensajeros.any({m => unPaquete.puedeSerEntregado(m)})
    }

// 3.2
    method todosLosQuePuedenLlevar(unPaquete) {
        return mensajeros.filter({m => unPaquete.puedeSerEntregado(m)})
    }

// 3.3
    method tieneSobrepeso() {
        (mensajeros.sum({m => m.peso()}) / mensajeros.size()) > 500
 // mensajeros.map({m => m.peso()}).sum() / idem
    }

// 3.4
    method enviarPaquete(unPaquete) {
        if(self.empresaPuedeEntregar(unPaquete)) {
            paquetesEnviados.add(unPaquete)} else {
                paquetesPendientes.add(unPaquete)
            }
    }

// 3.5
    method facturar() {
        return paquetesEnviados.sum({p => p.precio()})
    }

// 3.6
    method enviarConjunto(conjuntoDePaquetes) {
        conjuntoDePaquetes.forEach({p => self.enviarPaquete(p)})
    }

// 3.7
    method paquetePendienteMasCaro() {
        return paquetesPendientes.max({pp => pp.precio()})
    }
    
    method enviarPaquetePendienteMasCaro() {
        if(self.empresaPuedeEntregar(self.paquetePendienteMasCaro())) {
        self.enviarPaquete(self.paquetePendienteMasCaro())
        paquetesPendientes.remove(self.paquetePendienteMasCaro()) }
    } 
}