extends Node

class_name ResTrade

var nam : String =""
var sellprice : int = 0
var buyprice : int = 0
var amount : int = 0

func _init(name,sell, buy):
	nam=name
	sellprice=sell
	buyprice=buy
	amount = 0

func _show():
	print(nam+": Sell price is:"+str(sellprice)+"and the buy price is :" +str(buyprice))

func toRead():
	return ["sellprice", str(sellprice), "buyprice", str(buyprice)]

func toReadInv():
	return [nam, "yougot", str(amount)]
