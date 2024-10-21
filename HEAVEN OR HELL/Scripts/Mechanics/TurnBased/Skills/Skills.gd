extends Node2D
signal skill_effect_wear_off_set
signal heaven_ID_5_wear_off_set

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")
@onready var effect_animation = $"../BattleEffectManagerPosition/BattleEffectManager"

@onready var damage_calc = $"../DamageCalculation"
@onready var status_effects = $"../StatusEffects"

@export var heaven_target_ID: int
@export var hell_target_ID: int

#export these for now for testing purposes, but in the future make these private so only the inventory system can change these values
@export_group("Heaven Skill Slots: TESTING")
@export var skill_slot_1_skill_heaven: int
@export var skill_slot_2_skill_heaven: int
@export var skill_slot_3_skill_heaven: int
@export var skill_slot_4_skill_heaven: int
@export_group("Hell Skill Slots: TESTING")
@export var skill_slot_1_skill_hell: int
@export var skill_slot_2_skill_hell: int
@export var skill_slot_3_skill_hell: int
@export var skill_slot_4_skill_hell: int

@export_group("Heaven Skill: Test 1")
@export_subgroup("Variables: Test 1")
@export var ID_1_heaven_skill_name: String
@export var ID_1_heaven_skill_image: Image
@export var ID_1_heaven_tempo: int 
@export var ID_1_heaven_power: int  
@export var ID_1_heaven_cost_1: int 
@export var ID_1_heaven_cost_2: int 
@export var ID_1_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 1")
@export var ID_1_heaven_increase_1: int 
@export var ID_1_heaven_increase_2: int 
@export var ID_1_heaven_increase_3: int 
@export var ID_1_heaven_decrease_1: int 
@export var ID_1_heaven_decrease_2: int 
@export var ID_1_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 1")
@export var ID_1_heaven_percent_increase_1: float 
@export var ID_1_heaven_percent_increase_2: float 
@export var ID_1_heaven_percent_increase_3: float 
@export var ID_1_heaven_percent_decrease_1: float 
@export var ID_1_heaven_percent_decrease_2: float 
@export var ID_1_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 2")
@export_subgroup("Variables: Test 2")
@export var ID_2_heaven_skill_name: String
@export var ID_2_heaven_skill_image: Image
@export var ID_2_heaven_tempo: int 
@export var ID_2_heaven_power: int 
@export var ID_2_heaven_cost_1: int 
@export var ID_2_heaven_cost_2: int 
@export var ID_2_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 2")
@export var ID_2_heaven_increase_1: int 
@export var ID_2_heaven_increase_2: int 
@export var ID_2_heaven_increase_3: int 
@export var ID_2_heaven_decrease_1: int 
@export var ID_2_heaven_decrease_2: int 
@export var ID_2_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 2")
@export var ID_2_heaven_percent_increase_1: float 
@export var ID_2_heaven_percent_increase_2: float 
@export var ID_2_heaven_percent_increase_3: float 
@export var ID_2_heaven_percent_decrease_1: float 
@export var ID_2_heaven_percent_decrease_2: float 
@export var ID_2_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 3")
@export_subgroup("Variables: Test 3")
@export var ID_3_heaven_skill_name: String
@export var ID_3_heaven_skill_image: Image
@export var ID_3_heaven_tempo: int 
@export var ID_3_heaven_power: int 
@export var ID_3_heaven_cost_1: int 
@export var ID_3_heaven_cost_2: int 
@export var ID_3_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 3")
@export var ID_3_heaven_increase_1: int 
@export var ID_3_heaven_increase_2: int 
@export var ID_3_heaven_increase_3: int 
@export var ID_3_heaven_decrease_1: int 
@export var ID_3_heaven_decrease_2: int 
@export var ID_3_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_3_heaven_percent_increase_1: float 
@export var ID_3_heaven_percent_increase_2: float 
@export var ID_3_heaven_percent_increase_3: float 
@export var ID_3_heaven_percent_decrease_1: float 
@export var ID_3_heaven_percent_decrease_2: float 
@export var ID_3_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 4")
@export_subgroup("Variables: Test 4")
@export var ID_4_heaven_skill_name: String
@export var ID_4_heaven_skill_image: Image
@export var ID_4_heaven_tempo: int 
@export var ID_4_heaven_power: int 
@export var ID_4_heaven_cost_1: int 
@export var ID_4_heaven_cost_2: int 
@export var ID_4_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 4")
@export var ID_4_heaven_increase_1: int 
@export var ID_4_heaven_increase_2: int 
@export var ID_4_heaven_increase_3: int 
@export var ID_4_heaven_decrease_1: int 
@export var ID_4_heaven_decrease_2: int 
@export var ID_4_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_4_heaven_percent_increase_1: float 
@export var ID_4_heaven_percent_increase_2: float 
@export var ID_4_heaven_percent_increase_3: float 
@export var ID_4_heaven_percent_decrease_1: float 
@export var ID_4_heaven_percent_decrease_2: float 
@export var ID_4_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 5")
@export_subgroup("Variables: Test 5")
@export var ID_5_heaven_skill_name: String
@export var ID_5_heaven_skill_image: Image
@export var ID_5_heaven_tempo: int 
@export var ID_5_heaven_power: int 
@export var ID_5_heaven_cost_1: int 
@export var ID_5_heaven_cost_2: int 
@export var ID_5_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 5")
@export var ID_5_heaven_increase_1: int 
@export var ID_5_heaven_increase_2: int 
@export var ID_5_heaven_increase_3: int 
@export var ID_5_heaven_decrease_1: int 
@export var ID_5_heaven_decrease_2: int 
@export var ID_5_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_5_heaven_percent_increase_1: float 
@export var ID_5_heaven_percent_increase_2: float 
@export var ID_5_heaven_percent_increase_3: float 
@export var ID_5_heaven_percent_decrease_1: float 
@export var ID_5_heaven_percent_decrease_2: float 
@export var ID_5_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 6")
@export_subgroup("Variables: Test 6")
@export var ID_6_heaven_skill_name: String
@export var ID_6_heaven_skill_image: Image
@export var ID_6_heaven_tempo: int 
@export var ID_6_heaven_power: int 
@export var ID_6_heaven_cost_1: int 
@export var ID_6_heaven_cost_2: int 
@export var ID_6_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 6")
@export var ID_6_heaven_increase_1: int 
@export var ID_6_heaven_increase_2: int 
@export var ID_6_heaven_increase_3: int 
@export var ID_6_heaven_decrease_1: int 
@export var ID_6_heaven_decrease_2: int 
@export var ID_6_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_6_heaven_percent_increase_1: float 
@export var ID_6_heaven_percent_increase_2: float 
@export var ID_6_heaven_percent_increase_3: float 
@export var ID_6_heaven_percent_decrease_1: float
@export var ID_6_heaven_percent_decrease_2: float 
@export var ID_6_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 7")
@export_subgroup("Variables: Test 7")
@export var ID_7_heaven_skill_name: String
@export var ID_7_heaven_skill_image: Image
@export var ID_7_heaven_tempo: int 
@export var ID_7_heaven_power: int 
@export var ID_7_heaven_cost_1: int 
@export var ID_7_heaven_cost_2: int 
@export var ID_7_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 7")
@export var ID_7_heaven_increase_1: int 
@export var ID_7_heaven_increase_2: int 
@export var ID_7_heaven_increase_3: int 
@export var ID_7_heaven_decrease_1: int 
@export var ID_7_heaven_decrease_2: int 
@export var ID_7_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_7_heaven_percent_increase_1: float 
@export var ID_7_heaven_percent_increase_2: float 
@export var ID_7_heaven_percent_increase_3: float 
@export var ID_7_heaven_percent_decrease_1: float 
@export var ID_7_heaven_percent_decrease_2: float 
@export var ID_7_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 8")
@export_subgroup("Variables: Test 8")
@export var ID_8_heaven_skill_name: String
@export var ID_8_heaven_skill_image: Image
@export var ID_8_heaven_tempo: int 
@export var ID_8_heaven_power: int 
@export var ID_8_heaven_cost_1: int 
@export var ID_8_heaven_cost_2: int 
@export var ID_8_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 8")
@export var ID_8_heaven_increase_1: int 
@export var ID_8_heaven_increase_2: int 
@export var ID_8_heaven_increase_3: int 
@export var ID_8_heaven_decrease_1: int 
@export var ID_8_heaven_decrease_2: int 
@export var ID_8_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_8_heaven_percent_increase_1: float 
@export var ID_8_heaven_percent_increase_2: float 
@export var ID_8_heaven_percent_increase_3: float 
@export var ID_8_heaven_percent_decrease_1: float 
@export var ID_8_heaven_percent_decrease_2: float 
@export var ID_8_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 9")
@export_subgroup("Variables: Test 9")
@export var ID_9_heaven_skill_name: String
@export var ID_9_heaven_skill_image: Image
@export var ID_9_heaven_tempo: int 
@export var ID_9_heaven_power: int 
@export var ID_9_heaven_cost_1: int 
@export var ID_9_heaven_cost_2: int 
@export var ID_9_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 9")
@export var ID_9_heaven_increase_1: int 
@export var ID_9_heaven_increase_2: int 
@export var ID_9_heaven_increase_3: int 
@export var ID_9_heaven_decrease_1: int 
@export var ID_9_heaven_decrease_2: int 
@export var ID_9_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_9_heaven_percent_increase_1: float 
@export var ID_9_heaven_percent_increase_2: float 
@export var ID_9_heaven_percent_increase_3: float 
@export var ID_9_heaven_percent_decrease_1: float 
@export var ID_9_heaven_percent_decrease_2: float 
@export var ID_9_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 10")
@export_subgroup("Variables: Test 10")
@export var ID_10_heaven_skill_name: String
@export var ID_10_heaven_skill_image: Image
@export var ID_10_heaven_tempo: int 
@export var ID_10_heaven_power_1: int 
@export var ID_10_heaven_power_2: int
@export var ID_10_heaven_power_3: int
@export var ID_10_heaven_cost_1: int 
@export var ID_10_heaven_cost_2: int 
@export var ID_10_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 10")
@export var ID_10_heaven_increase_1: int 
@export var ID_10_heaven_increase_2: int 
@export var ID_10_heaven_increase_3: int 
@export var ID_10_heaven_decrease_1: int 
@export var ID_10_heaven_decrease_2: int 
@export var ID_10_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_10_heaven_percent_increase_1: float 
@export var ID_10_heaven_percent_increase_2: float 
@export var ID_10_heaven_percent_increase_3: float 
@export var ID_10_heaven_percent_decrease_1: float 
@export var ID_10_heaven_percent_decrease_2: float 
@export var ID_10_heaven_percent_decrease_3: float 

