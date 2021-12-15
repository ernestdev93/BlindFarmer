extends Node

class_name Trader

var apple : ResTrade
var carrot : ResTrade 
var fish : ResTrade
var herb : ResTrade
var straw : ResTrade


func _init():
	
	apple = ResTrade.new("apple",1,1)
	carrot = ResTrade.new("carrot",1,1)
	fish = ResTrade.new("fish",1,1)
	herb = ResTrade.new("herb",1,1)
	straw = ResTrade.new("straw",1,1)


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
	
