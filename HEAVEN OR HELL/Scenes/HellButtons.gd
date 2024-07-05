extends TextureButton
var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")



func _on_pressed():
	hellstats.add_heart(10)
	hellstats.add_magia(10)
	hellstats.add_malice(10)
	hellstats.add_deviltry(10)
	#hellstats.add_guts(10)
	hellstats.add_crit(25)
	hellstats.add_luck(10)
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	#YASM.load_scene("res://Scenes/main.tscn",  [get_tree().create_timer(5.0).timeout])
