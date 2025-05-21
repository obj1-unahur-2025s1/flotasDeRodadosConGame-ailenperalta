class Pedido {
    const coloresIncompatibles = #{}
    var property distancia 
    var property tiempoMax
    var property cantPasajeros 

    method agregarColor(unColor) {
        coloresIncompatibles.add(unColor)
    }

    method quitarColor(unColor) {
        coloresIncompatibles.remove(unColor)
    }

    method coloresIncompatibles() = coloresIncompatibles

    method velocidadRequerida() = distancia / tiempoMax

    method puedeSatisfacerPedido(unAuto) = self.tieneVelocidadMaxSuficiente(unAuto) && self.tieneCapacidadSuficiente(unAuto) && self.noEsColorIncompatible(unAuto)

    method tieneVelocidadMaxSuficiente(unAuto) = unAuto.velocidadMax() >= (self.velocidadRequerida() + 10)

    method tieneCapacidadSuficiente(unAuto) = unAuto.capacidad() >= cantPasajeros

    method noEsColorIncompatible(unAuto) = !self.coloresIncompatibles().contains(unAuto.color())

    method acelerar() {
        tiempoMax = (tiempoMax - 1).max(1)
    }

    method relajar() {
        tiempoMax += 1
    }
}