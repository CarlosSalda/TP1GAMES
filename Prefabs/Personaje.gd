extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var gravedad = 5
var salto = 0
var collision




func _ready():
 pass


func _process(delta):
	caerYSaltar()
	dejaDeSubir(delta)
	

func caerYSaltar():
	collision = move_and_collide(Vector2(0,gravedad - salto))
	if collision != null:
		salto = collision.collider.colision()
		print(gravedad - salto)
		
		
		
		

	
	
func dejaDeSubir(deltis):
	if salto >0 :
		salto -= (gravedad + salto)/2 * deltis
	

		

	



	

