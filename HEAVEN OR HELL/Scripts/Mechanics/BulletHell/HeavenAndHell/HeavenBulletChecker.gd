extends Area2D
@onready var heavenstats = load("res://Resources/Stats/HeavenStats.tres")


func _on_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	if area == Spawning.get_shared_area("FlipCards"):
		heavenstats.subtract_heart(Spawning.bullet("FlipCards").damage)
	
	if area == Spawning.get_shared_area("Firework"):
		heavenstats.subtract_heart(Spawning.bullet("Firework").damage)
	
	if area == Spawning.get_shared_area("BowlingBall"):
		heavenstats.subtract_heart(Spawning.bullet("Bowling").damage)
	
	if area == Spawning.get_shared_area("SwanCards"):
		heavenstats.subtract_heart(Spawning.bullet("SwanCards").damage)
