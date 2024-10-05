import comidas.*
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()
	method image() {
		return if (self.estaEnElNido()) "pepita-grande.png" else if (self.estaEnSilvestre() or self.estaCansada()) "pepita-gris.png" else "pepita.png"
	}
	method come(comida) {
		
		
			energia = energia + comida.energiaQueOtorga()
			game.removeVisual(comida)
		
	}
	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if (nuevaPosicion.x() >= 0 && nuevaPosicion.x() <= game.width() -1  && nuevaPosicion.y() >= 0 && nuevaPosicion.y() <= game.height() -1 ) {
			self.vola(position.distance(nuevaPosicion))
    		position = nuevaPosicion
			keyboard.c().onPressDo({if (!game.colliders(self).isEmpty()) {self.come(game.uniqueCollider(self))}})
 		}

		
	}

	method estaCansada() {
		if (energia <= 0) game.schedule(0000,{game.stop()})
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	method estaEnSilvestre(){
		return position == silvestre.position()
	}
	method caer() {
	if (!self.estaEnElSuelo()){
  		position = position.down(1)
	}
	}
} 

