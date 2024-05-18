extends TextureButton
var heavenstats = preload("res://Resources/HeavenStats.tres")



func _on_pressed():
	heavenstats.add_heart(5)
