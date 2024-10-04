extends Node

var Hellstats = "res://Resources/Stats/HellStats.tres"
var Heavenstats = "res://Resources/Stats/HeavenStats.tres"
var Clownstats = "res://Resources/Stats/ClownStats.tres"
@export var HellStatsResource: Resource
@export var HeavenStatsResource: Resource
@export var ClownStatsResource: Resource


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
	

func save_clownstats_to_file(Clownstats):
	var clnstats = ClownStatsResource
	var error = ResourceSaver.save(clnstats, Clownstats)
	if error!= OK:
		print("Wasn't able to print Clownstats", error)
