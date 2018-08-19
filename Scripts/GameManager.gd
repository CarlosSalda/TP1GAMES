extends Node2D

var scene  = load("res://Prefabs/Plataforma.tscn")
var scene_instance = scene.instance()

export var rango1X= 0
export var rango2X= 0
export var Maximo = 0
export var cantidadMax = 0
var personaje
var puntaje
var text
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	text = get_node("CanvasLayer/Label")
	personaje = get_node("Personaje")
	Plataformas()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass



func _process(delta):
	
	Puntaje()
	
		

func Puntaje():
	puntaje = str(abs(int( personaje.position.y)))
	text.text = puntaje
	
func Plataformas(posActualX= 0,posActualY= 0):
	for i in abs(cantidadMax):
		var scene_instance = scene.instance()
		scene_instance.set_name("Plataforma")
		add_child(scene_instance)
		scene_instance.translate(Vector2 (DameAleatorio(posActualX + rango1X,posActualX + rango2X),DameAleatorio(Maximo,Maximo + 10)))
		Maximo -= 70
		print(scene_instance.position)
		
func DameAleatorio(rango1,rango2):
	return 	(rand_range(rango1,rango2))