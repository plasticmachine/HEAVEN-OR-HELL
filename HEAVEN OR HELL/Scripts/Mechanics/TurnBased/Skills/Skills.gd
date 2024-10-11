extends Node2D
signal skill_effect_wear_off_set


@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")
@onready var effect_animation = $"../BattleEffectManagerPosition/BattleEffectManager"

@onready var damage_calc = $"../DamageCalculation"
@onready var statseffects

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
@export var ID_1_heaven_percent_increase_1: int 
@export var ID_1_heaven_percent_increase_2: int 
@export var ID_1_heaven_percent_increase_3: int 
@export var ID_1_heaven_percent_decrease_1: int 
@export var ID_1_heaven_percent_decrease_2: int 
@export var ID_1_heaven_percent_decrease_3: int 

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
@export var ID_2_heaven_percent_increase_1: int 
@export var ID_2_heaven_percent_increase_2: int 
@export var ID_2_heaven_percent_increase_3: int 
@export var ID_2_heaven_percent_decrease_1: int 
@export var ID_2_heaven_percent_decrease_2: int 
@export var ID_2_heaven_percent_decrease_3: int 

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
@export var ID_3_heaven_percent_increase_1: int 
@export var ID_3_heaven_percent_increase_2: int 
@export var ID_3_heaven_percent_increase_3: int 
@export var ID_3_heaven_percent_decrease_1: int 
@export var ID_3_heaven_percent_decrease_2: int 
@export var ID_3_heaven_percent_decrease_3: int 

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
@export var ID_4_heaven_percent_increase_1: int 
@export var ID_4_heaven_percent_increase_2: int 
@export var ID_4_heaven_percent_increase_3: int 
@export var ID_4_heaven_percent_decrease_1: int 
@export var ID_4_heaven_percent_decrease_2: int 
@export var ID_4_heaven_percent_decrease_3: int 

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
@export var ID_1_hell_percent_increase_1: int 
@export var ID_1_hell_percent_increase_2: int 
@export var ID_1_hell_percent_increase_3: int 
@export var ID_1_hell_percent_decrease_1: int 
@export var ID_1_hell_percent_decrease_2: int 
@export var ID_1_hell_percent_decrease_3: int 

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
@export var ID_2_hell_percent_increase_1: int 
@export var ID_2_hell_percent_increase_2: int 
@export var ID_2_hell_percent_increase_3: int 
@export var ID_2_hell_percent_decrease_1: int 
@export var ID_2_hell_percent_decrease_2: int 
@export var ID_2_hell_percent_decrease_3: int 

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
@export var ID_3_hell_percent_increase_1: int 
@export var ID_3_hell_percent_increase_2: int 
@export var ID_3_hell_percent_increase_3: int 
@export var ID_3_hell_percent_decrease_1: int 
@export var ID_3_hell_percent_decrease_2: int 
@export var ID_3_hell_percent_decrease_3: int 

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
@export var ID_4_hell_percent_increase_1: int 
@export var ID_4_hell_percent_increase_2: int 
@export var ID_4_hell_percent_increase_3: int 
@export var ID_4_hell_percent_decrease_1: int 
@export var ID_4_hell_percent_decrease_2: int 
@export var ID_4_hell_percent_decrease_3: int 

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
			pass
			#skill_ID_3_heaven()
		4:
			pass
			#skill_ID_4_heaven()
		5:
			pass
			#skill_ID_5_heaven()
		6:
			pass
			#skill_ID_6_heaven()
		7:
			pass
			#skill_ID_7_heaven()
		8:
			pass
			#skill_ID_8_heaven()
		9:
			pass
			#skill_ID_9_heaven()
		10:
			pass
func define_skill_slot_2_heaven():
	match skill_slot_2_skill_heaven:
		1:
			skill_ID_1_heaven()
		2:
			skill_ID_2_heaven()
		3:
			pass
			#skill_ID_3_heaven()
		4:
			pass
			#skill_ID_4_heaven()
		5:
			pass
			#skill_ID_5_heaven()
		6:
			pass
			#skill_ID_6_heaven()
		7:
			pass
			#skill_ID_7_heaven()
		8:
			pass
			#skill_ID_8_heaven()
		9:
			pass
			#skill_ID_9_heaven()
		10:
			pass
func define_skill_slot_3_heaven():
	match skill_slot_3_skill_heaven:
		1:
			skill_ID_1_heaven()
		2:
			skill_ID_2_heaven()
		3:
			pass
			#skill_ID_3_heaven()
		4:
			pass
			#skill_ID_4_heaven()
		5:
			pass
			#skill_ID_5_heaven()
		6:
			pass
			#skill_ID_6_heaven()
		7:
			pass
			#skill_ID_7_heaven()
		8:
			pass
			#skill_ID_8_heaven()
		9:
			pass
			#skill_ID_9_heaven()
		10:
			pass
func define_skill_slot_4_heaven():
	match skill_slot_4_skill_heaven:
		1:
			skill_ID_1_heaven()
		2:
			skill_ID_2_heaven()
		3:
			pass
			#skill_ID_3_heaven()
		4:
			pass
			#skill_ID_4_heaven()
		5:
			pass
			#skill_ID_5_heaven()
		6:
			pass
			#skill_ID_6_heaven()
		7:
			pass
			#skill_ID_7_heaven()
		8:
			pass
			#skill_ID_8_heaven()
		9:
			pass
			#skill_ID_9_heaven()
		10:
			pass
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
	print_debug(heavenstats.character_name + " locked in " + ID_1_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	heavenstats.convert_tempo(ID_1_heaven_tempo)
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
	print_debug(heavenstats.character_name + " locked in " + ID_2_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	heavenstats.convert_tempo(ID_2_heaven_tempo)
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
	print_debug(heavenstats.character_name + " locked in " + ID_3_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	heavenstats.convert_tempo(ID_3_heaven_tempo)
	heavenstats.add_malice(ID_3_heaven_increase_1)
	skill_effect_wear_off_set.emit()
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
