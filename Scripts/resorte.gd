extends RigidBody2D

# class member variables go here, for example:
# var a = 2

export var salto = 0
export var saltoExtra = 0

func _ready():
	#set_contact_monitor( true )
	#set_max_contacts_reported( 5 )
	#connect("body_entered",self,"colision")
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func colision():
	return salto + saltoExtra


	
