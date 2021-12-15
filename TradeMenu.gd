extends Node

func _ready():
#	var callback= funcref(self, "_activateMenu")
#	$MenuTrade/Reader._playsound("tradermenu", callback)
	if(TempoData.firstCycle == true):
		_playWait("tradetutorial", "_playIntro")
	else:
		_playIntro()
	TempoData.firstCycle = false

func _playIntro():
	_playWait("tradermenu", "_activateMenu")

func _activateMenu():
	$MenuTrade.mCallfunc = funcref(self, "_on_selected_option")
	#configuracion para que el menu funcione con items
	$MenuTrade._startMenu()


func _on_selected_option(option):
	pass

func _playWait(audio, funct):
	var ref = funcref(self, funct)
	$MenuTrade/Reader._playsound(audio, ref)

func _playWaits(audio, funct):
	var ref = funcref(self, funct)
	$MenuTrade/Reader._playsounds(audio, ref)
