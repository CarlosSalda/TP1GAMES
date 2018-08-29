extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var gravedad = 8
var salto = 0
var collision
var padre
export var velMov = 0
var tiempoDeCaida = 0
export var tiempoDeCaidaMax = 1


func _ready():
	padre = get_parent()


func _process(delta):
	caerYSaltar(delta)
	dejaDeSubir(delta)
	MovIzq()
	MovDer()
	Acomodarse()
	contarTiempoDeCaida(delta)
	MeMori()
	
func caerYSaltar(deltis):
	collision = move_and_collide(Vector2(0,gravedad - salto))		
	if collision != null:
		tiempoDeCaida = 0
		salto = collision.collider.colision(self)
		collision = null
		print(gravedad - salto)

func MeMori():
	if tiempoDeCaida >= tiempoDeCaidaMax:
		padre.MostrarMenuMeMori()
		
func MovIzq():
	if Input.is_action_pressed("ui_left"):
		position.x -= velMov
		
func MovDer():
	if Input.is_action_pressed("ui_right"):
		position.x += velMov

func Acomodarse():
	if position.x < 0: # arreglar resolucion
	   position.x = get_viewport().size.x
	if position.x > get_viewport().size.x:
		position.x= 0

func contarTiempoDeCaida(delta):
	if gravedad - salto > 0:
		tiempoDeCaida += 1 * delta
		print(tiempoDeCaida)

func dejaDeSubir(deltis):
	if salto >0 :
		get_node("Camera2D").limit_bottom = position.y +1000
		salto -= (gravedad + salto)/2 * deltis
	
		

		

	



	

