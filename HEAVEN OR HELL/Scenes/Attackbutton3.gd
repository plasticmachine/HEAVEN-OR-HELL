extends TextureButton
var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")

func _on_pressed():
	hellstats.reset_stats()
