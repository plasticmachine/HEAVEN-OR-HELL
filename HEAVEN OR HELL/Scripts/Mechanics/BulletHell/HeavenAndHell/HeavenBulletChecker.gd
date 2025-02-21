extends Area2D
@onready var heavenstats = load("res://Resources/Stats/HeavenStats.tres")



func _on_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	# in the future, the calc_BH_defense() function should be called when you increase or decrease the stat, instead of here since its kinda chunky i think
	if area == Spawning.get_shared_area("FlipCards"):
		heavenstats.calc_BH_defense()
		heavenstats.subtract_heart((Spawning.bullet("FlipCards").damage) / heavenstats.BH_defense )
	
	if area == Spawning.get_shared_area("Firework"):
		heavenstats.calc_BH_defense()
		heavenstats.subtract_heart((Spawning.bullet("Firework").damage)  / heavenstats.BH_defense )
	
	if area == Spawning.get_shared_area("BowlingBall"):
		heavenstats.calc_BH_defense()
		heavenstats.subtract_heart((Spawning.bullet("BowlingBall").damage)  /  heavenstats.BH_defense)
	
	if area == Spawning.get_shared_area("SwanCards"):
		heavenstats.calc_BH_defense()
		heavenstats.subtract_heart((Spawning.bullet("SwanCards").damage)  /  heavenstats.BH_defense)
	
	if area == Spawning.get_shared_area("BowlingPin"):
		heavenstats.calc_BH_defense()
		heavenstats.subtract_heart((Spawning.bullet("BowlingPins").damage) / heavenstats.BH_defense)
	#
	#if area == Spawning.get_shared_area("Balloon"):
		#heavenstats.calc_BH_defense()
		#heavenstats.subtract_heart((Spawning.bullet("Balloons").damage) / heavenstats.BH_defense)
