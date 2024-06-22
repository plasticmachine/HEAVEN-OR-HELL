extends TextureButton
var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")



func _on_pressed():
	hellstats.add_heart(10)
	hellstats.add_magia(10)
	ResourceSaver.save(hellstats)
	#YASM.load_scene("res://Scenes/main.tscn",  [get_tree().create_timer(5.0).timeout])
