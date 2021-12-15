extends Trader

var rng = RandomNumberGenerator.new()

var allRes = []



func _refreshPrices():
	rng.randomize()
	
	
	straw.buyprice= 2
	straw.sellprice = 1
	
	apple.buyprice = rng.randi_range(2,3)
	apple.sellprice = rng.randi_range(1,1)

	
	carrot.buyprice = rng.randi_range(2,3)
	carrot.sellprice = rng.randi_range(1,1)
	
	fish.buyprice = rng.randi_range(2,2)
	fish.sellprice = rng.randi_range(1,1)
	
	herb.buyprice = rng.randi_range(2,2)
	herb.sellprice = rng.randi_range(1,1)