@export_group("Heaven Skill: Test 11")
@export_subgroup("Variables: Test 11")
@export var ID_11_heaven_skill_name: String
@export var ID_11_heaven_skill_image: Image
@export var ID_11_heaven_tempo: int 
@export var ID_11_heaven_power_1: int
@export var ID_11_heaven_power_2: int 
@export var ID_11_heaven_power_3: int 
@export var ID_11_heaven_cost_1: int 
@export var ID_11_heaven_cost_2: int 
@export var ID_11_heaven_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 11")
@export var ID_11_heaven_increase_1: int 
@export var ID_11_heaven_increase_2: int 
@export var ID_11_heaven_increase_3: int 
@export var ID_11_heaven_decrease_1: int 
@export var ID_11_heaven_decrease_2: int 
@export var ID_11_heaven_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_11_heaven_percent_increase_1: float 
@export var ID_11_heaven_percent_increase_2: float 
@export var ID_11_heaven_percent_increase_3: float 
@export var ID_11_heaven_percent_decrease_1: float 
@export var ID_11_heaven_percent_decrease_2: float 
@export var ID_11_heaven_percent_decrease_3: float 

@export_group("Hell Skill: Test 1")
@export_subgroup("Variables: Test 1")
@export var ID_1_hell_skill_name: String
@export var ID_1_hell_skill_image: Image
@export var ID_1_hell_tempo: int 
@export var ID_1_hell_power: int  
@export var ID_1_hell_cost_1: int 
@export var ID_1_hell_cost_2: int 
@export var ID_1_hell_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 1")
@export var ID_1_hell_increase_1: int 
@export var ID_1_hell_increase_2: int 
@export var ID_1_hell_increase_3: int 
@export var ID_1_hell_decrease_1: int 
@export var ID_1_hell_decrease_2: int 
@export var ID_1_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 1")
@export var ID_1_hell_percent_increase_1: float 
@export var ID_1_hell_percent_increase_2: float 
@export var ID_1_hell_percent_increase_3: float 
@export var ID_1_hell_percent_decrease_1: float 
@export var ID_1_hell_percent_decrease_2: float 
@export var ID_1_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 2")
@export_subgroup("Variables: Test 2")
@export var ID_2_hell_skill_name: String
@export var ID_2_hell_skill_image: Image
@export var ID_2_hell_tempo: int 
@export var ID_2_hell_power: int 
@export var ID_2_hell_cost_1: int 
@export var ID_2_hell_cost_2: int 
@export var ID_2_hell_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 2")
@export var ID_2_hell_increase_1: int 
@export var ID_2_hell_increase_2: int 
@export var ID_2_hell_increase_3: int 
@export var ID_2_hell_decrease_1: int 
@export var ID_2_hell_decrease_2: int 
@export var ID_2_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 2")
@export var ID_2_hell_percent_increase_1: float 
@export var ID_2_hell_percent_increase_2: float 
@export var ID_2_hell_percent_increase_3: float 
@export var ID_2_hell_percent_decrease_1: float 
@export var ID_2_hell_percent_decrease_2: float 
@export var ID_2_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 3")
@export_subgroup("Variables: Test 3")
@export var ID_3_hell_skill_name: String
@export var ID_3_hell_skill_image: Image
@export var ID_3_hell_tempo: int 
@export var ID_3_hell_power: int 
@export var ID_3_hell_cost_1: int 
@export var ID_3_hell_cost_2: int 
@export var ID_3_hell_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 3")
@export var ID_3_hell_increase_1: int 
@export var ID_3_hell_increase_2: int 
@export var ID_3_hell_increase_3: int 
@export var ID_3_hell_decrease_1: int 
@export var ID_3_hell_decrease_2: int 
@export var ID_3_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_3_hell_percent_increase_1: float 
@export var ID_3_hell_percent_increase_2: float 
@export var ID_3_hell_percent_increase_3: float 
@export var ID_3_hell_percent_decrease_1: float 
@export var ID_3_hell_percent_decrease_2: float 
@export var ID_3_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 4")
@export_subgroup("Variables: Test 4")
@export var ID_4_hell_skill_name: String
@export var ID_4_hell_skill_image: Image
@export var ID_4_hell_tempo: int 
@export var ID_4_hell_power: int 
@export var ID_4_hell_cost_1: int 
@export var ID_4_hell_cost_2: int 
@export var ID_4_hell_effect_length: int 
@export_subgroup("Flat Increases + Decreases: Test 4")
@export var ID_4_hell_increase_1: int 
@export var ID_4_hell_increase_2: int 
@export var ID_4_hell_increase_3: int 
@export var ID_4_hell_decrease_1: int 
@export var ID_4_hell_decrease_2: int 
@export var ID_4_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var ID_4_hell_percent_increase_1: float 
@export var ID_4_hell_percent_increase_2: float 
@export var ID_4_hell_percent_increase_3: float 
@export var ID_4_hell_percent_decrease_1: float 
@export var ID_4_hell_percent_decrease_2: float 
@export var ID_4_hell_percent_decrease_3: float 

