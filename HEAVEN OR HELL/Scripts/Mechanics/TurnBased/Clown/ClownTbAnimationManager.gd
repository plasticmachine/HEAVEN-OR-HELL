extends Node2D
signal action_committed

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")

@onready var damagecalc = $"../../../../DamageCalculation"
@onready var turnbased_manager = $"../../../.."
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"
@onready var clownskill: int
@onready var clownTB_animation = $AnimationTree

@export_group("Skill_1")
@export var skill_1_name: String
@export var skill_1_tempo: int
@export var skill_1_power: int


@export_group("Skill_2")
@export var skill_2_name: String
@export var skill_2_tempo: int
@export var skill_2_heal: int
@export var skill_2_malice_buff: int
@export var skill_2_deviltry_buff: int

@export_group("Skill_3")
@export var skill_3_name: String
@export var skill_3_tempo: int
@export var skill_3_power: int

@export_group("Skill_4")
@export var skill_4_name: String
@export var skill_4_tempo: int
@export var skill_4_power: int
@export_group("Skill_5")
@export var skill_5_name: String
@export var skill_5_tempo: int
@export var skill_5_power: int
@export_group("Skill_6")
@export var skill_6_name: String
@export var skill_6_tempo: int
@export var skill_6_power: int
@export_group("Skill_7")
@export var skill_7_name: String
@export var skill_7_tempo: int
@export var skill_7_power: int
@export_group("Skill_8")
@export var skill_8_name: String
@export var skill_8_tempo: int
@export var skill_8_power: int
@export_group("Skill_9")
@export var skill_9_name: String
@export var skill_9_tempo: int
@export var skill_9_power: int
@export_group("Skill_10")
@export var skill_10_name: String
@export var skill_10_tempo: int
@export var skill_10_power: int

func _on_first_action_committed() -> void:
	var phase_1_threshold = clownstats.max_heart * .75
	var phase_2_threshold = clownstats.max_heart * .50
	var phase_3_threshold = clownstats.max_heart * .25
	var phase_4_threshold = clownstats.max_heart * .15
	
	if turnbased_manager.turn_queue_amount == 1 and heavenstats.current_heart > 0 and hellstats.current_heart > 0:
		if clownstats.current_heart >= phase_1_threshold:
			var num = [2,2].pick_random()
			match num:
				1:
					clownskill = 1
					clownstats.convert_tempo(skill_1_tempo)
					print_debug("clown is preparing " + skill_1_name + " (ID: 01)")
				2:
					clownskill = 2
					clownstats.convert_tempo(skill_2_tempo)
					print_debug("clown is preparing " + skill_2_name + " (ID: 02)")
		if clownstats.current_heart <= phase_2_threshold:
			var num = [3,4,5,6].pick_random()
			clownTB_animation.set("parameters/conditions/PHASE2", true)
			match num:
				3:
					clownskill = 3
					print_debug(("clown is preparing skill 3"))
				4: 
					clownskill = 4
				5: 
					clownskill = 5
				6:
					clownskill = 6
		if clownstats.current_heart <= phase_3_threshold:
			var num = [5,6,7,8,9,10].pick_random()
			clownTB_animation.set("parameters/conditions/PHASE2", false)
			clownTB_animation.set("parameters/conditions/PHASE3", true)
			match num:
				5:
					clownskill = 3
				4: 
					clownskill = 4
				5: 
					clownskill = 5
				6:
					clownskill = 6
				7:
					clownskill = 7
				8: 
					clownskill = 8
		if clownstats.current_heart <= phase_4_threshold:
			clownTB_animation.set("parameters/conditions/PHASE3", false)
			clownTB_animation.set("parameters/conditions/PHASE4", true)
			
			var num = [9,10].pick_random()
			match num:
				9:
					clownskill = 9
				10:
					clownskill = 10

		action_committed.emit()





#test skill that just randomly does damage to heaven or hell
func skill_1_effect():
	var num = [1,2].pick_random()
	#clownstats.convert_tempo(skill_1_tempo)
	clownstats.convert_skill_power(skill_1_power)
	
	clownTB_animation.set("parameters/conditions/THROW", true)
	await get_tree().create_timer(1).timeout
	
	match num:
		1:
			damagecalc.clown_to_heaven_malice_damagecalc()
			effect_animation.find_attack_spot_heaven()
			effect_animation.play("basic_slash")
		2:
			damagecalc.clown_to_hell_malice_damagecalc()
			effect_animation.find_attack_spot_hell()
			effect_animation.play("basic_slash")
	
	clownTB_animation.set("parameters/conditions/THROW", false)
func skill_2_effect():
	clownskill = 2
	var num = [2,2,2].pick_random()
	#clownstats.convert_tempo(skill_2_tempo)
	
	clownTB_animation.set("parameters/conditions/BUFF1", true)
	
	await get_tree().create_timer(1).timeout

	match num:
		1:
			effect_animation.find_effect_spot_enemy()
			effect_animation.play("basic_heal")
			clownstats.add_heart(skill_2_heal)
		2:
			effect_animation.find_effect_spot_enemy()
			effect_animation.play("basic_buff")
			clownstats.add_malice(skill_2_malice_buff)
		3:
			effect_animation.find_effect_spot_enemy()
			effect_animation.play("basic_buff")
			clownstats.add_deviltry(skill_2_deviltry_buff)
	clownTB_animation.set("parameters/conditions/BUFF1", false)

func skill_3_effect():
	clownskill = 3
	var rand_target = [1,2]
	#clownstats.convert_tempo(skill_3_tempo)
	clownstats.convert_skill_power(skill_3_power)
