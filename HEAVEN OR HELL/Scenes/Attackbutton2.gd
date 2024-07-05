extends TextureButton
var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")



func _on_pressed():
	heavenstats.subtract_heart(50)
	heavenstats.subtract_magia(50)
	
