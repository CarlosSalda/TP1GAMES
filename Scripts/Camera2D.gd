extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var personaje

func _ready():
	personaje = get_parent().get_node("Personaje")
	# Called when the node is added to the scene for the first time.
	# Initialization here
	

func _process(delta):
	dejarDeSeguir()
	posicionInicial()
 	
	

func dejarDeSeguir():
	if personaje.tiempoDeCaida >  1.5 :
		self.current = false
	if personaje.tiempoDeCaida < 1.5:
		self.current = true	
		
func posicionInicial():
	self.position.y = personaje.position.y