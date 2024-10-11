extends Node2D


### CHANGE THIS FOR EVERY SCENE TO FIT THE NEW TURNBASEDMANAGER:
@onready var TurnBasedManager = $".."
### THIS DOESNT CHANGE THO
@onready var SkillManager = $"../SkillManager"
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
var ID_3_Heaven_disable_turn



func _on_skill_manager_skill_effect_wear_off_set():
	ID_3_Heaven_disable_turn = TurnBasedManager.turn_count + SkillManager.ID_3_heaven_effect_length
	
	
func check_if_effects_worn_off():
	match TurnBasedManager.turn_count:
		ID_3_Heaven_disable_turn:
			heavenstats.subtract_malice(SkillManager.ID_3_heaven_increase_1)
