extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var padre
var posOriginal
func _ready():
	padre = get_parent()
	posOriginal = self.position.x
	

func _process(delta):
	if padre.sprite.flip_h == true:
		self.position.x = 22
	else:
		self.position.x = posOriginal
		#self.position = 
	