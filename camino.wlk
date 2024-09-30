import camion.*

object ruta9 {
    method soportaElCamino(camion) {
       return camion.puedeCircularEnRuta(11)
    }
    method validarCamino(camion) {
    if (not self.soportaElCamino(camion)) {
        self.error("El camino no soporta el camion por su nivel de peligrosidad")
    }
}
  
}

object caminoVecinal {
    const pesoMaximoSoportado = 0
    method validarCamino(camion) {
        if (pesoMaximoSoportado < camion.pesoTotal()){
            self.error("El camino no soporta el peso del camion")
        }

    }
}
