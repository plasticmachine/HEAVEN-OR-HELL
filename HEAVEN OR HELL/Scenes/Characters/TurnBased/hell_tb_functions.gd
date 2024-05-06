extends Node2D
@onready var stats = $Stats

func TestingStats():
	print_debug(stats.character_stats.max_heart)
