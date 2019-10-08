class Especie {
	var numPokedex
	var nombreDeEspecie
	var velocidad
	var ternura
	var inteligencia
	
	method velocidad() {
		return velocidad
	}
	method ternura() {
		return ternura
	}
	method inteligencia() {
		return inteligencia
	}
	
}

class Rutina {
	var property ptsDeStamina
	var property consumo
	
	method loPuedeHacer(unPokemon) {
		return unPokemon.estaKO().negate() && unPokemon.cantDeStamina() >= ptsDeStamina 
	}
	
	method efectoA(unPokemon)

}

object escalarMontania inherits Rutina{
	
	override method ptsDeStamina() = 100
	override method consumo() = 120
	
	
	override method efectoA(unPokemon){
		unPokemon.disminuirStamina(self.ptsDeStamina())
		unPokemon.aumentaInteligencia(5)
	}
}

object surfear inherits Rutina {
	
	var kmsNadados
	
	override method ptsDeStamina() = 50
	override method consumo() = 100
	
	override method loPuedeHacer(unPokemon){
		return unPokemon.estaKO().negate() && unPokemon.cantDeStamina() > 50
	}
	
	override method efectoA(unPokemon){
		unPokemon.disminuirStamina(self.ptsDeStamina())
		unPokemon.aumentaVelocidad(5*kmsNadados)
		if (kmsNadados > 20)
			{
				unPokemon.estado("KO")
			}
	}
	
}
object bucear inherits Rutina{
	
	var kmsNadados
	
	override method ptsDeStamina() = 50
	override method consumo() = 100
	
	override method loPuedeHacer(unPokemon){
		return unPokemon.estaKO().negate() && unPokemon.cantDeStamina() > 50 && unPokemon.item() == "Snorkel"
	}
	
	override method efectoA(unPokemon){
		unPokemon.disminuirStamina(self.ptsDeStamina())
		unPokemon.aumentaVelocidad(5*kmsNadados)
		if (kmsNadados > 20)
			{
				unPokemon.estado("KO")
			}
	}
}

object hacerCaras inherits Rutina{
	
	override method ptsDeStamina() = 0
	override method consumo() = 10
	
	override method loPuedeHacer(unPokemon) = unPokemon.estaKO().negate()
	
	override method efectoA(unPokemon){
		unPokemon.disminuirStamina(self.ptsDeStamina())
		unPokemon.aumentaTernura(3)
	}
}


class Atributo {
	var cantidad
	
	method 
}





class Pokemon {
	var nickname
	var estado
	var cantDeStamina
	var item
	
	var especie
	
	//var caracteristicasFundamentales = [0,0,0] // V.T.I
	var velocidad
	var ternura
	var inteligencia
	
	
	method disminuirStamina(unaCantidad){
		cantDeStamina -= unaCantidad
	}
	
	method cantDeStamina() = cantDeStamina
	
	
	
	
	
	method puedeRealizar(unaRutina) {
		return unaRutina.loPuedeHacer(self)  
	}
	
	
	method estaKO() {
		return estado == "KO"
	}
	
	method totalDeCaracteristica() = 
	method totalDeTernura() {
		
		return ternura + especie.ternura()
	}
	method totalDeInteligencia() {
		
		return inteligencia + especie.inteligencia()
	}
	
	method estaMaximizado() {
		return 510 == velocidad + ternura +inteligencia 
	}
	
}