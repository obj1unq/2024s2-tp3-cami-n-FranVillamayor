object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method cantBultos() {return 1}
	method reaccionar() {}
}

object bumblebee {
	var estadoActual = auto

	method reaccionar() {
	  estadoActual = robot
	}
	method peso() {
		return 800
	}

	method estadoActual(_estadoActual) {
		estadoActual = _estadoActual
	}

	method nivelPeligrosidad() {
		return estadoActual.nivelDePeligro()
	}
	method cantBultos() {return 2}

}

object auto {
	method nivelDePeligro() {return 15}
}
object robot {
	method nivelDePeligro() {return 30}
}

object paqueteLadrillos {
	var  cantLadrillos = 0

	method reaccionar() {
		cantLadrillos += 12
	}
	method nivelPeligrosidad() {return 2}
	method peso() {
		return cantLadrillos * 2
	}
	method cantBultos() {
		return if(cantLadrillos > 300) {3}
		else if (100>cantLadrillos <= 300 ){2}
		else {1}
	}
}
object arenaAGranel {
	var property peso = 0 
	method nivelPeligrosidad() {return 1}
	method cantBultos() {return 1}
	method reaccionar() {
		peso += 20
	}
}

object bateriaAntiaerea {
	var property hayMisiles = true

	method reaccionar() {
	  hayMisiles = true
	}

	method peso() {
		return if(self.hayMisiles()) {300}
		else {200}
	}
	method nivelPeligrosidad() {
		return if(self.hayMisiles()) {100}
		else {0}
	}
	method cantBultos() {
		return if(hayMisiles == true){2}
		else(1)
	}
}

object contenedorPortuario {
	const property contiene = #{}

	method reaccionar() {
		contiene.forEach({cosa => cosa.reaccionar()})
	}

	method cantBultos() {
		return contiene.size() + 1
	  
	} 

	method peso() {
		return 100 + self.pesoTotalContenido()
	}

	method pesoTotalContenido() {
	  return contiene.sum(contiene.peso())
	}

	method nivelPeligrosidad() {
		return if (self.estaVacioContenedor()){0}
		else {self.peligrosidadDeObjetoMasPeligroso()}
	}

	method estaVacioContenedor() {
		return contiene.isEmpy()
	}

	method peligrosidadDeObjetoMasPeligroso() {
		return contiene.filter({objeto => objeto.nivelPeligrosidad()}).max()
	  
	}
}

object residuosRadioactivos {
	var property peso = 0
	method nivelPeligrosidad() {return 200}
	method cantBultos() {return 1} 
	method reaccionar() {
		peso += 15
	}
}

object embalajeDeSeguridad {
    var property envuelve = paqueteLadrillos  
	method peso() {
		return envuelve.peso()
	}

	method nivelPeligrosidad() {
		return envuelve.nivelPeligrosidad() / 2	  
	}
	method cantBultos() {return 2}
	method reaccionar() {}
  
}



