extends Node

@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")
@onready var variance = [.8, .9, 1.0, 1.1, 1.2]


func heaven_clown_malice_damagecalc():
	var total_damage: int
	var outgoing_damage = heavenstats.current_skill_power * heavenstats.malice
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
