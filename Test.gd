extends Node2D

var menu

func _ready():
	menu = get_node("ResMenu")
	menu.audios = ["up","Fireball1","down"]
