extends Node2D

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var effect_animation = $"../BattleEffectManagerPosition/BattleEffectManager"

@onready var damage_calc = $"../DamageCalculation"

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
@export var test_1_heaven_tempo: int = 5
@export var test_1_heaven_power: int = 35 
@export var test_1_heaven_cost_1: int = 0
@export var test_1_heaven_cost_2: int = 0
@export_subgroup("Flat Increases + Decreases: Test 1")
@export var test_1_heaven_increase_1: int = 0
@export var test_1_heaven_increase_2: int = 0
@export var test_1_heaven_increase_3: int = 0
@export var test_1_heaven_decrease_1: int = 0
@export var test_1_heaven_decrease_2: int = 0
@export var test_1_heaven_decrease_3: int = 0
@export_subgroup("Percentage Increases + Decreases: Test 1")
@export var test_1_heaven_percent_increase_1: int = 0
@export var test_1_heaven_percent_increase_2: int = 0
@export var test_1_heaven_percent_increase_3: int = 0
@export var test_1_heaven_percent_decrease_1: int = 0
@export var test_1_heaven_percent_decrease_2: int = 0
@export var test_1_heaven_percent_decrease_3: int = 0

@export_group("Heaven Skill: Test 2")
@export_subgroup("Variables: Test 2")
@export var test_2_heaven_tempo: int = 5
@export var test_2_heaven_power: int = 35
@export var test_2_heaven_cost_1: int = 0
@export var test_2_heaven_cost_2: int = 0
@export_subgroup("Flat Increases + Decreases: Test 2")
@export var test_2_heaven_increase_1: int = 0
@export var test_2_heaven_increase_2: int = 0
@export var test_2_heaven_increase_3: int = 0
@export var test_2_heaven_decrease_1: int = 0
@export var test_2_heaven_decrease_2: int = 0
@export var test_2_heaven_decrease_3: int = 0
@export_subgroup("Percentage Increases + Decreases: Test 2")
@export var test_2_heaven_percent_increase_1: int = 0
@export var test_2_heaven_percent_increase_2: int = 0
@export var test_2_heaven_percent_increase_3: int = 0
@export var test_2_heaven_percent_decrease_1: int = 0
@export var test_2_heaven_percent_decrease_2: int = 0
@export var test_2_heaven_percent_decrease_3: int = 0

@export_group("Heaven Skill: Test 3")
@export_subgroup("Variables: Test 3")
@export var test_3_heaven_tempo: int = 5
@export var test_3_heaven_power: int = 35
@export var test_3_heaven_cost_1: int = 0
@export var test_3_heaven_cost_2: int = 0
@export_subgroup("Flat Increases + Decreases: Test 3")
@export var test_3_heaven_increase_1: int = 0
@export var test_3_heaven_increase_2: int = 0
@export var test_3_heaven_increase_3: int = 0
@export var test_3_heaven_decrease_1: int = 0
@export var test_3_heaven_decrease_2: int = 0
@export var test_3_heaven_decrease_3: int = 0
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var test_3_heaven_percent_increase_1: int = 0
@export var test_3_heaven_percent_increase_2: int = 0
@export var test_3_heaven_percent_increase_3: int = 0
@export var test_3_heaven_percent_decrease_1: int = 0
@export var test_3_heaven_percent_decrease_2: int = 0
@export var test_3_heaven_percent_decrease_3: int = 0

@export_group("Heaven Skill: Test 4")
@export_subgroup("Variables: Test 4")
@export var test_4_heaven_tempo: int = 5
@export var test_4_heaven_power: int = 35
@export var test_4_heaven_cost_1: int = 0
@export var test_4_heaven_cost_2: int = 0
@export_subgroup("Flat Increases + Decreases: Test 4")
@export var test_4_heaven_increase_1: int = 0
@export var test_4_heaven_increase_2: int = 0
@export var test_4_heaven_increase_3: int = 0
@export var test_4_heaven_decrease_1: int = 0
@export var test_4_heaven_decrease_2: int = 0
@export var test_4_heaven_decrease_3: int = 0
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var test_4_heaven_percent_increase_1: int = 0
@export var test_4_heaven_percent_increase_2: int = 0
@export var test_4_heaven_percent_increase_3: int = 0
@export var test_4_heaven_percent_decrease_1: int = 0
@export var test_4_heaven_percent_decrease_2: int = 0
@export var test_4_heaven_percent_decrease_3: int = 0

