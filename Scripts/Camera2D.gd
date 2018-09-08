extends Camera2D
var personaje

func _ready():
	personaje = get_parent().get_node("Personaje")

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