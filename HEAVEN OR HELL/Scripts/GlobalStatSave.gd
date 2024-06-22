extends Node

var Hellstats = "res://Resources/Stats/HellStats.tres"
var Heavenstats = "res://Resources/Stats/HeavenStats.tres"
@export var HellStatsResource: Resource
@export var HeavenStatsResource: Resource


func save_hellstats_to_file(Hellstats):
	var hllstats = HellStatsResource
	var error = ResourceSaver.save(hllstats, Hellstats)
	if error!= OK:
		print("Wasn't able to save HellStats", error)
		

func save_heavenstats_to_file(Heavenstats):
	var hvnstats = HeavenStatsResource
	var error = ResourceSaver.save(hvnstats, Heavenstats)
	if error!= OK:
		print("Wasn't able to save HellStats", error)
	
