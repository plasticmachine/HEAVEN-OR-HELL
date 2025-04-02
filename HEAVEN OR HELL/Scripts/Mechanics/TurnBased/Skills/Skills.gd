extends Node2D
class_name Skills
signal skill_effect_wear_off_set
signal heaven_ID_5_wear_off_set

signal hell_ID_3_wear_off_set

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")
@onready var heaven_effect_animation = $"../BattleEffectManagerPosition/HeavenBattleEffectManager"
@onready var heaven_effect_animation_support = $"../BattleEffectManagerPosition/HeavenBattleEffectManagerSupport"
@onready var hell_effect_animation = $"../BattleEffectManagerPosition/HellBattleEffectManager"
@onready var hell_effect_animation_support = $"../BattleEffectManagerPosition/HellBattleEffectManagerSupport"
@onready var battle_effect_manager_FS = $"../BattleEffectManagerPosition/BattleEffectManagerFS"
@onready var battle_effect_manager_FS_support = $"../BattleEffectManagerPosition/BattleEffectManagerFSSupport"
@onready var battle_effect_manager_FS_behind = $"../BattleEffectManagerPosition/BattleEffectManagerFSBehind"
@export var enemy_effect_animation: AnimatedSprite2D
@export var enemy_effect_animation_support: AnimatedSprite2D

@onready var heaven_switch_turn_animation_buffer: float
@onready var hell_switch_turn_animation_buffer: float
#@onready var clown_switch_turn_animation_buffer: float


@onready var damage_calc = $"../DamageCalculation"
@onready var status_effects = $"../StatusEffects"

@export var heaven_target_ID: int
@export var hell_target_ID: int

@onready var hell_turn_end
@onready var heaven_turn_end

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
@export var ID_1_heaven_animation_buffer: float
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
@export var ID_2_heaven_animation_buffer: float
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
@export var ID_3_heaven_animation_buffer: float
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
@export var ID_4_heaven_animation_buffer: float
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
@export var ID_5_heaven_animation_buffer: float
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
@export var ID_6_heaven_animation_buffer: float
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
@export var ID_7_heaven_animation_buffer: float
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
@export var ID_8_heaven_animation_buffer: float
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
@export var ID_9_heaven_animation_buffer: float
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
@export var ID_10_heaven_animation_buffer: float
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
@export var ID_11_heaven_animation_buffer: float
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
@export var ID_1_hell_animation_buffer: float
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
@export var ID_2_hell_animation_buffer: float
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
@export var ID_3_hell_animation_buffer: float
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
@export var ID_4_hell_animation_buffer: float
@export_subgroup("Flat Increases + Decreases: Test 4")
@export var ID_4_hell_increase_1: int 
@export var ID_4_hell_increase_2: int 
@export var ID_4_hell_increase_3: int 
@export var ID_4_hell_decrease_1: int 
@export var ID_4_hell_decrease_2: int 
@export var ID_4_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 4")
@export var ID_4_hell_percent_increase_1: float 
@export var ID_4_hell_percent_increase_2: float 
@export var ID_4_hell_percent_increase_3: float 
@export var ID_4_hell_percent_decrease_1: float 
@export var ID_4_hell_percent_decrease_2: float 
@export var ID_4_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 5")
@export_subgroup("Variables: Test 5")
@export var ID_5_hell_skill_name: String
@export var ID_5_hell_skill_image: Image
@export var ID_5_hell_tempo: int 
@export var ID_5_hell_power: int 
@export var ID_5_hell_cost_1: int 
@export var ID_5_hell_cost_2: int 
@export var ID_5_hell_effect_length: int
@export var ID_5_hell_animation_buffer: float
@export_subgroup("Flat Increases + Decreases: Test 5")
@export var ID_5_hell_increase_1: int 
@export var ID_5_hell_increase_2: int 
@export var ID_5_hell_increase_3: int 
@export var ID_5_hell_decrease_1: int 
@export var ID_5_hell_decrease_2: int 
@export var ID_5_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 5")
@export var ID_5_hell_percent_increase_1: float 
@export var ID_5_hell_percent_increase_2: float 
@export var ID_5_hell_percent_increase_3: float 
@export var ID_5_hell_percent_decrease_1: float 
@export var ID_5_hell_percent_decrease_2: float 
@export var ID_5_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 6")
@export_subgroup("Variables: Test 6")
@export var ID_6_hell_skill_name: String
@export var ID_6_hell_skill_image: Image
@export var ID_6_hell_tempo: int 
@export var ID_6_hell_power: int 
@export var ID_6_hell_cost_1: int 
@export var ID_6_hell_cost_2: int 
@export var ID_6_hell_effect_length: int 
@export var ID_6_hell_animation_buffer: float
@export_subgroup("Flat Increases + Decreases: Test 6")
@export var ID_6_hell_increase_1: int 
@export var ID_6_hell_increase_2: int 
@export var ID_6_hell_increase_3: int 
@export var ID_6_hell_decrease_1: int 
@export var ID_6_hell_decrease_2: int 
@export var ID_6_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 6")
@export var ID_6_hell_percent_increase_1: float 
@export var ID_6_hell_percent_increase_2: float 
@export var ID_6_hell_percent_increase_3: float 
@export var ID_6_hell_percent_decrease_1: float 
@export var ID_6_hell_percent_decrease_2: float 
@export var ID_6_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 7")
@export_subgroup("Variables: Test 7")
@export var ID_7_hell_skill_name: String
@export var ID_7_hell_skill_image: Image
@export var ID_7_hell_tempo: int 
@export var ID_7_hell_power: int 
@export var ID_7_hell_cost_1: int 
@export var ID_7_hell_cost_2: int 
@export var ID_7_hell_effect_length: int 
@export var ID_7_hell_animation_buffer: float
@export_subgroup("Flat Increases + Decreases: Test 7")
@export var ID_7_hell_increase_1: int 
@export var ID_7_hell_increase_2: int 
@export var ID_7_hell_increase_3: int 
@export var ID_7_hell_decrease_1: int 
@export var ID_7_hell_decrease_2: int 
@export var ID_7_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 7")
@export var ID_7_hell_percent_increase_1: float 
@export var ID_7_hell_percent_increase_2: float 
@export var ID_7_hell_percent_increase_3: float 
@export var ID_7_hell_percent_decrease_1: float 
@export var ID_7_hell_percent_decrease_2: float 
@export var ID_7_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 8")
@export_subgroup("Variables: Test 8")
@export var ID_8_hell_skill_name: String
@export var ID_8_hell_skill_image: Image
@export var ID_8_hell_tempo: int 
@export var ID_8_hell_power: int 
@export var ID_8_hell_cost_1: int 
@export var ID_8_hell_cost_2: int 
@export var ID_8_hell_effect_length: int 
@export var ID_8_hell_animation_buffer: float
@export_subgroup("Flat Increases + Decreases: Test 8")
@export var ID_8_hell_increase_1: int 
@export var ID_8_hell_increase_2: int 
@export var ID_8_hell_increase_3: int 
@export var ID_8_hell_decrease_1: int 
@export var ID_8_hell_decrease_2: int 
@export var ID_8_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 8")
@export var ID_8_hell_percent_increase_1: float 
@export var ID_8_hell_percent_increase_2: float 
@export var ID_8_hell_percent_increase_3: float 
@export var ID_8_hell_percent_decrease_1: float 
@export var ID_8_hell_percent_decrease_2: float 
@export var ID_8_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 9")
@export_subgroup("Variables: Test 9")
@export var ID_9_hell_skill_name: String
@export var ID_9_hell_skill_image: Image
@export var ID_9_hell_tempo: int 
@export var ID_9_hell_power: int 
@export var ID_9_hell_cost_1: int 
@export var ID_9_hell_cost_2: int 
@export var ID_9_hell_effect_length: int 
@export var ID_9_hell_animation_buffer: float
@export_subgroup("Flat Increases + Decreases: Test 9")
@export var ID_9_hell_increase_1: int 
@export var ID_9_hell_increase_2: int 
@export var ID_9_hell_increase_3: int 
@export var ID_9_hell_decrease_1: int 
@export var ID_9_hell_decrease_2: int 
@export var ID_9_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 9")
@export var ID_9_hell_percent_increase_1: float 
@export var ID_9_hell_percent_increase_2: float 
@export var ID_9_hell_percent_increase_3: float 
@export var ID_9_hell_percent_decrease_1: float 
@export var ID_9_hell_percent_decrease_2: float 
@export var ID_9_hell_percent_decrease_3: float 

