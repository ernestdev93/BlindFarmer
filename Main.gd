extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _ready():
	var callback = funcref(self, "_on_finished")
	$Reader._playsounds(["blindfarmer", "menuhelp"],callback )

func _on_finished():
	get_tree().change_scene("res://MainMenu.tscn")


#func _process(delta):
	#if($Reader.playArray == false):
	#	get_tree().change_scene("res://ResMenu.tscn")
