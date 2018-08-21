extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var personaje

func _ready():
	personaje = get_parent()
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	pass

func _process(delta):
	if personaje.tiempoDeCaida >  2.6 :
		self.current = false