@export_group("Hell Skill: Test 1")
@export_subgroup("Variables: Test 1")
@export var test_1_hell_tempo: int = 5
@export var test_1_hell_power: int = 35
@export var test_1_hell_cost_1: int = 0
@export var test_1_hell_cost_2: int = 0
@export_subgroup("Flat Increases + Decreases: Test 1")
@export var test_1_hell_increase_1: int = 0
@export var test_1_hell_increase_2: int = 0
@export var test_1_hell_increase_3: int = 0
@export var test_1_hell_decrease_1: int = 0
@export var test_1_hell_decrease_2: int = 0
@export var test_1_hell_decrease_3: int = 0
@export_subgroup("Percentage Increases + Decreases: Test 1")
@export var test_1_hell_percent_increase_1: int = 0
@export var test_1_hell_percent_increase_2: int = 0
@export var test_1_hell_percent_increase_3: int = 0
@export var test_1_hell_percent_decrease_1: int = 0
@export var test_1_hell_percent_decrease_2: int = 0
@export var test_1_hell_percent_decrease_3: int = 0

@export_group("Hell Skill: Test 2")
@export_subgroup("Variables: Test 2")
@export var test_2_hell_tempo: int = 5
@export var test_2_hell_power: int = 35
@export var test_2_hell_cost_1: int = 0
@export var test_2_hell_cost_2: int = 0
@export_subgroup("Flat Increases + Decreases: Test 2")
@export var test_2_hell_increase_1: int = 0
@export var test_2_hell_increase_2: int = 0
@export var test_2_hell_increase_3: int = 0
@export var test_2_hell_decrease_1: int = 0
@export var test_2_hell_decrease_2: int = 0
@export var test_2_hell_decrease_3: int = 0
@export_subgroup("Percentage Increases + Decreases: Test 2")
@export var test_2_hell_percent_increase_1: int = 0
@export var test_2_hell_percent_increase_2: int = 0
@export var test_2_hell_percent_increase_3: int = 0
@export var test_2_hell_percent_decrease_1: int = 0
@export var test_2_hell_percent_decrease_2: int = 0
@export var test_2_hell_percent_decrease_3: int = 0

@export_group("Hell Skill: Test 3")
@export_subgroup("Variables: Test 3")
@export var test_3_hell_tempo: int = 5
@export var test_3_hell_power: int = 35
@export var test_3_hell_cost_1: int = 0
@export var test_3_hell_cost_2: int = 0
@export_subgroup("Flat Increases + Decreases: Test 3")
@export var test_3_hell_increase_1: int = 0
@export var test_3_hell_increase_2: int = 0
@export var test_3_hell_increase_3: int = 0
@export var test_3_hell_decrease_1: int = 0
@export var test_3_hell_decrease_2: int = 0
@export var test_3_hell_decrease_3: int = 0
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var test_3_hell_percent_increase_1: int = 0
@export var test_3_hell_percent_increase_2: int = 0
@export var test_3_hell_percent_increase_3: int = 0
@export var test_3_hell_percent_decrease_1: int = 0
@export var test_3_hell_percent_decrease_2: int = 0
@export var test_3_hell_percent_decrease_3: int = 0

