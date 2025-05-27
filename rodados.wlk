class Corsa {
  var property color    

  method initialize() {
    if (not coloresValidos.listaColores().contains(color)){
        self.error(color.toString() + " no es un color valido")
    }
  }

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
  const property velocidadMax 

  method velocidadMax() = velocidadMax.min(topeVelocidadMax.tope()) 

  method initialize() {
    if (not coloresValidos.listaColores().contains(color)){
        self.error(color.toString() + " no es un color valido")
    }
  }
}

object topeVelocidadMax {
  var property tope = 200
}

object coloresValidos {
  const property listaColores = #{"rojo", "verde", "azul", "blanco", "negro", "beige"}
}