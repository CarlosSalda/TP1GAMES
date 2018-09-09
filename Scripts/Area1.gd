extends Area2D
var padre
var personaje
var contar
func _ready():
	padre = get_parent()
	personaje = padre.get_parent().get_parent().get_node("Personaje")
	self.connect("body_entered",self,"colision")

func _process(delta):
	#falta borrar
	pass
	

func colision(target):
	padre.get_parent().colision(target,self)

	
	
