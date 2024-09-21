import cosas.*
import camino.*
import destino.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.reaccionar()
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	  
	}

	method todoPesoPar() { //si el peso de cada uno de los objetos cargados es un número par.
	    return cosas.all({cosa => self.esPar(cosa.peso())})
	}

	method esPar(peso) {
		return peso % 2 == 0
	  
	}

	method hayAlgunoQuePesa(peso) { //indica si hay alguno de los objetos cargados que tiene exactamente el peso indicado.
	    return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) { //devuelve el primer objeto cargado que encuentre, cuyo nivel de peligrosidad coincida exactamente con el valor indicado.
	    return cosas.find({cosa => cosa.nivel() == nivel})
	}

	method pesoTotal() { //es la suma del peso del camión vacío (tara) y su carga. La tara del camión es de 1000 kilos.
	    return cosas.sum({cosa => cosa.peso()}) + 1000
	}

	method excedidoDePeso() { //indica si el peso total es superior al peso máximo, que es de 2500 kilos.
	    return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) { //devuelve una colección con los objetos cargados que superan el nivel de peligrosidad indicado.
	    return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) { //devuelve una colección con los objetos cargados que son más peligrosos que la cosa indicada.
	    return cosas.filter({cosa => cosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) { //Puede circular si no está excedido de peso, y además, ninguno de los objetos cargados supera el nivel máximo de peligrosidad indicado.
	    return not self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad) == #{}
	}

	method tieneAlgoQuePesaEntre(min, max) { //indica si el peso de alguna de las cosas que tiene el camión está en ese intervalo
	    return cosas.any({cosa => cosa.peso().between(min, max)}) 
	}

	method cosaMasPesada() { //la cosa más pesada que tenga el camión. Ojo que lo que se pide es _la cosa_ y no su peso.
        return cosas.max({cosa => cosa.peso()})
	}

	method pesos() { //`pesos()`: devuelve una lista con _los pesos_ de cada cosa que tiene el camión.
	    return cosas.map({cosa => cosa.peso()}) 
	}

	method totalBultos() {
		return cosas.sum({cosa => cosa.cantBultos()})
	}


	method transportar(destino, camino) {
		self.validarCamion()
		camino.validarCamino(self)
		destino.irADestino(self)
		self.descargarCompleto()
	}

	method descargarCompleto() {
		cosas.clear()
	  
	}

	method validarCamion(){//El camión no tiene que estar excedido de peso
	    if (self.excedidoDePeso()){
			self.error("El camion no se puede transportar por exceso de peso")
		}

	}

}

