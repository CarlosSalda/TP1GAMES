extends KinematicBody2D

export var gravedad = 8
var salto = 0
var collision
var padre
export var velMov = 0
var tiempoDeCaida = 0
export var tiempoDeCaidaMax = 1
var saltoExtra = 0
var sprite
var fuego1
var unSalto = false

func _ready():
	fuego1 = get_node("Fuego1")
	padre = get_parent()
	sprite = get_node("Sprite")
	self.set_meta("type","Personaje")
	

func _process(delta):
	aumentarDificultad(delta)
	caerYSaltar(delta)
	dejaDeSubir(delta)
	MovIzq()
	MovDer()
	Acomodarse()
	contarTiempoDeCaida(delta)
	MeMori()
	
func caerYSaltar(deltis):
	collision = move_and_collide(Vector2(0,gravedad - salto ))		
	if collision != null and collision.collider.get_meta("type") == "Plataforma": #Alto cortocircuito guarda
		print(collision)
		tiempoDeCaida = 0
		salto = collision.collider.colision(self)
		collision = null
		print(gravedad - salto)
	if collision != null and collision.collider.get_meta("type") == "PowerUp":
		collision.collider.colision(self)
		tiempoDeCaida = 0 #esto es por si es un power up que te  hace saltar 
	

func aumentarDificultad(delta):
	gravedad += 0.09 * delta
	velMov += 0.05 * delta

func MeMori():
	if tiempoDeCaida >= tiempoDeCaidaMax:
		padre.MostrarMenuMeMori()
		
func MovIzq():
	if Input.is_action_pressed("ui_left"):
		position.x -= velMov
		sprite.flip_h = true
		
func MovDer():
	if Input.is_action_pressed("ui_right"):
		position.x += velMov
		sprite.flip_h = false
		

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
		fuego1.visible = true

		#get_node("Camera2D").limit_bottom = position.y +1000
		salto -= (gravedad + salto)/2 * deltis
	if gravedad - salto > 0:
		fuego1.visible = false
	

		

	



	

