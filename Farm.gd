extends Node

var dirs = ["left", "right","up","down"]
var reader 
var rng = RandomNumberGenerator.new()
var temprand: int = 0
var well : int = 5
var first : bool =true
var reamount : int = 0

onready var timer= $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	print(TempoData.retocollect)
	rng.randomize()
	timer.wait_time = rng.randi_range(15,20)
	timer.start() 
	reader = $Reader
	_randNum()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
 
var keypressed:String = ""
var enablekeys = true

func _input(event):
	if(enablekeys):
		if event.is_action_pressed("ui_down"):
			keypressed="down"
			_checkPressed()
		

		if event.is_action_pressed("ui_up"):
			keypressed="up"
			_checkPressed()
		
		
		if event.is_action_pressed("ui_left"):
			keypressed="left"
			_checkPressed()
		
		
		if event.is_action_pressed("ui_right"):
			keypressed="right"
			_checkPressed()
	
	
func _checkPressed():
	if(keypressed==dirs[temprand]):
		well -= 1
		if(well == 0):
			enablekeys = false
			var reef= funcref(self, "_randNum")
			reader._playsound("youfoundit", reef)
			well = rng.randi_range(5,10)
			first = true
			reamount += 1
		else:
			_randNum()
		
		print(well)
	else:
		enablekeys = false
		reamount = 0
		well = rng.randi_range(5,10)
		var reeff= funcref(self, "_randNum")
		first=true
		reader._playsound("youlostthem", reeff)

func _randNum():
	enablekeys = true
	rng.randomize()
	temprand = rng.randi_range(0,3)
	if(first):
		reader._playsound(dirs[temprand])
		first = false
	else:
		reader._playsounds(["plant", dirs[temprand]])



func _mostrar():
	for dir in dirs:
		print(dir)
		reader._playsound("win")



func _stopSilence():
	enablekeys = false
	reader.reset()
	timer.stop()

func _on_Timer_timeout():
	_stopSilence()
	var s = "straws"
	if(reamount == 1):
		s = "straw"
	if(TempoData.retocollect == "apple"):
		PlayerData.apple.amount += reamount
	elif(TempoData.retocollect == "carrot"):
		PlayerData.carrot.amount += reamount
	var ref = funcref(self, "_gotoTrade")
	reader._playsounds(["win", "yougot", str(reamount), TempoData.retocollect, "atraderarrived"],ref)


func _gotoTrade():
	get_tree().change_scene("res://Trade.tscn")
