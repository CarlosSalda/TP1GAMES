extends Node2D
export var list = []
export var rango1X= 0
export var rango2X= 0
export var cantidadMax = 0
var personaje
var puntaje
var text
export var distancia= 0
var timer
var camera
var yDePlataformas = 0
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	camera = get_node("Personaje/Camera2D")
	text = get_node("CanvasLayer/Label")
	personaje = get_node("Personaje")
	yDePlataformas = personaje.position.y
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1
	timer.connect("timeout",self,"_on_timer_timeout") 
	timer.start()
	Plataformas()
	# Called when the node is added to the scene for the first time.
	# Initialization here



func _process(delta):
	
	Puntaje()
	borrarInutiles()
	
func borrarInutiles():
	var hijos= get_children()
	var i = 4
	while(!hijos.empty() && i < hijos.size()):
		if hijos[i].position.y > personaje.position.y + 600 and hijos[i].name != "Personaje":
			hijos[i].queue_free()
		i += 1

func Puntaje():
	puntaje = str(-(int( personaje.position.y)))
	text.text = puntaje
	

func _on_timer_timeout():
	Plataformas()
	print("mas plataformas")
		
		
func Plataformas(posActualX= 0,posActualY= 0):
	for i in cantidadMax:
		var scene_instance = list[int(DameAleatorio(0,3))]
		scene_instance = scene_instance.instance()
		scene_instance.set_name("Plataforma")
		add_child(scene_instance)
		scene_instance.translate(Vector2 (DameAleatorio(posActualX + rango1X,posActualX + rango2X),DameAleatorio(yDePlataformas,yDePlataformas - 10)))
		yDePlataformas -= distancia
		

		

		
func DameAleatorio(rango1,rango2):
	return 	(rand_range(rango1,rango2))