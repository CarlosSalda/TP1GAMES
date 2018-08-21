extends StaticBody2D

# class member variables go here, for example:
# var a = 2

export var salto = 0
export var saltoExtra = 0
export var soyMovible = false
export var tiempoMov = 0 
var timer
var suma = 3
export var meRompo = false
#timeout is what says in docs, in signals
#self is who respond to the callback
#_on_timer_timeout is the callback, can have any name

func _ready():
	timer = Timer.new()
	timer.wait_time = tiempoMov
	timer.connect("timeout",self,"_on_timer_timeout") 
	add_child(timer)
	if soyMovible:
		timer.start()
		
func _process(delta):
	if soyMovible:
		mover()

	 	
func _on_timer_timeout():
	suma = suma * -1
		
func colision():
	if meRompo:
		queue_free()
	return salto + saltoExtra

		
func mover():
	self.position.x += suma
	
	
		
		
