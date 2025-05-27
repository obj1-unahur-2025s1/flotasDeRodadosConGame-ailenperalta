import rodados.*
import dependencia.*

class Pedido {
    const property coloresIncompatibles = #{}
    var property distancia 
    var tiempoMax
    var property cantPasajeros 

    method initialize() {
        if (!distancia.between(1, 1000)) {
            self.error(distancia.toString() + " no es valido")
        }
        if (!tiempoMax.between(1, 100)) {
            self.error(tiempoMax.toString() + " no es valido")
        }
        if (!cantPasajeros.between(1, 10)) {
            self.error(cantPasajeros.toString() + " no es valido")
        }
    }

    method agregarColorIncompatible(unColor) {
        if (!coloresValidos.listaColores().contains(unColor)) {
            self.error(unColor.toString() + " no es un color valido")
        }
        coloresIncompatibles.add(unColor)
    }

    method velocidadRequerida() = distancia / tiempoMax

    method puedeSatisfacerPedido(unAuto) = self.tieneVelocidadMaxSuficiente(unAuto) && self.tieneCapacidadSuficiente(unAuto) && !self.esColorIncompatible(unAuto)

    method tieneVelocidadMaxSuficiente(unAuto) = unAuto.velocidadMax() >= (self.velocidadRequerida() + 10)

    method tieneCapacidadSuficiente(unAuto) = unAuto.capacidad() >= cantPasajeros

    method esColorIncompatible(unAuto) = coloresIncompatibles.contains(unAuto.color())

    method acelerar() {
        tiempoMax = (tiempoMax - 1).max(1)
    }

    method relajar() {
        tiempoMax += 1
    }
}