### TARGET_ID = 1: HEAVEN 2: HELL 3: CLOWN

### SKILL SLOTS
###       SKILL SLOTS HEAVEN
func define_skill_slot_1_heaven():
	match skill_slot_1_skill_heaven:
		1:
			skill_ID_1_heaven()
		2:
			skill_ID_2_heaven()
		3:
			
			skill_ID_3_heaven()
		4:
			
			skill_ID_4_heaven()
		5:
			
			skill_ID_5_heaven()
		6:
			
			skill_ID_6_heaven()
		7:
			
			skill_ID_7_heaven()
		8:
			
			skill_ID_8_heaven()
		9:
			
			skill_ID_9_heaven()
		10:
			skill_ID_10_heaven()
		11:
			skill_ID_11_heaven()
func define_skill_slot_2_heaven():
	match skill_slot_2_skill_heaven:
		1:
			skill_ID_1_heaven()
		2:
			skill_ID_2_heaven()
		3:
			
			skill_ID_3_heaven()
		4:
			
			skill_ID_4_heaven()
		5:
			
			skill_ID_5_heaven()
		6:
			
			skill_ID_6_heaven()
		7:
			
			skill_ID_7_heaven()
		8:
			
			skill_ID_8_heaven()
		9:
			
			skill_ID_9_heaven()
		10:
			skill_ID_10_heaven()
		11: 
			skill_ID_11_heaven()
