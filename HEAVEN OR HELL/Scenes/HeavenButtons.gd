extends TextureButton
var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")



func _on_pressed():
	heavenstats.add_heart(50)
	heavenstats.add_magia(50)
	YASM.load_scene("res://Scenes/main.tscn")
