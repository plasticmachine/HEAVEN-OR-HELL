extends Area2D
@onready var hellstats = load("res://Resources/Stats/HellStats.tres")
var total_defense_BH

func _on_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	var total_defense_BH = hellstats.guts / 20
	
	if area == Spawning.get_shared_area("FlipCards"):
		hellstats.subtract_heart((Spawning.bullet("FlipCards").damage) / (total_defense_BH))
	
	if area == Spawning.get_shared_area("Firework"):
		hellstats.subtract_heart((Spawning.bullet("Firework").damage) / (total_defense_BH))
	
	if area == Spawning.get_shared_area("BowlingBall"):
		hellstats.subtract_heart((Spawning.bullet("BowlingBall").damage) / (total_defense_BH))
	
	if area == Spawning.get_shared_area("SwanCards"):
		hellstats.subtract_heart((Spawning.bullet("SwanCards").damage) / (total_defense_BH))
	
	if area == Spawning.get_shared_area("BowlingPin"):
		hellstats.subtract_heart((Spawning.bullet("BowlingPins").damage) / (total_defense_BH))
