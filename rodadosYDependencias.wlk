class Corsa {
  var property color       

  method capacidad() = 4

  method velocidadMax() = 150

  method peso() = 1300
}

class Kwid {
  var property tieneTanqueAdicional 

  method color() = "azul"

  method capacidad() = if (tieneTanqueAdicional) 3 else 4 

  method velocidadMax() = if (tieneTanqueAdicional) 110 else 120

  method peso() = 1200 + if (tieneTanqueAdicional) 150 else 0 
}

object trafic {
  var property interior = comodo
  var property motor = pulenta

  method color() = "blanco"

  method capacidad() = interior.capacidad()

  method velocidadMax() = motor.velocidad()

  method peso() = 4000 + interior.peso() + motor.peso()
}

object comodo {
  method capacidad() = 5

  method peso() = 700
}

object popular {
  method capacidad() = 12

  method peso() = 1000
}

object pulenta {
  method velocidad() = 130

  method peso() = 800
}

object bataton {
  method velocidad() = 80

  method peso() = 500
}

class Especial {
  var property peso
  var property color 
  var property capacidad
  var property velocidadMax
  //const property velocidadMax --> no puede cambiar, le doy un valor inicial y siempre va a ser ese (pero cada auto(instancia) puede tener un valor distinto) 
  //method velocidadMax() = velocidadMax.min(topeVelocidadMax.tope()) --> cada instancia puede tener una velocidadMax pero lo que va a informar va a depender del objeto externo topeVelocidadMax
}

// object topeVelocidadMax {
//   var property tope = 200
// }

class Dependencia {
  const flota = []
  const pedidos = []
  var property empleados = 0

  method agregarAFlota(rodado) {
    flota.add(rodado)
  }

  method quitarDeFlota(rodado) {
    flota.remove(rodado)
  }

  method agregarPedido(unPedido) {
    pedidos.add(unPedido)
  }

  method eliminarPedido(unPedido) {
    pedidos.remove(unPedido)
  }

  method pedidos() = pedidos

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

  method totalPasajeros() = self.pedidos().sum({p => p.cantPasajeros()}) 

  method pedidosRechazados() = pedidos.filter({p => !flota.any({auto => p.puedeSatisfacerPedido(auto)})})

  method esColorIncompatibleEnTodosLosPedidos(unColor) = self.pedidos().all({p => p.coloresIncompatibles().contains(unColor)})

  method relajarTodos() {
    self.pedidos().forEach({p => p.relajar()})
  }
}