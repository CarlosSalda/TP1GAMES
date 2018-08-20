extends Node2D

var scene  = load("res://Prefabs/Plataforma.tscn")
var scene_resorte  = load("res://Prefabs/resorte.tscn")

export var rango1X= 0
export var rango2X= 0
export var Maximo = 0
export var cantidadMax = 0
var personaje
var puntaje
var text
export var maxResorte = 0
export var MaximoResorte = 0
export var distancia= 0
export var distanciaResorte =0
var camera
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	camera = get_node("Personaje/Camera2D")
	text = get_node("CanvasLayer/Label")
	personaje = get_node("Personaje")
	
	Plataformas()
	Resorte()
	
	# Called when the node is added to the scene for the first time.
	# Initialization here



func _process(delta):
	
	Puntaje()
	borrarInutiles()
	
func borrarInutiles():
	var hijos= get_children()
	var i = 1
	while(!hijos.empty() && i < hijos.size()):
		if hijos[i].position.y > personaje.position.y + 300 && hijos[i].name != "Personaje":
			hijos[i].queue_free()
		i += 1

func Puntaje():
	puntaje = str(abs(int( personaje.position.y)))
	text.text = puntaje
	
func Resorte(posActualX= 0,posActualY= 0):
	for i in maxResorte:
		var scene_instance_resorte = scene_resorte.instance()
		scene_instance_resorte.set_name("Resorte")
		add_child(scene_instance_resorte)
		scene_instance_resorte.translate(Vector2 (DameAleatorio(posActualX + rango1X,posActualX + rango2X),DameAleatorio(MaximoResorte,MaximoResorte+10)))
		MaximoResorte -= distanciaResorte
		
		
		
func Plataformas(posActualX= 0,posActualY= 0):
	for i in cantidadMax:
		var scene_instance = scene.instance()
		scene_instance.set_name("Plataforma")
		add_child(scene_instance)
		scene_instance.translate(Vector2 (DameAleatorio(posActualX + rango1X,posActualX + rango2X),DameAleatorio(Maximo,Maximo + 10)))
		Maximo -= distancia
		
		
func DameAleatorio(rango1,rango2):
	return 	(rand_range(rango1,rango2))