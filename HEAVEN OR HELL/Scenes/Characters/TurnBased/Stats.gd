extends Node
@onready var hellstats = "res://Resources/HellStats.tres"

func save_stats():
	ResourceSaver.save(hellstats)
	
func load_stats():
	ResourceLoader.load(hellstats)