func define_skill_slot_3_heaven():
	match skill_slot_3_skill_heaven:
		1:
			skill_ID_1_heaven()
		2:
			skill_ID_2_heaven()
		3:
			
			skill_ID_3_heaven()
		4:
			
			skill_ID_4_heaven()
		5:
			
			skill_ID_5_heaven()
		6:
			
			skill_ID_6_heaven()
		7:
			
			skill_ID_7_heaven()
		8:
			
			skill_ID_8_heaven()
		9:
			
			skill_ID_9_heaven()
		10:
			skill_ID_10_heaven()
		11:
			skill_ID_11_heaven()
func define_skill_slot_4_heaven():
	match skill_slot_4_skill_heaven:
		1:
			skill_ID_1_heaven()
		2:
			skill_ID_2_heaven()
		3:
			
			skill_ID_3_heaven()
		4:
			
			skill_ID_4_heaven()
		5:
			
			skill_ID_5_heaven()
		6:
			skill_ID_6_heaven()
		7:
			
			skill_ID_7_heaven()
		8:
			
			skill_ID_8_heaven()
		9:
			
			skill_ID_9_heaven()
		10:
			skill_ID_10_heaven()
		11:
			skill_ID_11_heaven()
###       SKILL SLOTS HELL
func define_skill_slot_1_hell():
	match skill_slot_1_skill_hell:
		1:
			skill_ID_1_hell()
		2:
			skill_ID_2_hell()
		3:
			pass
			#skill_ID_3_hell()
		4:
			pass
			#skill_ID_4_hell()
		5:
			pass
			#skill_ID_5_hell()
		6:
			pass
			#skill_ID_6_hell()
		7:
			pass
			#skill_ID_7_hell()
		8:
			pass
			#skill_ID_8_hell()
		9:
			pass
			#skill_ID_9_hell()
		10:
			pass
