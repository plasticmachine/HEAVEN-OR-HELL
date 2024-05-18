extends TextureButton
var hellstats = ResourceLoader.load("res://Resources/HellStats.tres")



func _on_pressed():
	hellstats.add_heart(10)
	ResourceSaver.save(hellstats)