@export_group("Hell Skill: Test 10")
@export_subgroup("Variables: Test 10")
@export var ID_10_hell_skill_name: String
@export var ID_10_hell_skill_image: Image
@export var ID_10_hell_tempo: int 
@export var ID_10_hell_power: int 
@export var ID_10_hell_cost_1: int 
@export var ID_10_hell_cost_2: int 
@export var ID_10_hell_effect_length: int 
@export var ID_10_hell_animation_buffer: float
@export_subgroup("Flat Increases + Decreases: Test 10")
@export var ID_10_hell_increase_1: int 
@export var ID_10_hell_increase_2: int 
@export var ID_10_hell_increase_3: int 
@export var ID_10_hell_decrease_1: int 
@export var ID_10_hell_decrease_2: int 
@export var ID_10_hell_decrease_3: int 
@export_subgroup("Percentage Increases + Decreases: Test 10")
@export var ID_10_hell_percent_increase_1: float 
@export var ID_10_hell_percent_increase_2: float 
@export var ID_10_hell_percent_increase_3: float 
@export var ID_10_hell_percent_decrease_1: float 
@export var ID_10_hell_percent_decrease_2: float 
@export var ID_10_hell_percent_decrease_3: float 


@export var VFX_buffer: float

### SYSTEM TEXT VARIABLES
@export var skill_used: String


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
			skill_ID_3_hell()
		4:
			pass
			skill_ID_4_hell()
		5:
			pass
			skill_ID_5_hell()
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
			skill_ID_3_hell()
		4:
			pass
			skill_ID_4_hell()
		5:
			pass
			skill_ID_5_hell()
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
			skill_ID_3_hell()
		4:
			pass
			skill_ID_4_hell()
		5:
			pass
			skill_ID_5_hell()
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
			skill_ID_3_hell()
		4:
			pass
			skill_ID_4_hell()
		5:
			pass
			skill_ID_5_hell()
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
	heaven_switch_turn_animation_buffer = ID_1_heaven_animation_buffer
	heavenstats.current_skill_used = ID_1_heaven_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_USED_SKILL")
	heavenstats.convert_skill_power(ID_1_heaven_power)
	
	match heaven_target_ID:
		2:
			print_debug(str(heavenstats.character_name) + " used  " + str(ID_1_heaven_skill_name) + " on " + str(hellstats.character_name) + " (" + str(heavenstats.current_tempo) + " tempo)" )
			damage_calc.heaven_to_hell_malice_damagecalc()
			hell_effect_animation.find_hit_spot()
			hell_effect_animation.play("basic_slash")
			HeavenSounds.HEAVEN_SLASH.play()
		3:
			print_debug(str(heavenstats.character_name) + " used  " + str(ID_1_heaven_skill_name) + " on " + str(clownstats.character_name) + " (" + str(heavenstats.current_tempo) + " tempo)" )
			damage_calc.heaven_to_clown_malice_damagecalc()
			enemy_effect_animation.find_hit_spot()
			enemy_effect_animation.play("basic_slash")
			HeavenSounds.HEAVEN_SLASH.play()
	

