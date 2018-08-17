extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var gravedad = 5
var salto = 0
var collision
var padre
export var velMov = 0
var tiempoDeCaida = 0



func _ready():
	padre = get_parent()


func _process(delta):
	caerYSaltar(delta)
	dejaDeSubir(delta)
	MovIzq()
	MovDer()
	Acomodarse()
	

	
func caerYSaltar(deltis):
	collision = move_and_collide(Vector2(0,gravedad - salto))
	tiempoDeCaida += 1 *deltis
	print(tiempoDeCaida)
	if collision != null:
		tiempoDeCaida = 0
		salto = collision.collider.colision()
		collision = null
		print(gravedad - salto)
		
		
func MovIzq():
	if Input.is_action_pressed("ui_left"):
		position.x -= velMov
		
func MovDer():
	if Input.is_action_pressed("ui_right"):
		position.x += velMov

func Acomodarse():
	if position.x < -40:
	   position.x = 1000	
	if position.x > 1000:
		position.x= -40
	
	
func dejaDeSubir(deltis):
	if salto >0 :
		salto -= (gravedad + salto)/2 * deltis
		


		

	



	