func define_skill_slot_2_hell():
	match skill_slot_2_skill_hell:
		1:
			skill_ID_1_hell()
		2:
			skill_ID_2_hell()
		3:
			pass
			#skill_ID_3_hell()
		4:
			pass
			#skill_ID_4_hell()
		5:
			pass
			#skill_ID_5_hell()
		6:
			pass
			#skill_ID_6_hell()
		7:
			pass
			#skill_ID_7_hell()
		8:
			pass
			#skill_ID_8_hell()
		9:
			pass
			#skill_ID_9_hell()
		10:
			pass
func define_skill_slot_3_hell():
	match skill_slot_3_skill_hell:
		1:
			skill_ID_1_hell()
		2:
			skill_ID_2_hell()
		3:
			pass
			#skill_ID_3_hell()
		4:
			pass
			#skill_ID_4_hell()
		5:
			pass
			#skill_ID_5_hell()
		6:
			pass
			#skill_ID_6_hell()
		7:
			pass
			#skill_ID_7_hell()
		8:
			pass
			#skill_ID_8_hell()
		9:
			pass
			#skill_ID_9_hell()
		10:
			pass
func define_skill_slot_4_hell():
	match skill_slot_4_skill_hell:
		1:
			skill_ID_1_hell()
		2:
			skill_ID_2_hell()
		3:
			pass
			#skill_ID_3_hell()
		4:
			pass
			#skill_ID_4_hell()
		5:
			pass
			#skill_ID_5_hell()
		6:
			pass
			#skill_ID_6_hell()
		7:
			pass
			#skill_ID_7_hell()
		8:
			pass
			#skill_ID_8_hell()
		9:
			pass
			#skill_ID_9_hell()
		10:
			pass

