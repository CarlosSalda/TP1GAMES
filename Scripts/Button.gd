extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var panelPerdi = false
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _pressed():
	get_tree().change_scene("res://Escena/nivel1.tscn")
	soyPanelPerdi()

func soyPanelPerdi():
	get_tree().paused = false
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
