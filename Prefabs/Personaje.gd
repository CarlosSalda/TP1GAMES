extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass



#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func saltar(saltoExtra = 0, salto = 0):
	apply_impulse(Vector2(0,0),Vector2(0,salto + saltoExtra))
	
	
	
	




			