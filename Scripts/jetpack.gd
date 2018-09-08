extends StaticBody2D

export var Impulso = 150
var gameManager 

func _ready():
	self.set_meta("type","PowerUp")
	gameManager = get_parent().get_parent()
	pass

func colision(personaje):
	gameManager.cantidadDePlataformas(3)
	personaje.salto += Impulso
	self.queue_free()
	