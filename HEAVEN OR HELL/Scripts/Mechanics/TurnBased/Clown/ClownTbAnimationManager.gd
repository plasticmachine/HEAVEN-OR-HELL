extends Node2D
signal action_committed

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")

@onready var turnbased_manager = $"../../../.."
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"

@onready var tempo_skill_1: int
@onready var tempo_skill_2: int
@onready var tempo_skill_3: int
@onready var tempo_skill_4: int
@onready var tempo_skill_5: int
@onready var tempo_skill_6: int
@onready var tempo_skill_7: int
@onready var tempo_skill_8: int
@onready var tempo_skill_9: int
@onready var tempo_skill_10: int

@onready var skill_1_damage: int
@onready var skill_2_heal: int
@onready var skill_2_malice_buff: int
@onready var skill_2_deviltry_buff: int
@onready var skill_3_damage: int
@onready var skill_4_damage: int
@onready var skill_5_damage: int
@onready var skill_6_damage: int
@onready var skill_7_damage: int
@onready var skill_8_damage: int

func _on_first_action_committed() -> void:
	if turnbased_manager.turn_queue_amount == 1:
		action_committed.emit()

#test skill that just randomly does damage to heaven or hell
func skill_1_effect():
	var num = [1,2].pick_random()
	clownstats.convert_tempo(tempo_skill_1)
	
	match num:
		1:
			effect_animation.find_attack_spot_heaven()
			effect_animation.play("basic_slash")
			heavenstats.subtract_heart(skill_1_damage)
		2:
			effect_animation.find_attack_spot_hell()
			effect_animation.play("basic_slash")
			hellstats.subtract_heart(skill_1_damage)
			
func skill_2_effect():
	var num = [1,2,3].pick_random()
	clownstats.convert_tempo(tempo_skill_2)
		
	
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
