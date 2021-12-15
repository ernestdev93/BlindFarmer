extends Node

func _ready():
	var callback= funcref(self, "_activateMenu")
	$Menu/Reader._playsound("mainmenu", callback)
	var al = ["startgame","options","tutorial"]
	al.invert()
	$Menu.audios = al

func _activateMenu():
	$Menu.mCallfunc = funcref(self, "_on_selected_option")
	$Menu._startMenu()
	#$Reader._playsound("win")

func _on_selected_option(option):
	if(option == "startgame"):
		get_tree().change_scene("res://CollectMenu.tscn")
	if(option == "tutorial"):
		_playWait("tutorialtalk", "_gotoMain")

func _gotoMain():
	get_tree().change_scene("res://MainMenu.tscn")

func _playWait(audio, funct):
	var ref = funcref(self, funct)
	$Menu/Reader._playsound(audio, ref)