#test skill that just does damage based off of deviltry, but spends a little magia bar
func skill_ID_2_heaven():
	#heavenstats.convert_tempo(ID_2_heaven_tempo)
	heaven_switch_turn_animation_buffer = ID_2_heaven_animation_buffer
	heavenstats.current_skill_used = ID_2_heaven_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_USED_SKILL")
	heavenstats.convert_skill_power(ID_2_heaven_power)
	heavenstats.subtract_magia(ID_2_heaven_cost_1)
	heaven_effect_animation.play("magia_use")
	HeavenSounds.HEAVEN_MAGIA_USE.play()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_SPENDS_OWN_MAGIA")
	
	await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout
	
	
	match heaven_target_ID:
		2:
			print_debug(str(heavenstats.character_name) + " used  " + str(ID_2_heaven_skill_name) + " on " + str(hellstats.character_name) + " (" + str(heavenstats.current_tempo) + " tempo)" )
			damage_calc.heaven_to_hell_deviltry_damagecalc()
			hell_effect_animation.find_hit_spot()
			hell_effect_animation_support.play("shoot_arrow")
			await get_tree().create_timer(.5).timeout
			hell_effect_animation.play("shoot_explosion")
			HeavenSounds.HEAVEN_SHOOT.play()
			
		
		3:
			print_debug(str(heavenstats.character_name) + " used  " + str(ID_2_heaven_skill_name) + " on " + str(clownstats.character_name) + " (" + str(heavenstats.current_tempo) + " tempo)" )
			#enemy_effect_animation_support.find_hit_spot()
			battle_effect_manager_FS_support.play("heaven_shoot_arrow")
			await get_tree().create_timer(.5).timeout
			#enemy_effect_animation.find_hit_spot()
			damage_calc.heaven_to_clown_deviltry_damagecalc()
			battle_effect_manager_FS.play("heaven_shoot_explosion")
			HeavenSounds.HEAVEN_SHOOT.play()
	
func skill_ID_3_heaven():
	heaven_switch_turn_animation_buffer = ID_3_heaven_animation_buffer
	#heavenstats.convert_tempo(ID_3_heaven_tempo)
	heavenstats.current_skill_used = ID_3_heaven_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_USED_SKILL")
	await get_tree().create_timer(1).timeout

	heavenstats.subtract_magia(ID_3_heaven_cost_1)
	heaven_effect_animation.find_effect_spot()
	heaven_effect_animation.play("magia_use")
	HeavenSounds.HEAVEN_MAGIA_USE.play()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_SPENDS_OWN_MAGIA")
	
	
	await get_tree().create_timer(.1).timeout
	
	battle_effect_manager_FS_behind.play("heaven_thought_test")
	HeavenSounds.HEAVEN_BUBBLE.play()
	
	await get_tree().create_timer(.3).timeout
	
	HeavenSounds.HEAVEN_BUBBLE_POP.play()
	
	await get_tree().create_timer(1).timeout
	
	#heaven_effect_animation.find_effect_spot()
	heavenstats.add_malice(ID_3_heaven_increase_1)
	heaven_effect_animation.play("basic_buff")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_INCREASED_OWN_MALICE")
	HeavenSounds.HEAVEN_BUFF.play()
	
	skill_effect_wear_off_set.emit()
	

