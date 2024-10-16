extends Node2D
signal action_committed

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")

@onready var damagecalc = $"../../../../DamageCalculation"
@onready var turnbased_manager = $"../../../.."
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"
@onready var clownskill: int


@export_group("Skill_1")
@export var skill_1_name: String
@export var skill_1_tempo: int
@export var skill_1_power: int


@export_group("Skill_2")
@export var skill_2_tempo: int
@export var skill_2_heal: int
@export var skill_2_malice_buff: int
@export var skill_2_deviltry_buff: int

@export_group("Skill_3")
@export var skill_3_tempo: int
@export var skill_3_power: int

@export_group("Skill_4")
@export var skill_4_tempo: int
@export var skill_4_power: int
@export_group("Skill_5")
@export var skill_5_tempo: int
@export var skill_5_power: int
@export_group("Skill_6")
@export var skill_6_tempo: int
@export var skill_6_power: int
@export_group("Skill_7")
@export var skill_7_tempo: int
@export var skill_7_power: int
@export_group("Skill_8")
@export var skill_8_tempo: int
@export var skill_8_power: int
@export_group("Skill_9")
@export var skill_9_tempo: int
@export_group("Skill_10")
@export var skill_10_tempo: int


func _on_first_action_committed() -> void:
	var phase_1_threshold = clownstats.max_heart * .75
	var phase_2_threshold = clownstats.max_heart * .50
	var phase_3_threshold = clownstats.max_heart * .25
	var phase_4_threshold = clownstats.max_heart * .15
	
	if turnbased_manager.turn_queue_amount == 1 and heavenstats.current_heart > 0 and hellstats.current_heart > 0:
		if clownstats.current_heart >= phase_1_threshold:
			var num = [1,1,2].pick_random()
			match num:
				1:
					clownskill = 1
					print_debug("clown used skill 1")
				2:
					clownskill = 2
					print_debug("clown used skill 2")
		if clownstats.current_heart <= phase_2_threshold:
			var num = [3,4,5,6].pick_random()
			match num:
				3:
					clownskill = 3
				4: 
					clownskill = 4
				5: 
					clownskill = 5
				6:
					clownskill = 6
		if clownstats.current_heart <= phase_3_threshold:
			var num = [5,6,7,8,9,10].pick_random()
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
			var num = [9,10].pick_random()
			match num:
				9:
					clownskill = 9
				10:
					clownskill = 10

		action_committed.emit()





#test skill that just randomly does power to heaven or hell
func skill_1_effect():
	var num = [1,2].pick_random()
	clownstats.convert_tempo(skill_1_tempo)
	clownstats.convert_skill_power(skill_1_power)
	
	match num:
		1:
			damagecalc.clown_to_heaven_malice_damagecalc()
			effect_animation.find_attack_spot_heaven()
			effect_animation.play("basic_slash")
		2:
			damagecalc.clown_to_heaven_malice_damagecalc()
			effect_animation.find_attack_spot_hell()
			effect_animation.play("basic_slash")
			
func skill_2_effect():
	clownskill = 2
	var num = [1,2,3].pick_random()
	clownstats.convert_tempo(skill_2_tempo)
		
	
	match num:
		1:
			effect_animation.find_effect_spot_enemy()
			effect_animation.play("basic_heal")
			clownstats.add_heart(skill_2_heal)
		2:
			effect_animation.find_effect_spot_enemy()
			effect_animation.play("basic_heal")
			clownstats.add_malice(skill_2_malice_buff)
		3:
			effect_animation.find_effect_spot_enemy()
			effect_animation.play("basic_heal")
			clownstats.add_deviltry(skill_2_deviltry_buff)
