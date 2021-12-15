extends Node


var audios = []
var menuindex = 0
var reader
var mCallfunc
#requiere ser marcada como true  para que el menu pueda ser de recursos por ejemplo
var menuItems : bool = false
var items = []

func _stopMenu():
	enablekeys=false
	$Reader.reset()

func _startMenu():
	enablekeys = true
	
	
	if(menuItems):
		menuindex = items.size()-1
	elif(menuItems == false):
		menuindex = audios.size()-1
	
	if(menuItems == false):
		reader._playsound(audios[audios.size()-1])
	elif(menuItems):
		reader._playsounds(items[items.size()-1].toRead())
		print(items[items.size()-1].toRead())
	
	
func _ready():
	reader = $Reader


var enablekeys : bool = false

func _input(event):
	if(enablekeys):
		if event.is_action_pressed("ui_down"):
			if(menuindex > 0):
				menuindex -= 1
				
				if(menuItems == false):
					reader._playsound(audios[menuindex])
				elif(menuItems):
					reader._playsounds(items[menuindex].toRead())
				
				
		if event.is_action_pressed("ui_up"):
			
			
			if(menuItems == false):
				if(menuindex < audios.size()-1):
					menuindex += 1
					reader._playsound(audios[menuindex])
			elif(menuItems):
				if(menuindex < items.size()-1):
					menuindex += 1
					reader._playsounds(items[menuindex].toRead())
			
		if event.is_action_pressed("ui_accept"):
			if(menuItems == false):
				mCallfunc.call_func(audios[menuindex])
			elif(menuItems):
				mCallfunc.call_func(items[menuindex].nam)