@export_group("Hell Skill: Test 4")
@export_subgroup("Variables: Test 4")
@export var test_4_hell_tempo: int = 5
@export var test_4_hell_power: int = 35
@export var test_4_hell_cost_1: int = 0
@export var test_4_hell_cost_2: int = 0
@export_subgroup("Flat Increases + Decreases: Test 4")
@export var test_4_hell_increase_1: int = 0
@export var test_4_hell_increase_2: int = 0
@export var test_4_hell_increase_3: int = 0
@export var test_4_hell_decrease_1: int = 0
@export var test_4_hell_decrease_2: int = 0
@export var test_4_hell_decrease_3: int = 0
@export_subgroup("Percentage Increases + Decreases: Test 3")
@export var test_4_hell_percent_increase_1: int = 0
@export var test_4_hell_percent_increase_2: int = 0
@export var test_4_hell_percent_increase_3: int = 0
@export var test_4_hell_percent_decrease_1: int = 0
@export var test_4_hell_percent_decrease_2: int = 0
@export var test_4_hell_percent_decrease_3: int = 0

### TARGET_ID = 1: HEAVEN 2: HELL 3: CLOWN

### SKILL SLOTS
###       SKILL SLOTS HEAVEN
func define_skill_slot_1_heaven():
	match skill_slot_1_skill_heaven:
		1:
			skill_test_1_heaven()
		2:
			skill_test_2_heaven()
func define_skill_slot_2_heaven():
	match skill_slot_2_skill_heaven:
		1:
			skill_test_1_heaven()
		2:
			skill_test_2_heaven()
func define_skill_slot_3_heaven():
	match skill_slot_3_skill_heaven:
		1:
			skill_test_1_heaven()
		2:
			skill_test_2_heaven()
func define_skill_slot_4_heaven():
	match skill_slot_4_skill_heaven:
		1:
			skill_test_1_heaven()
		2:
			skill_test_2_heaven()

###       SKILL SLOTS HELL
func define_skill_slot_1_hell():
	match skill_slot_1_skill_hell:
		1:
			skill_test_1_hell()
		2:
			skill_test_2_hell()
func define_skill_slot_2_hell():
	match skill_slot_2_skill_hell:
		1:
			skill_test_1_hell()
		2:
			skill_test_2_hell()
func define_skill_slot_3_hell():
	match skill_slot_3_skill_hell:
		1:
			skill_test_1_hell()
		2:
			skill_test_2_hell()
func define_skill_slot_4_hell():
	match skill_slot_4_skill_hell:
		1:
			skill_test_1_hell()
		2:
			skill_test_2_hell()

### SKILL EFFECTS
###       HEAVEN SKILLS
#test skill that just does damage based off of malice
func skill_test_1_heaven():
	heavenstats.convert_tempo(test_1_heaven_tempo)
	heavenstats.convert_skill_power(test_1_heaven_power)
	
	match heaven_target_ID:
		2:
			damage_calc.heaven_to_hell_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
		
		3:
			damage_calc.heaven_to_clown_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
#test skill that just does damage based off of deviltry, but spends a little magia bar
func skill_test_2_heaven():
	
	
	heavenstats.convert_tempo(test_2_heaven_tempo)
	heavenstats.convert_skill_power(test_2_heaven_tempo)
	heavenstats.subtract_magia(test_2_heaven_cost_1)
	
	match heaven_target_ID:
		2:
			damage_calc.heaven_to_hell_deviltry_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
		
		3:
			damage_calc.heaven_to_clown_deviltry_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
###       HELL SKILLS
#test skill that just does damage based off of malice
func skill_test_1_hell():
	hellstats.convert_tempo(test_1_hell_tempo)
	hellstats.convert_skill_power(test_1_hell_power)
	
	match hell_target_ID:
		2:
			damage_calc.hell_to_heaven_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
		
		3:
			damage_calc.hell_to_clown_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")	
#test skill that just does damage based off of deviltry, but spends a little magia bar
func skill_test_2_hell():
	hellstats.convert_tempo(test_2_hell_tempo)
	hellstats.convert_skill_power(test_2_hell_power)
	hellstats.subtract_magia(test_2_hell_cost_1)
	
	match hell_target_ID:
		2:
			damage_calc.hell_to_heaven_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
		
		3:
			damage_calc.hell_to_clown_malice_damagecalc()
			effect_animation.find_attack_spot_enemy()
			effect_animation.play("basic_slash")
