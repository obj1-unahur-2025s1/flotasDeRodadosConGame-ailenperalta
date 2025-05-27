import rodados.*
class Dependencia {
  const flota = []
  const pedidos = #{}
  var property empleados = 0  

  method agregarAFlota(rodado) {
    if (not coloresValidos.listaColores().contains(rodado.color())){
        self.error("El auto no tiene un color valido")
    }
    flota.add(rodado)
  }

  method quitarDeFlota(rodado) {
    flota.remove(rodado)
  }

  method agregarPedido(unPedido) {
    pedidos.add(unPedido)
  }

  method quitarPedido(unPedido) {
    pedidos.remove(unPedido)
  }

  method pesoTotalFlota() = flota.sum({r => r.peso()})

  method estaBienEquipada() = self.tieneAlMenosRodados(3) && self.todosVanAlMenosA100()

  method tieneAlMenosRodados(cantidad) = flota.size() >= cantidad

  method todosVanAlMenosA100() = flota.all({r => r.velocidadMax() >= 100})

  method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({r => r.capacidad()})

  method rodadosDeColor(color) = flota.filter({r => r.color() == color})

  method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()

  method rodadoMasRapido() = flota.max({r => r.velocidadMax()})

  method capacidadFaltante() = (empleados - self.capacidadTotalFlota()).max(0)

  method capacidadTotalFlota() = flota.sum({r => r.capacidad()})

  method esGrande() = (empleados >= 40) && self.tieneAlMenosRodados(5)

  method totalPasajeros() = pedidos.sum({p => p.cantPasajeros()}) 

  method pedidosRechazados() = pedidos.filter({p => !self.algunoPuedeSatisfacerPedido(p)})

  method algunoPuedeSatisfacerPedido(unPedido) = flota.any({a => unPedido.puedeSatisfacerPedido(a)})

  method esColorIncompatibleEnTodosLosPedidos(unColor) = pedidos.all({p => p.coloresIncompatibles().contains(unColor)})

  method relajarTodos() {
    pedidos.forEach({p => p.relajar()})
  }
}