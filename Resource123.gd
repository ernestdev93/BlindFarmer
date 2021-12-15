extends Node

var nam : String =""
var sellprice : int = 0
var buyprice : int = 0

func _init(sell, buy):
	sellprice=sell
	buyprice=buy

func _show():
	print(nam+": Sell price is:"+str(sellprice)+"and the buy price is :" +str(buyprice))