func skill_ID_4_heaven():
	heaven_switch_turn_animation_buffer = ID_4_heaven_animation_buffer
	heavenstats.current_skill_used = ID_4_heaven_skill_name
	print_debug(heavenstats.character_name + " used " + ID_4_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	heavenstats.current_stat_change = ID_4_heaven_cost_1
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_USED_SKILL")
	await get_tree().create_timer(1).timeout
	heavenstats.subtract_magia(ID_4_heaven_cost_1)
	heaven_effect_animation.find_effect_spot()
	heaven_effect_animation.play("magia_use")
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_SPENDS_OWN_MAGIA")
	HeavenSounds.HEAVEN_MAGIA_USE.play()
	
	await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout

	#heaven_effect_animation.find_effect_spot()
	heaven_effect_animation.play("basic_heal")
	HeavenSounds.HEAVEN_HEAL.play()
	heavenstats.add_heart(ID_4_heaven_increase_1)
	heavenstats.current_stat_change = ID_4_heaven_increase_1
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_HEALS_OWN_HEART")

func skill_ID_5_heaven():
	heaven_switch_turn_animation_buffer = ID_5_heaven_animation_buffer
	heavenstats.current_skill_used = ID_5_heaven_skill_name
	#heavenstats.convert_tempo(ID_5_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_5_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	heavenstats.subtract_heart(ID_5_heaven_cost_1)
	heaven_effect_animation.find_hit_spot()
	heaven_effect_animation.play("basic_slash")
	HeavenSounds.HEAVEN_SLASH.play()
	
	#await get_tree().create_timer(.5).timeout
	#
	#
	#heaven_effect_animation.find_effect_spot()
	#heaven_effect_animation.play("magia_use")
	#HeavenSounds.HEAVEN_MAGIA_USE.play()
	#
	
	await get_tree().create_timer(1).timeout
	
	hellstats.add_magia(ID_5_heaven_increase_1)
	hellstats.add_deviltry(ID_5_heaven_increase_2)
	hellstats.add_malice(ID_5_heaven_increase_3)
	
	hell_effect_animation.find_effect_spot()
	hell_effect_animation.play("magia_use")
	HellSounds.HELL_MAGIA_REGEN.play()
	await get_tree().create_timer(1).timeout
	hell_effect_animation.play("basic_buff")
	HellSounds.HELL_BUFF.play()
	await get_tree().create_timer(1).timeout
	hell_effect_animation.play("basic_buff")
	HellSounds.HELL_BUFF.play()
	
	skill_effect_wear_off_set.emit()
	
func skill_ID_6_heaven():
	heaven_switch_turn_animation_buffer = ID_6_heaven_animation_buffer
	heavenstats.current_skill_used = ID_6_heaven_skill_name
	var skill_ID_6_cost = heavenstats.max_magia * ID_6_heaven_percent_decrease_1
	
	#heavenstats.convert_tempo(ID_6_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_6_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	heavenstats.subtract_magia(skill_ID_6_cost)
	heaven_effect_animation.find_effect_spot()
	heaven_effect_animation.play("magia_use")
	
	status_effects.holy_swords_set()

func skill_ID_7_heaven():
	heaven_switch_turn_animation_buffer = ID_7_heaven_animation_buffer
	heavenstats.current_skill_used = ID_7_heaven_skill_name
	var rand_choice = [1,2].pick_random()
	var num = [0, 0, 0, 9].pick_random()
	
	
	heavenstats.convert_tempo(ID_7_heaven_tempo + num)
	print_debug(heavenstats.character_name + " used " + ID_7_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	match rand_choice:
		1:
			hellstats.subtract_deviltry(ID_7_heaven_increase_1)
			hell_effect_animation.find_effect_spot()
			hell_effect_animation.play("basic_debuff")
			
			await get_tree().create_timer(.1).timeout
			
			heavenstats.add_malice(ID_7_heaven_increase_1)
			heaven_effect_animation.find_effect_spot()
			heaven_effect_animation.play("basic_buff")
			
		2:
			heavenstats.subtract_deviltry(ID_7_heaven_increase_1)
			heaven_effect_animation.find_effect_spot()
			heaven_effect_animation.play("basic_debuff")
			
			await get_tree().create_timer(.1).timeout
			
			hellstats.add_malice(ID_7_heaven_increase_1)
			hell_effect_animation.find_effect_spot()
			hell_effect_animation.play("basic_buff")
func skill_ID_8_heaven():
	#make this one last bc its kinda hard, but its the one thats basically tailwind from pokemon
	pass
	
func skill_ID_9_heaven():
	heaven_switch_turn_animation_buffer = ID_9_heaven_animation_buffer
	heavenstats.current_skill_used = ID_9_heaven_skill_name
	heavenstats.convert_tempo(ID_9_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_9_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	match heaven_target_ID:
		
		2:
			
			damage_calc.heaven_to_hell_malice_damagecalc()
			hell_effect_animation.find_effect_spot()
			hell_effect_animation.play("basic_slash")
			
			await get_tree().create_timer(.1).timeout
			
			heavenstats.add_magia(damage_calc.heaven_to_hell_malice_damagecalc().total_damage)
			heaven_effect_animation.find_hit_spot()
			heaven_effect_animation.play("magia_regain")
			
		3:
			damage_calc.heaven_to_clown_malice_damagecalc()
			enemy_effect_animation.find_hit_spot()
			enemy_effect_animation.play("basic_slash")
			
			await get_tree().create_timer(.1).timeout
			
			hellstats.add_magia(damage_calc.heaven_to_clown_malice_damagecalc().total_damage)
			hell_effect_animation.find_effect_spot()
			hell_effect_animation.play("magia_regain")

func skill_ID_10_heaven():
	heaven_switch_turn_animation_buffer = ID_10_heaven_animation_buffer
	### BE SURE TO MAKE THE SKILL POWER FOR THESE RANGES EQUALLY SPACED APART, 1 IS WEAKEST, 3 IS STRONGEST
	heavenstats.current_skill_used = ID_10_heaven_skill_name
	var stage
	heavenstats.convert_tempo(ID_10_heaven_tempo)
	print_debug(heavenstats.character_name + " used " + ID_10_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	if heavenstats.current_magia <= (heavenstats.max_magia * .75):
		stage = 2
		heavenstats.convert_skill_power(ID_10_heaven_power_2)
	if heavenstats.current_magia <= (heavenstats.max_magia * .50):
		stage = 1
	else:
		stage = 3
		heavenstats.convert_skill_power(ID_10_heaven_power_3)
	
	heavenstats.subtract_magia(heavenstats.current_magia)
	heaven_effect_animation.find_effect_spot()
	heaven_effect_animation.play("magia_use")
	match heaven_target_ID:
		2:
			match stage:
				1:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_1)
					damage_calc.heaven_to_hell_malice_damagecalc()
					
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_10_heaven_decrease_1)
						2:
							hellstats.multiply_deviltry(ID_10_heaven_percent_decrease_1)
						3:
							hellstats.multiply_malice(ID_10_heaven_percent_decrease_1)
					hell_effect_animation.play("basic_debuff")
				2:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_2)
					damage_calc.heaven_to_hell_malice_damagecalc()
					
					hell_effect_animation.find_effect_spot()
					hell_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_10_heaven_decrease_2)
						2:
							hellstats.multiply_deviltry(ID_10_heaven_percent_decrease_2)
						3:
							hellstats.multiply_malice(ID_10_heaven_percent_decrease_2)
					hell_effect_animation.play("basic_debuff")
				3:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_3)
					damage_calc.heaven_to_hell_malice_damagecalc()
					
					hell_effect_animation.find_effect_spot()
					hell_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.subtract_guts(ID_10_heaven_decrease_3)
						2:
							hellstats.multiply_deviltry(ID_10_heaven_percent_decrease_3)
						3:
							hellstats.multiply_malice(ID_10_heaven_percent_decrease_3)
					hell_effect_animation.play("basic_debuff")
		3:
			match stage:
				1:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_1)
					damage_calc.heaven_to_clown_malice_damagecalc()
					
					enemy_effect_animation.find_effect_spot()
					enemy_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_10_heaven_decrease_1)
						2:
							clownstats.multiply_deviltry(ID_10_heaven_percent_decrease_1)
						3:
							clownstats.multiply_malice(ID_10_heaven_percent_decrease_1)
					enemy_effect_animation.play("basic_debuff")
				2:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_2)
					damage_calc.heaven_to_clown_malice_damagecalc()
					
					enemy_effect_animation.find_hit_spot()
					enemy_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_10_heaven_decrease_2)
						2:
							clownstats.multiply_deviltry(ID_10_heaven_percent_decrease_2)
						3:
							clownstats.multiply_malice(ID_10_heaven_percent_decrease_2)
					enemy_effect_animation.play("basic_debuff")
				3:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_10_heaven_power_3)
					damage_calc.heaven_to_clown_malice_damagecalc()
					
					enemy_effect_animation.find_hit_spot()
					enemy_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout
					
					match rand_num:
						1:
							clownstats.subtract_guts(ID_10_heaven_decrease_3)
						2:
							clownstats.multiply_deviltry(ID_10_heaven_percent_decrease_3)
						3:
							clownstats.multiply_malice(ID_10_heaven_percent_decrease_3)
					enemy_effect_animation.find_effect_spot()
					enemy_effect_animation.play("basic_debuff")

