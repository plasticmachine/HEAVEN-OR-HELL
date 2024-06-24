extends TextureButton
var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")



func _on_pressed():
	hellstats.subtract_heart(10)
	hellstats.subtract_magia(10)
	hellstats.subtract_malice(10)
	hellstats.subtract_deviltry(10)
	hellstats.subtract_guts(10)
	hellstats.subtract_luck(10)
	hellstats.subtract_crit(100)
	