### SKILL EFFECTS
###       HEAVEN SKILLS
#test skill that just does damage based off of malice
func skill_ID_1_heaven():
	
	heavenstats.convert_tempo(ID_1_heaven_tempo)
	print_debug(heavenstats.character_name + " locked in " + ID_1_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	heavenstats.convert_skill_power(ID_1_heaven_power)
	
	match heaven_target_ID:
		2:
			print_debug(str(heavenstats.character_name) + " used  " + str(ID_1_heaven_skill_name) + " on " + str(hellstats.character_name) + " (" + str(heavenstats.current_tempo) + " tempo)" )
			damage_calc.heaven_to_hell_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
		
		3:
			print_debug(str(heavenstats.character_name) + " used  " + str(ID_1_heaven_skill_name) + " on " + str(clownstats.character_name) + " (" + str(heavenstats.current_tempo) + " tempo)" )
			damage_calc.heaven_to_clown_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
#test skill that just does damage based off of deviltry, but spends a little magia bar
func skill_ID_2_heaven():

	heavenstats.convert_tempo(ID_2_heaven_tempo)
	print_debug(heavenstats.character_name + " locked in " + ID_2_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	heavenstats.convert_skill_power(ID_2_heaven_tempo)
	heavenstats.subtract_magia(ID_2_heaven_cost_1)
	
	match heaven_target_ID:
		2:
			print_debug(str(heavenstats.character_name) + " used  " + str(ID_2_heaven_skill_name) + " on " + str(hellstats.character_name) + " (" + str(heavenstats.current_tempo) + " tempo)" )
			damage_calc.heaven_to_hell_deviltry_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
		
		3:
			print_debug(str(heavenstats.character_name) + " used  " + str(ID_2_heaven_skill_name) + " on " + str(clownstats.character_name) + " (" + str(heavenstats.current_tempo) + " tempo)" )
			damage_calc.heaven_to_clown_deviltry_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")

func skill_ID_3_heaven():
	heavenstats.convert_tempo(ID_3_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_3_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	heavenstats.add_malice(ID_3_heaven_increase_1)
	heavenstats.subtract_magia(ID_3_heaven_cost_1)
	
	effect_animation.find_effect_spot_heaven()
	effect_animation.play("basic_heal")
	
	skill_effect_wear_off_set.emit()
	
func skill_ID_4_heaven():
	print_debug(heavenstats.character_name + " used " + ID_4_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	heavenstats.convert_tempo(ID_4_heaven_tempo)
	heavenstats.add_heart(ID_4_heaven_increase_1)
	heavenstats.subtract_magia(ID_4_heaven_cost_1)
	
	effect_animation.find_effect_spot_heaven()
	effect_animation.play("basic_heal")

func skill_ID_5_heaven():
	
	heavenstats.convert_tempo(ID_5_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_5_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	heavenstats.subtract_heart(ID_5_heaven_cost_1)
	effect_animation.find_attack_spot_heaven()
	effect_animation.play("basic_slash")
	
	await get_tree().create_timer(.5).timeout
	
	hellstats.add_magia(ID_5_heaven_increase_1)
	hellstats.add_deviltry(ID_5_heaven_increase_2)
	hellstats.add_malice(ID_5_heaven_increase_3)
	
	effect_animation.find_effect_spot_hell()
	effect_animation.play("basic_heal")
	await get_tree().create_timer(.1).timeout
	effect_animation.play("basic_heal")
	await get_tree().create_timer(.1).timeout
	effect_animation.play("basic_heal")
	
	skill_effect_wear_off_set.emit()

func skill_ID_6_heaven():
	var skill_ID_6_cost = heavenstats.max_magia * ID_6_heaven_percent_decrease_1
	
	heavenstats.convert_tempo(ID_6_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_6_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	heavenstats.subtract_magia(skill_ID_6_cost)
	
	status_effects.holy_swords_set()
	
func skill_ID_7_heaven():
	var rand_choice = [1,2].pick_random()
	var num = [0, 0, 0, 9].pick_random()
	
	
	heavenstats.convert_tempo(ID_7_heaven_tempo + num)
	print_debug(heavenstats.character_name + " used " + ID_7_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	match rand_choice:
		1:
			hellstats.subtract_deviltry(ID_7_heaven_increase_1)
			effect_animation.find_effect_spot_hell()
			effect_animation.play("basic_slash")
			
			await get_tree().create_timer(.1).timeout
			
			heavenstats.add_malice(ID_7_heaven_increase_1)
			effect_animation.find_effect_spot_heaven()
			effect_animation.play("basic_heal")
			
		2:
			heavenstats.subtract_deviltry(ID_7_heaven_increase_1)
			effect_animation.find_effect_spot_heaven()
			effect_animation.play("basic_slash")
			
			await get_tree().create_timer(.1).timeout
			
			hellstats.add_malice(ID_7_heaven_increase_1)
			effect_animation.find_effect_spot_hell()
			effect_animation.play("basic_heal")
func skill_ID_8_heaven():
	#make this one last bc its kinda hard, but its the one thats basically tailwind from pokemon
	pass
	
func skill_ID_9_heaven():
	
	heavenstats.convert_tempo(ID_9_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_9_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	match heaven_target_ID:
		
		2:
			
			damage_calc.heaven_to_hell_malice_damagecalc()
			effect_animation.find_effect_spot_hell()
			effect_animation.play("basic_slash")
			
			await get_tree().create_timer(.1).timeout
			
			heavenstats.add_magia(damage_calc.heaven_to_hell_malice_damagecalc().total_damage)
			effect_animation.find_effect_spot_heaven()
			effect_animation.play("basic_heal")
			
		3:
			damage_calc.heaven_to_clown_malice_damagecalc()
			effect_animation.find_effect_spot_clown()
			effect_animation.play("basic_slash")
			
			await get_tree().create_timer(.1).timeout
			
			hellstats.add_magia(damage_calc.heaven_to_clown_malice_damagecalc().total_damage)
			effect_animation.find_effect_spot_hell()
			effect_animation.play("basic_heal")

func skill_ID_10_heaven():
	### BE SURE TO MAKE THE SKILL POWER FOR THESE RANGES EQUALLY SPACED APART, 1 IS WEAKEST, 3 IS STRONGEST
	var stage
	heavenstats.convert_tempo(ID_10_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_10_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	if heavenstats.current_magia <= (heavenstats.max_magia * .66):
		stage = 2
		heavenstats.convert_skill_power(ID_10_heaven_power_2)
	if heavenstats.current_magia <= (heavenstats.max_magia * .33):
		stage = 1

	else:
		stage = 3
		heavenstats.convert_skill_power(ID_10_heaven_power_3)
	
	
	match heaven_target_ID:
		2:
			match stage:
				1:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_1)
					damage_calc.heaven_to_hell_malice_damagecalc()
					
					effect_animation.find_effect_spot_hell()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_10_heaven_decrease_1)
						2:
							hellstats.divide_deviltry(ID_10_heaven_percent_decrease_1)
						3:
							hellstats.divide_malice(ID_10_heaven_percent_decrease_1)
					effect_animation.play("basic_slash")
				2:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_2)
					damage_calc.heaven_to_hell_malice_damagecalc()
					
					effect_animation.find_effect_spot_hell()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_10_heaven_decrease_2)
						2:
							hellstats.divide_deviltry(ID_10_heaven_percent_decrease_2)
						3:
							hellstats.divide_malice(ID_10_heaven_percent_decrease_2)
					effect_animation.play("basic_slash")
				3:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_3)
					damage_calc.heaven_to_hell_malice_damagecalc()
					
					effect_animation.find_effect_spot_hell()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_10_heaven_decrease_3)
						2:
							hellstats.divide_deviltry(ID_10_heaven_percent_decrease_3)
						3:
							hellstats.divide_malice(ID_10_heaven_percent_decrease_3)
					effect_animation.play("basic_slash")
		3:
			match stage:
				1:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_1)
					damage_calc.heaven_to_clown_malice_damagecalc()
					
					effect_animation.find_effect_spot_clown()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_10_heaven_decrease_1)
						2:
							clownstats.divide_deviltry(ID_10_heaven_percent_decrease_1)
						3:
							clownstats.divide_malice(ID_10_heaven_percent_decrease_1)
					effect_animation.play("basic_slash")
				2:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_2)
					damage_calc.heaven_to_clown_malice_damagecalc()
					
					effect_animation.find_effect_spot_clown()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_10_heaven_decrease_2)
						2:
							clownstats.divide_deviltry(ID_10_heaven_percent_decrease_2)
						3:
							clownstats.divide_malice(ID_10_heaven_percent_decrease_2)
					effect_animation.play("basic_slash")
				3:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_3)
					damage_calc.heaven_to_clown_malice_damagecalc()
					
					effect_animation.find_effect_spot_clown()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_10_heaven_decrease_3)
						2:
							clownstats.divide_deviltry(ID_10_heaven_percent_decrease_3)
						3:
							clownstats.divide_malice(ID_10_heaven_percent_decrease_3)
					effect_animation.play("basic_slash")

