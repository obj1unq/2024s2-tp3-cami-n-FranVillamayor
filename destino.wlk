import camion.*
import cosas.*



object almacen {
    const property cosas = #{} 

    method irADestino() {
        self.validarBultos()
        self.descargarCamion()
	}

    method descargarCamion() {
        cosas.addAll(camion.cosas())
    }

    method validarBultos() {
        if(not self.puedeDescargar()){
            self.error("El almacen esta lleno entonces no se puede transportar")
        }
    }

    method puedeDescargar() {
      return self.totalBultos() + camion.totalBultos() <= 3
    }

    method totalBultos() {
		return cosas.sum({cosa => cosa.cantBultos()})
	}
  
}

/*
El camión de transporte transporta los elementos al almacén. Al llegar al almacén, todas las cosas que están en el camión pasan al almacén: 
Por ejemplo, si el camión tiene a knigth Rider y a Bumblebee, mientras que  el almacén está la arena a granel, cuando el camión llega éste queda vacío y en el almacén quedan bumblebee, arena a grandel y Knigth Rider.

Para que el transporte pueda ser realizado debe cumplirse con las siguientes condiciones:
* El camión no tiene que estar excedido de peso
* El almacén tiene una cantidad de bultos máximos que no puede superar. Por ejemplo, si contiene arena a granel (1 bulto), el máximo de bultos
del almacén se configura en 3, y el camión contiene a Bumblebee y Knight Rider (3 bultos), entonces no se puede transportar.
*/

