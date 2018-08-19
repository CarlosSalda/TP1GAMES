extends Node2D
var scene= load("res://Prefabs/PanelPerdiste.tscn")
var scene_instance = scene.instance()
var Personaje
var tiempoCaidaMenu = 0
var tiempoCaidaMaxMenu = 0 
var scene_back= load("res://Escena/nivel1.tscn")
var scene_instance_back = scene.instance()
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Personaje = get_node("GameManager/Personaje")
	tiempoCaidaMenu = Personaje.tiempoDeCaida
	tiempoCaidaMaxMenu = Personaje.tiempoDeCaidaMax

func _process(delta):
	MostrarMenuMeMori()

func MostrarMenuMeMori():
	if tiempoCaidaMenu < tiempoCaidaMaxMenu:
		tiempoCaidaMenu = Personaje.tiempoDeCaida
		tiempoCaidaMaxMenu = Personaje.tiempoDeCaidaMax
	if tiempoCaidaMenu> tiempoCaidaMaxMenu:
		borrar()
		var scene_instance = scene.instance()
		scene_instance.set_name("MenuPerdiste")
		add_child(scene_instance)
		tiempoCaidaMaxMenu = 0
		tiempoCaidaMenu = 0
		
func VolverAJugar():
	borrar()
	var scene_instance_back = scene_back.instance()
	scene_instance_back.set_name("Back")
	add_child(scene_instance_back)		

func borrar():
	for i in get_children():
		i.queue_free()