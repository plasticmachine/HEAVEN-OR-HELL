extends Area2D
@onready var hellstats = load("res://Resources/Stats/HellStats.tres")
var total_defense_BH

func _on_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
# in the future, the calc_BH_defense() function should be called when you increase or decrease the stat, instead of here since its kinda chunky i think
	if area == Spawning.get_shared_area("FlipCards"):
		hellstats.calc_BH_defense()
		hellstats.subtract_heart((Spawning.bullet("FlipCards").damage) / hellstats.BH_defense )
	
	if area == Spawning.get_shared_area("Firework"):
		hellstats.calc_BH_defense()
		hellstats.subtract_heart((Spawning.bullet("Firework").damage)  / hellstats.BH_defense )
	
	if area == Spawning.get_shared_area("BowlingBall"):
		hellstats.calc_BH_defense()
		hellstats.subtract_heart((Spawning.bullet("BowlingBall").damage)  /  hellstats.BH_defense)
	
	if area == Spawning.get_shared_area("SwanCards"):
		hellstats.calc_BH_defense()
		hellstats.subtract_heart((Spawning.bullet("SwanCards").damage)  /  hellstats.BH_defense)
	
	if area == Spawning.get_shared_area("BowlingPin"):
		hellstats.calc_BH_defense()
		hellstats.subtract_heart((Spawning.bullet("BowlingPins").damage) / hellstats.BH_defense)
	
	if area == Spawning.get_shared_area("Balloon"):
		hellstats.calc_BH_defense()
		hellstats.subtract_heart((Spawning.bullet("Balloons").damage) / hellstats.BH_defense)