func skill_ID_11_heaven():
	heaven_switch_turn_animation_buffer = ID_11_heaven_animation_buffer
	heavenstats.current_skill_used = ID_11_heaven_skill_name
	### BE SURE TO MAKE THE SKILL POWER FOR THESE RANGES EQUALLY SPACED APART, 11 IS WEAKEST, 3 IS STRONGEST
	var stage
	heavenstats.convert_tempo(ID_11_heaven_tempo)

	print_debug(heavenstats.character_name + " used " + ID_11_heaven_skill_name + " (" + str(heavenstats.current_tempo) + " tempo)" )
	
	if heavenstats.current_magia <= (heavenstats.max_magia * .75):
		stage = 2
		heavenstats.convert_skill_power(ID_11_heaven_power_2)
	if heavenstats.current_magia <= (heavenstats.max_magia * .50):
		stage = 1
	else:
		stage = 3
		heavenstats.convert_skill_power(ID_11_heaven_power_3)
	
	heavenstats.subtract_magia(heavenstats.current_magia)
	heaven_effect_animation.find_effect_spot()
	heaven_effect_animation.play("magia_use")
	
	await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout
	
	match heaven_target_ID:
		2:
			match stage:
				1:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_1)
					damage_calc.heaven_to_hell_deviltry_damagecalc()
					
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout
					
					match rand_num:
						1:
							hellstats.add_guts(ID_11_heaven_increase_1)
							heavenstats.add_guts(ID_11_heaven_increase_1)
						2:
							hellstats.multiply_deviltry(ID_11_heaven_percent_increase_1)
							heavenstats.multiply_deviltry(ID_11_heaven_percent_increase_1)
						3:
							hellstats.multiply_malice(ID_11_heaven_percent_increase_1)
							heavenstats.multiply_malice(ID_11_heaven_percent_increase_1)
					heaven_effect_animation.find_effect_spot()
					heaven_effect_animation.play("basic_buff")
					
					await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout
					
					hell_effect_animation.find_effect_spot()
					hell_effect_animation.play("basic_buff")
					
				2:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_2)
					damage_calc.heaven_to_hell_deviltry_damagecalc()
					
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout
					
					match rand_num:
						1:
							hellstats.add_guts(ID_11_heaven_increase_2)
							heavenstats.add_guts(ID_11_heaven_increase_2)
						2:
							hellstats.multiply_deviltry(ID_11_heaven_percent_increase_2)
							heavenstats.multiply_deviltry(ID_11_heaven_percent_increase_2)
						3:
							hellstats.multiply_malice(ID_11_heaven_percent_increase_2)
							heavenstats.multiply_malice(ID_11_heaven_percent_increase_2)
					heaven_effect_animation.find_effect_spot()
					hell_effect_animation.find_effect_spot()
					heaven_effect_animation.play("basic_buff")
					hell_effect_animation.play("basic_buff")
				3:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_3)
					damage_calc.heaven_to_hell_deviltry_damagecalc()
					
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout
					
					match rand_num:
						1:
							hellstats.add_guts(ID_11_heaven_increase_3)
							heavenstats.add_guts(ID_11_heaven_increase_3)
						2:
							hellstats.multiply_deviltry(ID_11_heaven_percent_increase_3)
							heavenstats.multiply_deviltry(ID_11_heaven_percent_increase_3)
						3:
							hellstats.multiply_malice(ID_11_heaven_percent_increase_3)
							heavenstats.multiply_malice(ID_11_heaven_percent_increase_3)
					heaven_effect_animation.find_effect_spot()
					hell_effect_animation.find_effect_spot()
					heaven_effect_animation.play("basic_buff")
					hell_effect_animation.play("basic_buff")
		3:
			match stage:
				1:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_1)
					damage_calc.heaven_to_clown_deviltry_damagecalc()
					
					enemy_effect_animation.find_hit_spot()
					enemy_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(heaven_effect_animation.heaven_VFX_buffer).timeout
					
					match rand_num:
						1:
							hellstats.add_guts(ID_11_heaven_increase_1)
							heavenstats.add_guts(ID_11_heaven_increase_1)
						2:
							hellstats.multiply_deviltry(ID_11_heaven_percent_increase_1)
							heavenstats.multiply_deviltry(ID_11_heaven_percent_increase_1)
						3:
							hellstats.multiply_malice(ID_11_heaven_percent_increase_1)
							heavenstats.multiply_malice(ID_11_heaven_percent_increase_1)
					heaven_effect_animation.find_effect_spot()
					hell_effect_animation.find_effect_spot()
					heaven_effect_animation.play("basic_buff")
					hell_effect_animation.play("basic_buff")
				2:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_2)
					damage_calc.heaven_to_clown_deviltry_damagecalc()
					
					enemy_effect_animation.find_hit_spot()
					enemy_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.add_guts(ID_11_heaven_increase_2)
							heavenstats.add_guts(ID_11_heaven_increase_2)
						2:
							hellstats.multiply_deviltry(ID_11_heaven_percent_increase_2)
							heavenstats.multiply_deviltry(ID_11_heaven_percent_increase_2)
						3:
							hellstats.multiply_malice(ID_11_heaven_percent_increase_2)
							heavenstats.multiply_malice(ID_11_heaven_percent_increase_2)
					heaven_effect_animation.find_effect_spot()
					hell_effect_animation.find_effect_spot()
					heaven_effect_animation.play("basic_buff")
					hell_effect_animation.play("basic_buff")
				3:
					var rand_num = [1,2,3].pick_random()
					
					heavenstats.convert_skill_power(ID_11_heaven_power_3)
					damage_calc.heaven_to_clown_deviltry_damagecalc()
					
					enemy_effect_animation.find_effect_spot()
					enemy_effect_animation.play("basic_slash")
					
					await get_tree().create_timer(.3).timeout
					
					match rand_num:
						1:
							hellstats.add_guts(ID_11_heaven_increase_3)
							heavenstats.add_guts(ID_11_heaven_increase_3)
						3:
							hellstats.multiply_deviltry(ID_11_heaven_percent_increase_3)
							heavenstats.multiply_deviltry(ID_11_heaven_percent_increase_3)
						3:
							hellstats.multiply_malice(ID_11_heaven_percent_increase_3)
							heavenstats.multiply_malice(ID_11_heaven_percent_increase_3)
					heaven_effect_animation.find_effect_spot()
					hell_effect_animation.find_effect_spot()
					heaven_effect_animation.play("basic_buff")
					hell_effect_animation.play("basic_buff")

