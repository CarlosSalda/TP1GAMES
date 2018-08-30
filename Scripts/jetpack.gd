extends StaticBody2D

export var Impulso = 150
var gameManager 
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func _ready():
	gameManager = get_parent().get_parent()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func colision(personaje):
	gameManager.cantidadDePlataformas(3)
	return Impulso
	