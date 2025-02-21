extends Node2D


### CHANGE THIS FOR EVERY SCENE TO FIT THE NEW TURNBASEDMANAGER:
@onready var TurnBasedManager = $".."
### THIS DOESNT CHANGE THO
@onready var SkillManager = $"../SkillManager"
@onready var damage_calc = $"../DamageCalculation"
@onready var effect_animation = $"../BattleEffectManagerPosition/BattleEffectManager"
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")
### SKILL DISABLE TURNS
var ID_3_Heaven_disable_turn
var ID_5_Heaven_disable_turn
var ID_6_Heaven_disable_turn
var ID_8_Heaven_disable_turn

var ID_3_Hell_disable_turn

### STATUS EFFECT DISABLE TURNS
var holy_swords_disable_turn

func _on_skill_manager_skill_effect_wear_off_set() -> void:
	ID_3_Heaven_disable_turn = TurnBasedManager.turn_count + SkillManager.ID_3_heaven_effect_length

func _on_skill_manager_heaven_id_5_wear_off_set() -> void:
	ID_5_Heaven_disable_turn = TurnBasedManager.turn_count + SkillManager.ID_5_heaven_effect_length

func _on_skill_manager_hell_id_3_wear_off_set() -> void:
	ID_3_Hell_disable_turn = TurnBasedManager.turn_count + SkillManager.ID_3_hell_effect_length

#SPECIAL_STATUS_ID_1
func holy_swords_set():
	var num = SkillManager.ID_6_heaven_effect_length + [1,2,3].pick_random()
	holy_swords_disable_turn = (TurnBasedManager.turn_count + num)
	
	match SkillManager.heaven_target_ID:
		3:
			if clownstats.special_status_effect_1 > 0:
				clownstats.special_status_effect_2 = 1
			if clownstats.special_status_effect_2 > 0:
				clownstats.special_status_effect_3 = 1
			if (clownstats.special_status_effect_1 > 0) and (clownstats.special_status_effect_2 > 0) and (clownstats.special_status_effect_3 > 0):
				print_debug(clownstats.character_name + " CAN ONLY HAVE 3 STATUS EFFECTS")
			else:
				clownstats.special_status_effect_1 = 1
	#if TurnBasedManager.turn_count > holy_swords_disable_turn


#SPECIAL_STATUS_ID_2 (SIGIL)
func sigil_set_and_toss():
	var num = [4,5,6].pick_random()
	var sigil_disable_turn = (TurnBasedManager.turn_count + num)
	
	match heavenstats.special_status_effect_1 || heavenstats.special_status_effect_2 || heavenstats.special_status_effect_3:
		2:
			match SkillManager.heaven_target_ID:
				1:
					pass
					#self target
				
				2:
					pass
					#run the script that checks the special status slots



#Checks if status effects are active and then actually enacts what the status is supposed to do 
func check_if_effects_active_end_turn():
	
	### match charastats.special_status_effect_1:
	### 	0:
	###			pass
	### 	1:
	###			new actor1_skill_power? old actor1_skill_power? consistent skill power? 
	###			damagecalc.actor1_to_actor2() 



	match clownstats.special_status_effect_1:
		0:
			pass
		1: #HOLY SWORDS DEBUFF
			var holy_swords_turn_count = holy_swords_disable_turn
			
			damage_calc.heaven_to_clown_deviltry_damagecalc()
			print_debug(str(holy_swords_turn_count) + " turns left on holy swords")
			#holy_swords_turn_count = holy_swords_turn_count - 1
			
	match clownstats.special_status_effect_2:
		0:
			pass
		1: #HOLY SWORDS DEBUFF
			var holy_swords_turn_count = holy_swords_disable_turn
			
			damage_calc.heaven_to_clown_deviltry_damagecalc()
			print_debug(str(holy_swords_turn_count) + " turns left on holy swords")
			#holy_swords_turn_count = holy_swords_turn_count - 1
	match clownstats.special_status_effect_3:
		0:
			pass
		1: #HOLY SWORDS DEBUFF
			var holy_swords_turn_count = holy_swords_disable_turn
			
			damage_calc.heaven_to_clown_deviltry_damagecalc()
			print_debug(str(holy_swords_turn_count) + " turns left on holy swords")
			#holy_swords_turn_count = holy_swords_turn_count - 1


func check_if_effects_worn_off():
	match TurnBasedManager.turn_count:
		ID_3_Heaven_disable_turn:
			#subtracts the malice that the effect gave after a set of turns
			effect_animation.find_effect_spot_heaven()
			effect_animation.play("basic_debuff")
			heavenstats.subtract_malice(SkillManager.ID_3_heaven_increase_1)
		ID_5_Heaven_disable_turn:
			#subtracts all stats that the effect gave after a set of turns
			effect_animation.find_effect_spot_hell()
			effect_animation.play("basic_debuff")
			hellstats.subtract_malice(SkillManager.ID_5_heaven_increase_1)
			hellstats.subtract_malice(SkillManager.ID_5_heaven_increase_1)
		holy_swords_disable_turn:
			if clownstats.special_status_effect_1 == 1:
				clownstats.special_status_effect_1 = 0
			if clownstats.special_status_effect_2 == 1:
				clownstats.special_status_effect_2 = 0
			else:
				clownstats.special_status_effect_3 = 0
		ID_3_Hell_disable_turn:
			effect_animation.find_effect_spot_hell()
			effect_animation.play("basic_debuff")
			hellstats.subtract_deviltry(SkillManager.ID_3_hell_increase_1)
