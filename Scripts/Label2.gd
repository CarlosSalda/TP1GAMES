extends Label

var gameManager

func _ready():
	gameManager = get_parent().get_parent()
	self.text = "Puntaje " + String(gameManager.puntaje)


