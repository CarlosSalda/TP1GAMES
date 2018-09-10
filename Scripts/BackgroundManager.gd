extends Node2D
var ultimo
var guardamelo
var background1
var background2
var personaje
var actual
func _ready():
	
	background1 = get_node("Background")
	background2 = get_node("Background2")
	personaje = get_parent().get_node("Personaje")
	actual = background1
	ultimo = background2
	
func _process(delta):
	colision()
	
func colision():
	if personaje.position.y < actual.position.y and personaje.position.y != ultimo.position.y :
		ultimo.translate(Vector2(0,-4000))
		guardamelo = actual
		actual = ultimo
		ultimo = guardamelo