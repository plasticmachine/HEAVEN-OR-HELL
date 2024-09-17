extends Area2D
@onready var heavenstats = load("res://Resources/Stats/HeavenStats.tres")


func _on_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	var total_defense_BH = heavenstats.guts / 20
	
	if area == Spawning.get_shared_area("FlipCards"):
		heavenstats.subtract_heart((Spawning.bullet("FlipCards").damage)  /  (total_defense_BH))
	
	if area == Spawning.get_shared_area("Firework"):
		heavenstats.subtract_heart((Spawning.bullet("Firework").damage)  /  (total_defense_BH))
	
	if area == Spawning.get_shared_area("BowlingBall"):
		heavenstats.subtract_heart((Spawning.bullet("BowlingBall").damage)  /  (total_defense_BH))
	
	if area == Spawning.get_shared_area("SwanCards"):
		heavenstats.subtract_heart((Spawning.bullet("SwanCards").damage)  /  (total_defense_BH))
	
	if area == Spawning.get_shared_area("BowlingPin"):
		heavenstats.subtract_heart((Spawning.bullet("BowlingPins").damage) / (total_defense_BH))
