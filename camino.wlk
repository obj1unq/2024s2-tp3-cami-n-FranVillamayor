import camion.*

object ruta9 {
    method soportaElCamino() {
        if (not camion.puedeCircularEnRuta(11)){
            self.error("El camino no soporta el camion por su nivel de peligrosidad")
        }
      
    }
  
}

object caminoVecinal {
    const pesoMaximoSoportado = 0 
    method soportaElCamino() {
        if (pesoMaximoSoportado < camion.pesoTotal()){
            self.error("El camino no soporta el peso del camion")
        }

    }
}
