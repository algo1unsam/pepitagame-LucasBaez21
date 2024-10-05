import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {
	var property position = game.at(3, 0)
	method image() = "silvestre.png"
	method position() {
		if(pepita.position().x()>= 3){
			position = game.at(pepita.position().x(),0)
		}
		return position
	}
	method teEncontro(ave) {
		game.say(ave, "¡PERDÍ!")
		game.schedule(2000, { game.stop() })
	}
	
}
