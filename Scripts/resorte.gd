extends StaticBody2D

# class member variables go here, for example:
# var a = 2

export var salto = 0
export var saltoExtra = 0
export var soyMovible = false
export var tiempoMov = 1 
var timer
var suma = 2
export var meRompo = false
export var listPowerUp= []
export var puedoTenerPowerUp = false
var personaje= null
export var distanciaDeBorrado = 600
var scene = load("res://Prefabs/jetpack.tscn") #Momentaneo
var scene_instance = scene.instance()
var gameManager 
#timeout is what says in docs, in signals
#self is who respond to the callback
#_on_timer_timeout is the callback, can have any name

func _ready():
	self.set_meta("type","Plataforma")
	gameManager = get_parent()
	timer = Timer.new()
	timer.wait_time = tiempoMov
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer)
	personaje = get_parent().get_node("Personaje")
	if soyMovible:
		timer.start()
	posibilidadDePlataforma()
		
func _process(delta):
	aumentarDificultad(delta)
	borrameSiNoEstoyVisible()
	if soyMovible:
		mover()
		
func aumentarDificultad(delta):
		salto += 0.4 * delta
	
func posibilidadDePlataforma():
	if  int(rand_range(1,15)) == 5 && puedoTenerPowerUp:
		scene_instance.set_name("PowerUp")
		add_child(scene_instance)
		scene_instance.translate(Vector2(position.x,position.y-50))
func _on_timer_timeout():
	suma = suma * -1
		
func colision(personaje):
	if meRompo:
		queue_free()
	gameManager.Plataformas() 
	return salto + saltoExtra


		
func borrameSiNoEstoyVisible():
	if(self.position.y - distanciaDeBorrado > personaje.position.y):
		self.queue_free()
		
func mover():
	self.position.x += suma
	if self.position.x < 50:
		_on_timer_timeout()
	if self.position.x > get_viewport().size.x - 50:
		_on_timer_timeout()
	
	
		
		
