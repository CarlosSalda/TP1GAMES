extends Area2D
var padre
var personaje
var contar
func _ready():
	padre = get_parent()
	personaje = padre.get_parent().get_node("Personaje")
	self.connect("body_entered",self,"colision")
	
func _process(delta):
	if self.position.y - 5000 > personaje.position.y:
		self.queue_free()

func colision(target):
	padre.colision(target,self)
	print(self.name)

	
	