func skill_ID_11_heaven():
	### BE SURE TO MAKE THE SKILL POWER FOR THESE RANGES EQUALLY SPACED APART, 11 IS WEAKEST, 3 IS STRONGEST
	var stage
	heavenstats.convert_tempo(ID_11_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_11_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	if heavenstats.current_magia <= (heavenstats.max_magia * .66):
		stage = 2
		heavenstats.convert_skill_power(ID_11_heaven_power_2)
	if heavenstats.current_magia <= (heavenstats.max_magia * .33):
		stage = 1

	else:
		stage = 3
		heavenstats.convert_skill_power(ID_11_heaven_power_3)
	
	
	match heaven_target_ID:
		2:
			match stage:
				1:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_1)
					damage_calc.heaven_to_hell_deviltry_damagecalc()
					
					effect_animation.find_effect_spot_hell()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_11_heaven_decrease_1)
						2:
							hellstats.divide_deviltry(ID_11_heaven_percent_decrease_1)
						3:
							hellstats.divide_deviltry(ID_11_heaven_percent_decrease_1)
					effect_animation.play("basic_slash")
				2:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_2)
					damage_calc.heaven_to_hell_deviltry_damagecalc()
					
					effect_animation.find_effect_spot_hell()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_11_heaven_decrease_2)
						2:
							hellstats.divide_deviltry(ID_11_heaven_percent_decrease_2)
						3:
							hellstats.divide_deviltry(ID_11_heaven_percent_decrease_2)
					effect_animation.play("basic_slash")
				3:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_3)
					damage_calc.heaven_to_hell_deviltry_damagecalc()
					
					effect_animation.find_effect_spot_hell()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_11_heaven_decrease_3)
						2:
							hellstats.divide_deviltry(ID_11_heaven_percent_decrease_3)
						3:
							hellstats.divide_deviltry(ID_11_heaven_percent_decrease_3)
					effect_animation.play("basic_slash")
		3:
			match stage:
				1:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_1)
					damage_calc.heaven_to_clown_deviltry_damagecalc()
					
					effect_animation.find_effect_spot_clown()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_11_heaven_decrease_1)
						2:
							clownstats.divide_malice(ID_11_heaven_percent_decrease_1)
						3:
							clownstats.divide_deviltry(ID_11_heaven_percent_decrease_1)
					effect_animation.play("basic_slash")
				2:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_2)
					damage_calc.heaven_to_clown_deviltry_damagecalc()
					
					effect_animation.find_effect_spot_clown()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_11_heaven_decrease_2)
						2:
							clownstats.divide_malice(ID_11_heaven_percent_decrease_2)
						3:
							clownstats.divide_deviltry(ID_11_heaven_percent_decrease_2)
					effect_animation.play("basic_slash")
				3:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_3)
					damage_calc.heaven_to_clown_deviltry_damagecalc()
					
					effect_animation.find_effect_spot_clown()
					effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_11_heaven_decrease_3)
						2:
							clownstats.divide_malice(ID_11_heaven_percent_decrease_3)
						3:
							clownstats.divide_deviltry(ID_11_heaven_percent_decrease_3)
					effect_animation.play("basic_slash")
