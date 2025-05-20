// CLASES
// "molde" para objetos 
// sintaxis:
//           class Clase {
//              codigo 
//           }

class Corsa {
  var property color        //puedo definir un atributo sin inicializar

  method capacidad() = 4

  method velocidadMax() = 150

  method peso() = 1300
}

// Instanciar objeto a partir de una clase:
//                                          new Clase(atributo = valor)
// ejemplo:
//          new Corsa(color="rojo")

// para poder accederlo tengo que guardarlo en una variable o constante:
//                                                                       var unCorsa = new Corsa(color="rojo")

// o dentro de una lista:
//                        const listaDeAutos = [new Corsa(color="rojo")]
// agrego otro corsa a la lista:
//                               listaDeAutos.add(new Corsa(color="rojo")) --> es otra instancia de la clase corsa
// doy de alta una referencia:
//                             const primerCorsa = listaDeAutos.get(0) --> apunta a la instancia de la clase corsa en el i=0

class Kwid {
  var property tieneTanqueAdicional 

  method color() = "azul"

  method capacidad() = if (tieneTanqueAdicional) 3 else 4 

  method velocidadMax() = if (tieneTanqueAdicional) 110 else 120

  method peso() = 1200 + if (tieneTanqueAdicional) 150 else 0 
}

// trafic es un objeto porque es solo una 
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

// instanciar un Especial --> const especial1 = new Especial(capacidad=5, peso=1800, etc) no importa el orden

class Dependencia {
  const flota = []
  var property empleados = 0

  method agregarAFlota(rodado) {
    flota.add(rodado)
  }

  method quitarDeFlota(rodado) {
    flota.remove(rodado)
  }

  method pesoTotalFlota() = flota.sum({r => r.peso()})

  method estaBienEquipada() = self.tieneAlMenos3Rodados() && self.todosVanAlMenosA100()

  method tieneAlMenos3Rodados() = flota.size() >= 3

  method todosVanAlMenosA100() = flota.all({r => r.velocidadMax() >= 100})

  method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({r => r.capacidad()})

  method rodadosDeColor(color) = flota.filter({r => r.color() == color})

  method colorDelRodadoMasRapido() = self.rodadoMasRapido().color()

  method rodadoMasRapido() = flota.max({r => r.velocidadMax()})

  method capacidadFaltante() = self.cantidadEmpleados() - self.capacidadTotalFlota()

  method cantidadEmpleados() = empleados.size()

  method capacidadTotalFlota() = flota.sum({r => r.capacidad()})

  method esGrande() = (self.cantidadEmpleados() >= 40) && (self.cantidadRodados() == 5)

  method cantidadRodados() = flota.size()
}