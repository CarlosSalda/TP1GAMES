extends RigidBody2D

# class member variables go here, for example:
# var a = 2

export var salto = -200
export var saltoExtra = -300
func _ready():
	set_contact_monitor( true )
	set_max_contacts_reported( 5 )
	connect("body_entered",self,"colision")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func colision(who):
	print(self.get_name()," is colliding with ",who.get_name())
	if who.get_name() == "Personaje":
		who.saltar(salto,saltoExtra)
	
