extends Node2D


### CHANGE THIS FOR EVERY SCENE TO FIT THE NEW TURNBASEDMANAGER:
@onready var TurnBasedManager = $".."
### THIS DOESNT CHANGE THO
@onready var SkillManager = $"../SkillManager"
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
var ID_3_Heaven_disable_turn
var ID_5_Heaven_disable_turn
var ID_6_Heaven_disable_turn


func _on_skill_manager_skill_effect_wear_off_set() -> void:
	ID_3_Heaven_disable_turn = TurnBasedManager.turn_count + SkillManager.ID_3_heaven_effect_length

func _on_skill_manager_heaven_id_5_wear_off_set() -> void:
	ID_5_Heaven_disable_turn = TurnBasedManager.turn_count + SkillManager.ID_5_heaven_effect_length

func check_if_effects_worn_off():
	match TurnBasedManager.turn_count:
		ID_3_Heaven_disable_turn:
			heavenstats.subtract_malice(SkillManager.ID_3_heaven_increase_1)
		ID_5_Heaven_disable_turn:
			hellstats.subtract_malice(SkillManager.ID_5_heaven_increase_1)
			hellstats.subtract_malice(SkillManager.ID_5_heaven_increase_1)

func holy_swords():
	var num = [4,5,6].pick_random()
	var holy_swords_disable_turn = (TurnBasedManager.turn_count + num)
	
	#if TurnBasedManager.turn_count > holy_swords_disable_turn
	
