extends Node2D

var scene  = load("res://Prefabs/Plataforma.tscn")
var scene_instance = scene.instance()
export var rango1X= 0
export var rango2X= 0
export var rango1Y= 0
export var rango2Y= 0
export var cantidadMin= 0
export var cantidadMax = 0

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Plataformas()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func Plataformas(posActualX= 0,posActualY= 0):
	for i in DameAleatorio(cantidadMin,cantidadMax):
		var scene_instance = scene.instance()
		scene_instance.set_name("Plataforma")
		add_child(scene_instance)
		scene_instance.translate(Vector2 (DameAleatorio(posActualX + rango1X,posActualX + rango2X),DameAleatorio(posActualY+ rango1Y,posActualY + rango2Y)))
		print(scene_instance.position)
		
func DameAleatorio(rango1,rango2):
	return 	(rand_range(rango1,rango2))