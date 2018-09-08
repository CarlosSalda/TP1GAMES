extends Node2D
export var list = []
export var rango1X= 0
export var rango2X= 0
export var cantidadMax = 0
var personaje
var puntaje
var text
export var distancia= 0
var yDePlataformas = 0
var scene = load("res://Escena/PanelPerdiste.tscn") 
var scene_instance = scene.instance()
func _ready():
	rango2X = get_viewport().size.x - 50
	text = get_node("CanvasLayer/Label")
	personaje = get_node("Personaje")
	ponerPrimeraPlataforma()
	yDePlataformas = personaje.position.y
	cantidadDePlataformas(15)
	


func _process(delta):
	
	Puntaje()

	
func cantidadDePlataformas(cant):
	for i in cant :
		Plataformas()

func MostrarMenuMeMori():
		get_tree().paused = true
		scene_instance.set_name("perdiste")
		add_child(scene_instance)
		

func Puntaje():
	if personaje.tiempoDeCaida == 0:
		puntaje = str(-(int( personaje.position.y))/50)
		text.text = puntaje

func ponerPrimeraPlataforma():
	var scene_instance = list[1]
	scene_instance = scene_instance.instance()
	scene_instance.set_name("Plataforma")
	add_child(scene_instance)
	scene_instance.translate(Vector2(personaje.position.x,personaje.position.y + 100))	

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
		scene_instance.translate(Vector2 (DameAleatorio(posActualX + rango1X + 50,posActualX + rango2X),DameAleatorio(yDePlataformas ,yDePlataformas -10)))
		yDePlataformas -= distancia
	print("MAS PLATAFORMAS")

		

		
func DameAleatorio(rango1,rango2):
	return 	(rand_range(rango1,rango2))