extends Node

var gold : int

var apple : ResPlayer
var carrot : ResPlayer 
var fish : ResPlayer
var herb : ResPlayer
var straw : ResPlayer


func _init():
	
	gold = 3
	apple = ResPlayer.new("apple")
	carrot = ResPlayer.new("carrot")
	fish = ResPlayer.new("fish")
	herb= ResPlayer.new("herb")
	straw= ResPlayer.new("straw")


func _ready():
	pass

func _show():
	apple._show()
	carrot._show()
	fish._show()
	herb._show()
	straw._show()

func allRes():
	return [straw, herb, fish, carrot, apple]


func _toRead():
	return []
