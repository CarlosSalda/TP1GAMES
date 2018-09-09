extends AnimatedSprite

var padre
var posOriginal
func _ready():
	padre = get_parent()
	posOriginal = self.position.x
	

func _process(delta):
		acomodarmeAlPersonaje(22)

func acomodarmeAlPersonaje(muv):
	if padre.sprite.flip_h == true:
		self.position.x = muv
	else:
		self.position.x = posOriginal