###       HELL SKILLS
#test skill that just does damage based off of malice
func skill_ID_1_hell():
	hell_switch_turn_animation_buffer = ID_1_hell_animation_buffer
	hellstats.current_skill_used = ID_1_hell_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_USED_SKILL")
	await get_tree().create_timer(1).timeout
	print_debug(hellstats.character_name + " locked in " + ID_1_hell_skill_name + " (" + str(hellstats.current_tempo) + " tempo)" )
	hellstats.convert_skill_power(ID_1_hell_power)
	
	match hell_target_ID:
		2:
			print_debug(str(hellstats.character_name) + " used  " + str(ID_1_hell_skill_name) + " on " + str(heavenstats.character_name) + " (" + str(hellstats.current_tempo) + " tempo)" )
			damage_calc.hell_to_heaven_malice_damagecalc()
			heaven_effect_animation.find_hit_spot()
			heaven_effect_animation.play("basic_slash")
			HellSounds.HELL_SLASH.play()
		
		3:
			print_debug(str(hellstats.character_name) + " used  " + str(ID_1_hell_skill_name) + " on " + str(clownstats.character_name) + " (" + str(hellstats.current_tempo) + " tempo)" )
			damage_calc.hell_to_clown_malice_damagecalc()
			enemy_effect_animation.find_hit_spot()
			enemy_effect_animation.play("basic_slash")
			HellSounds.HELL_SLASH.play()

