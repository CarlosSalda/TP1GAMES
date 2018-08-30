extends Node2D
export var list = []
export var rango1X= 0
export var rango2X= 0
export var cantidadMax = 0
var personaje
var puntaje
var text
export var distancia= 0
#var timer
var camera
var yDePlataformas = 0
func _ready():
	ponerPrimeraPlataforma()
	rango2X = get_viewport().size.x - 20
	camera = get_node("Personaje/Camera2D")
	text = get_node("CanvasLayer/Label")
	personaje = get_node("Personaje")
	yDePlataformas = personaje.position.y
	#timer = Timer.new()
	#add_child(timer)
	#timer.wait_time = 1
	#timer.connect("timeout",self,"_on_timer_timeout") 
	#timer.start()
	cantidadDePlataformas(15)
	# Called when the node is added to the scene for the first time.
	# Initialization here



func _process(delta):
	
	Puntaje()

	
func cantidadDePlataformas(cant):
	for i in cant :
		Plataformas()

func MostrarMenuMeMori():
		get_tree().change_scene("res://Escena/PanelPerdiste.tscn")
		

func Puntaje():
	puntaje = str(-(int( personaje.position.y))/100)
	text.text = puntaje

func ponerPrimeraPlataforma():
	var scene_instance = list[1]
	scene_instance = scene_instance.instance()
	scene_instance.set_name("Plataforma")
	add_child(scene_instance)
	scene_instance.translate(Vector2(504,-326))	

#func _on_timer_timeout():
#	Plataformas()
#	print("mas plataformas")
	
		
	#Esta medio fiero	
func Plataformas(posActualX= 0,posActualY= 0, extra = 0):
	for i in cantidadMax :
		var scene_instance = list[int(DameAleatorio(1,list.size()))]
		scene_instance = scene_instance.instance()
		scene_instance.set_name("Plataforma")
		add_child(scene_instance)
		scene_instance.translate(Vector2 (DameAleatorio(posActualX + rango1X,posActualX + rango2X),DameAleatorio(yDePlataformas ,yDePlataformas -10)))
		yDePlataformas -= distancia
	print("MAS PLATAFORMAS")

		

		
func DameAleatorio(rango1,rango2):
	return 	(rand_range(rango1,rango2))