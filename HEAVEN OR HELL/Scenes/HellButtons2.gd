extends TextureButton
var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")



func _on_pressed():
	hellstats.subtract_heart(10)
	hellstats.subtract_magia(10)
	
