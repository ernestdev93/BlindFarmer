extends Node


var menuindex = 0
var reader
var mCallfunc
#requiere ser marcada como true  para que el menu pueda ser de recursos por ejemplo
var items = []



func _changeArray(isinv):
	if(isinv):
		items = PlayerData.allRes()
	else:
		items = NorthTrader.allRes()

func _stopMenu():
	enablekeys=false
	$Reader.reset()

func _startMenu():
	enablekeys = true
	
	_changeArray(false)
	
	menuindex = items.size()-1
	_readOnV()
	print(items[items.size()-1].toRead())


func _ready():
	reader = $Reader
	NorthTrader._refreshPrices()

func _read():
	pass



var enablekeys : bool = false

func _input(event):
	if(enablekeys):
		if event.is_action_pressed("ui_down"):
			if(menuindex > 0):
				menuindex -= 1
				_readOnV()
				
				
		if event.is_action_pressed("ui_up"):
			if(menuindex < items.size()-1):
				menuindex += 1
				_readOnV()
			
#		if event.is_action_pressed("ui_accept"):
#			mCallfunc.call_func(items[menuindex].nam)
		if event.is_action_pressed("ui_right"):
			_changeArray(true)
			reader._playsounds(items[menuindex].toRead())
		if event.is_action_pressed("ui_left"):
			_changeArray(false)
			reader._playsounds(items[menuindex].toRead())
		if event.is_action_pressed("ui_buy"):
			_buy()
		if event.is_action_pressed("ui_sell"):
			_sell()
		if event.is_action("ui_accept"):
			get_tree().change_scene("res://CollectMenu.tscn")
			PlayerData._show()

func _readInv(funct = null):
	pass




func _buy():
	_changeArray(false)
	if(items[menuindex].buyprice <= PlayerData.gold):
		if(items[menuindex].nam == "apple"):
			PlayerData.apple.amount += 1
			PlayerData.gold -= items[menuindex].buyprice
		if(items[menuindex].nam == "carrot"):
			PlayerData.carrot.amount += 1
			PlayerData.gold -= items[menuindex].buyprice
		if(items[menuindex].nam == "herb"):
			PlayerData.herb.amount += 1
			PlayerData.gold -= items[menuindex].buyprice
		if(items[menuindex].nam == "fish"):
			PlayerData.fish.amount += 1
			PlayerData.gold -= items[menuindex].buyprice
		if(items[menuindex].nam == "straw"):
			PlayerData.straw.amount += 1
			PlayerData.gold -= items[menuindex].buyprice
			
	items = PlayerData.allRes()
	_readAfterT()

func _sell():
	_changeArray(false)
	if(items[menuindex].nam == "apple"):
		if(PlayerData.apple.amount > 0):
			PlayerData.apple.amount -= 1
			PlayerData.gold += items[menuindex].sellprice
	if(items[menuindex].nam == "carrot"):
		if(PlayerData.carrot.amount > 0):
			PlayerData.carrot.amount -= 1
			PlayerData.gold += items[menuindex].sellprice
	if(items[menuindex].nam == "herb"):
		if(PlayerData.herb.amount > 0):
			PlayerData.herb.amount -= 1
			PlayerData.gold += items[menuindex].sellprice
	if(items[menuindex].nam == "fish"):
		if(PlayerData.fish.amount > 0):
			PlayerData.fish.amount -= 1
			PlayerData.gold += items[menuindex].sellprice
	if(items[menuindex].nam == "straw"):
		if(PlayerData.straw.amount > 0):
			PlayerData.straw.amount -= 1
			PlayerData.gold += items[menuindex].sellprice
			
	
	_readAfterT()

#reading funcitions

func _readOnV():
	#_changeArray(true)
	var item = items[menuindex]
	var ref = funcref(self, "_readItem")
	reader._playsound(item.nam,ref)


func _readItem():
	var item = items[menuindex]
	reader._playsounds(items[menuindex].toRead())

func _playWait(audio, funct):
	var ref = funcref(self, funct)
	reader._playsound(audio, ref)

func _playWaits(audio, funct):
	var ref = funcref(self, funct)
	$Reader._playsounds(audio, ref)

func _readAfterT():
	var ref = funcref(self, "_readGold")
	_changeArray(true)
	var item = items[menuindex]
	reader._playsounds(["youhave", str(item.amount), item.nam],ref)

func _readGold():
	$Reader._playsounds(["yourgoldis",str(PlayerData.gold)])
