extends Node

var character_stats = {}
@export var charactername: String
@export var heart: int
@export var spark: int
@export var malice: int
@export var deviltry: int
@export var crit: int
@export var guts: int

func set_heart(value):
	heart = value
	update_character_stats()

func set_spark(value):
	spark = value
	update_character_stats()

func set_malice(value):
	malice = value
	update_character_stats()

func set_deviltry(value):
	deviltry = value
	update_character_stats()

func update_character_stats():
	for node in character_stats.keys():
		character_stats[node] = {
			"heart": heart,
			"spark": spark,
			"malice": malice,
			"deviltry": deviltry,
			"crit": crit,
			"guts": guts
		}

func get_character_stats(node):
	if node in character_stats:
		return character_stats[node]
	else: 
		var stats = {
			"heart": heart,
			"spark": spark,
			"malice": malice,
			"deviltry": deviltry,
			"crit": crit,
			"guts": guts
		}
		character_stats[node] = stats
		return stats


func modify_character_stats(node, stat, value):
	if node in character_stats:
		character_stats[node][stat] += value
	else:
		print("node not found in character stats")