#test skill that just does damage based off of deviltry, but spends a little magia bar
func skill_ID_2_hell():
	hell_switch_turn_animation_buffer = ID_2_hell_animation_buffer
	hellstats.current_skill_used = ID_2_hell_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_USED_SKILL")
	print_debug(hellstats.character_name + " locked in " + ID_2_hell_skill_name + " (" + str(hellstats.current_tempo) + " tempo)" )
	hellstats.convert_skill_power(ID_2_hell_power)
	
	hellstats.subtract_magia(ID_2_hell_cost_1)
	hell_effect_animation.find_effect_spot()
	hell_effect_animation.play("magia_use")
	HellSounds.HELL_MAGIA_USE.play()
	
	await get_tree().create_timer(hell_effect_animation.hell_VFX_buffer).timeout
	
	match hell_target_ID:
		2:
			print_debug(str(hellstats.character_name) + " used  " + str(ID_2_hell_skill_name) + " on " + str(clownstats.character_name) + " (" + str(hellstats.current_tempo) + " tempo)" )
			
			battle_effect_manager_FS_support.play("hell_shoot_arrow")
			await get_tree().create_timer(.5).timeout
			
			damage_calc.hell_to_heaven_deviltry_damagecalc()
			battle_effect_manager_FS.play("hell_shoot_explosion")
			HellSounds.HELL_SHOOT.play()
		
		3:
			print_debug(str(hellstats.character_name) + " used  " + str(ID_2_hell_skill_name) + " on " + str(clownstats.character_name) + " (" + str(hellstats.current_tempo) + " tempo)" )
			
			battle_effect_manager_FS_support.play("hell_shoot_arrow")
			await get_tree().create_timer(.5).timeout
			
			damage_calc.hell_to_clown_deviltry_damagecalc()
			battle_effect_manager_FS.play("hell_shoot_explosion")
			HellSounds.HELL_SHOOT.play()
	
func skill_ID_3_hell():
	hell_switch_turn_animation_buffer = ID_3_hell_animation_buffer
	hellstats.current_skill_used = ID_3_hell_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_USED_SKILL")
	
	print_debug(hellstats.character_name + " locked in " + ID_2_hell_skill_name + " (" + str(hellstats.current_tempo) + " tempo)" )
	hellstats.subtract_magia(ID_3_hell_cost_1)
	hell_effect_animation.find_effect_spot()
	hell_effect_animation.play("magia_use")
	HellSounds.HELL_MAGIA_USE.play()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_SPENDS_OWN_MAGIA")
	
	await get_tree().create_timer(.1).timeout
	
	battle_effect_manager_FS_behind.play("hell_thought_test")
	HellSounds.HELL_BUBBLE.play()
	await get_tree().create_timer(.3).timeout
	HellSounds.HELL_BUBBLE_POP.play()
	
	
	await get_tree().create_timer(1).timeout
	

	#hellstats.current_stat_changed = ID_3_hell_increase_1
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_INCREASED_OWN_DEVILTRY")
	hellstats.add_deviltry(ID_3_hell_increase_1)
	hell_effect_animation.play("basic_buff")
	HellSounds.HELL_BUFF.play()
	
	
	hell_ID_3_wear_off_set.emit()

func skill_ID_4_hell():
	hell_switch_turn_animation_buffer = ID_4_hell_animation_buffer
	hellstats.current_skill_used = ID_4_hell_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_USED_SKILL")
	
	print_debug(hellstats.character_name + "locked in " + ID_4_hell_skill_name + " (" + str(hellstats.current_tempo) + "tempo)")
	hellstats.subtract_heart(ID_4_hell_cost_1)
	hell_effect_animation.find_hit_spot()
	hell_effect_animation.play("basic_slash")
	HellSounds.HELL_SLASH.play()
	
	await get_tree().create_timer(.3).timeout
	
	hell_effect_animation.find_effect_spot()
	hellstats.add_magia(ID_4_hell_increase_1)
	hell_effect_animation.play("magia_replenish")
	HellSounds.HELL_MAGIA_REGEN.play()
	
	

	## potentially in the future, change this to be a chance based skill that selects either heaven or hell to take self damage
	## possibly extend that to the buff to deviltry or malice, either that is random also OR it depends on who the self damage targets
	## seems interesting, if not just a good way to make this skill feel different 
