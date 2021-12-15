extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	NorthTrader._refreshPrices()
	for re in NorthTrader.allRes():
		print(re.nam+str(re.sellprice)+str(re.buyprice))


func _input(event):
	if event.is_action_pressed("ui_down"):
		$Reader._playsounds(["up", "left","left", "up"])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
