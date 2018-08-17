extends Node2D

var scene  = load("res://Prefabs/Plataforma.tscn")
var scene_instance = scene.instance()


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
func Plataformas():
	for i in DameAleatorio(5,10):
		var scene_instance = scene.instance()
		scene_instance.set_name("Plataforma")
		add_child(scene_instance)
		scene_instance.translate(Vector2 (DameAleatorio(0,1000),DameAleatorio(0,500)))
		print(scene_instance.position)
		
func DameAleatorio(rango1,rango2):
	return 	(rand_range(rango1,rango2))