extends Node2D
var area1
var newArea
export var list = []
var ultimo
var ultimoInstanciado
func _ready():
	area1 = get_node("Area2D")
	ultimoInstanciado = area1.position.y  
	ultimo = 900
	
func colision(target,colisionado):
	if target.get_meta("type") == "Personaje" and colisionado.position.y != ultimo:
		print(colisionado)
		var scene_instance = list[0].instance()
		scene_instance.set_name("Background")
		add_child(scene_instance)
		scene_instance.translate(Vector2(0,ultimoInstanciado- 1000))	
		ultimoInstanciado = scene_instance.position.y
		ultimo = scene_instance.position.y