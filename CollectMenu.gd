extends Node

#nota: para mejorar el menu
# tengo que poner dentro de este nodo Menu las logicas que se repiten
# en todos los menus parte del codigo que aparece
# en la clase padre de este nodo

func _ready():
	if(TempoData.firstCycle):
		_playWait("tutorialtalk", "_menuIntro")
	else:
		_menuIntro()
	#var callback= funcref(self, "_activateMenu")
	#$Reader._playsound("collectmenu", callback)

func _menuIntro():
	_playWaits(["whatwould","menu"], "_activateMenu")

func _activateMenu():
	
	$Menu.audios = ["carrot","apple"]
	$Menu.mCallfunc = funcref(self, "_on_selected_option")
	$Menu._startMenu()
	#$Reader._playsound("win")

func _on_selected_option(option):
	TempoData.retocollect = option
	if(TempoData.firstCycle):
		_playWait("farmtutorial", "_gotoFarm")
	else:
		_gotoFarm()

func _gotoFarm():
	get_tree().change_scene("res://Harvest.tscn")

func _playWait(audio, funct):
	var ref = funcref(self, funct)
	$Reader._playsound(audio, ref)

func _playWaits(audio, funct):
	var ref = funcref(self, funct)
	$Reader._playsounds(audio, ref)