###       HELL SKILLS
#test skill that just does damage based off of malice
func skill_ID_1_hell():
	print_debug(hellstats.character_name + " locked in " + ID_1_hell_skill_name + " (" + str(hellstats.current_tempo) + " tempo)" )
	hellstats.convert_tempo(ID_1_hell_tempo)
	hellstats.convert_skill_power(ID_1_hell_power)
	
	match hell_target_ID:
		2:
			print_debug(str(hellstats.character_name) + " used  " + str(ID_1_hell_skill_name) + " on " + str(heavenstats.character_name) + " (" + str(hellstats.current_tempo) + " tempo)" )
			damage_calc.hell_to_heaven_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
		
		3:
			print_debug(str(hellstats.character_name) + " used  " + str(ID_1_hell_skill_name) + " on " + str(clownstats.character_name) + " (" + str(hellstats.current_tempo) + " tempo)" )
			damage_calc.hell_to_clown_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")	
#test skill that just does damage based off of deviltry, but spends a little magia bar
func skill_ID_2_hell():
	print_debug(hellstats.character_name + " locked in " + ID_2_hell_skill_name + " (" + str(hellstats.current_tempo) + " tempo)" )
	hellstats.convert_tempo(ID_2_hell_tempo)
	hellstats.convert_skill_power(ID_2_hell_power)
	hellstats.subtract_magia(ID_2_hell_cost_1)
	
	match hell_target_ID:
		2:
			print_debug(str(hellstats.character_name) + " used  " + str(ID_2_hell_skill_name) + " on " + str(heavenstats.character_name) + " (" + str(hellstats.current_tempo) + " tempo)" )
			damage_calc.hell_to_heaven_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
		
		3:
			print_debug(str(hellstats.character_name) + " used  " + str(ID_2_hell_skill_name) + " on " + str(clownstats.character_name) + " (" + str(hellstats.current_tempo) + " tempo)" )
			damage_calc.hell_to_clown_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")

func skill_ID_3_hell():
	pass

func skill_ID_4_hell():
	pass
