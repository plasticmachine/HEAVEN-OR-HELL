extends TextureButton
var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")



func _on_pressed():
	heavenstats.add_heart(50)
	heavenstats.add_magia(50)
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