func skill_ID_5_hell():
	hell_switch_turn_animation_buffer = ID_5_hell_animation_buffer
	hellstats.current_skill_used = ID_5_hell_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_USED_SKILL")
	
	print_debug(hellstats.character_name + "locked in " + ID_5_hell_skill_name)
	hellstats.subtract_heart(ID_5_hell_cost_1)
	heavenstats.subtract_heart(ID_5_hell_cost_2) #HEAVEN COST IS MORE THAN HELL
	hell_effect_animation.find_effect_spot()
	hell_effect_animation.play("basic_slash")
	HellSounds.HELL_SLASH.play()
	
	await get_tree().create_timer(.3).timeout
	heaven_effect_animation.find_hit_spot()
	hell_effect_animation.play("basic_slash")
	HellSounds.HELL_SLASH.play()
	
	
	hell_effect_animation.find_effect_spot()
	hell_effect_animation.play("basic_buff")
	HellSounds.HELL_BUFF.play()
	hellstats.multiply_deviltry(ID_5_hell_percent_increase_1) ##INCREASE BY 15% 
	hellstats.multiply_malice(ID_5_hell_percent_increase_1) ##INCREASE BY 15%
	
	

	#skill that decreases the target's guts at the cost of user's guts. 
func skill_ID_6_hell():
	hell_switch_turn_animation_buffer = ID_6_hell_animation_buffer
	hellstats.current_skill_used = ID_6_hell_skill_name
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_USED_SKILL")
	
	print_debug(hellstats.character_name + "locked in " + ID_6_hell_skill_name)
	hellstats.subtract_guts(ID_5_hell_decrease_1) ##KEEP THIS LOWER THAN TARGET DECREASE
	hell_effect_animation.find_effect_spot()
	hell_effect_animation.play("basic_debuff")
	HellSounds.HELL_DEBUFF.play()
	await get_tree().create_timer(.3).timeout
	
	match hell_target_ID:
		
		2:
			heavenstats.subtract_guts(ID_5_hell_decrease_2) ## !!!! KEEP THIS HIGHER THAN USER DECREASE (this should be about 1.35x the user decrease)
			heaven_effect_animation.find_hit_spot()
			heaven_effect_animation.play("basic_debuff")
			HellSounds.HELL_DEBUFF.play()
			await get_tree().create_timer(.3).timeout
		
		3:
			clownstats.subtract_guts(ID_5_hell_decrease_2) ## !!!! KEEP THIS HIGHER THAN USER DECREASE (this should be about 1.35x the user decrease)
			enemy_effect_animation.find_hit_spot()
			enemy_effect_animation.play("basic_debuff")
			HellSounds.HELL_DEBUFF.play()
			await get_tree().create_timer(.3).timeout
	

	#skill that does burst damage based off of total offensive stat, decreases chosen stat by some small percentage
func skill_ID_7_hell():
	hell_switch_turn_animation_buffer = ID_7_hell_animation_buffer
	print_debug(hellstats.character_name + "locked in " + ID_6_hell_skill_name)
	
	
	
func skill_ID_1_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_1_heaven_tempo)
func skill_ID_2_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_2_heaven_tempo)
func skill_ID_3_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_3_heaven_tempo)
func skill_ID_4_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_4_heaven_tempo)
func skill_ID_5_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_5_heaven_tempo)
func skill_ID_6_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_6_heaven_tempo)
func skill_ID_7_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_7_heaven_tempo)
func skill_ID_8_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_8_heaven_tempo)
func skill_ID_10_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_10_heaven_tempo)
func skill_ID_11_heaven_tempo_convert():
	heavenstats.convert_tempo(ID_11_heaven_tempo)
	
func skill_ID_1_hell_tempo_convert():
	hellstats.convert_tempo(ID_1_hell_tempo)
func skill_ID_2_hell_tempo_convert():
	hellstats.convert_tempo(ID_2_hell_tempo)
func skill_ID_3_hell_tempo_convert():
	hellstats.convert_tempo(ID_3_hell_tempo)
func skill_ID_4_hell_tempo_convert():
	hellstats.convert_tempo(ID_4_hell_tempo)
func skill_ID_5_hell_tempo_convert():
	hellstats.convert_tempo(ID_5_hell_tempo)
func skill_ID_6_hell_tempo_convert():
	hellstats.convert_tempo(ID_6_hell_tempo)
#func skill_ID_7_hell_tempo_convert():
	#hellstats.convert_tempo(ID_7_hell_tempo)
#func skill_ID_8_hell_tempo_convert():
	#hellstats.convert_tempo(ID_8_hell_tempo)
#func skill_ID_9_hell_tempo_convert():
	#hellstats.convert_tempo(ID_9_hell_tempo)
#func skill_ID_10_hell_tempo_convert():
	#hellstats.convert_tempo(ID_10_hell_tempo)
#func skill_ID_11_hell_tempo_convert():
	#hellstats.convert_tempo(ID_11_hell_tempo)
	
