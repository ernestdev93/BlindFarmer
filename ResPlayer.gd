extends Node

class_name ResPlayer

var nam : String =""
var amount : int = 0

func _init(name):
	nam=name
	amount = 0
	

func _show():
	print(nam+" the amount is :" +str(amount))

func toRead():
	return ["yougot", str(amount)]

func toReadInv():
	return [nam, "yougot", str(amount)]
