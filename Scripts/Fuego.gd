extends AnimatedSprite

var padre
var posOriginal
func _ready():
	padre = get_parent()
	posOriginal = self.position.x
	

func _process(delta):
	acomodarmeAlPersonaje()

func acomodarmeAlPersonaje():
	if padre.sprite.flip_h == true:
		self.position.x = 22
	else:
		self.position.x = posOriginal