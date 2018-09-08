extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var gameManager

func _ready():
	gameManager = get_parent().get_parent()
	self.text = "Puntaje " + String(gameManager.puntaje)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
