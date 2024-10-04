extends TextureButton
signal heaven_action_commited

var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
var clownstats = preload("res://Resources/Stats/ClownStats.tres")
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"

@export var skill_tempo: int = 5
@export var damage_dealt: int




func _on_pressed():
	heavenstats.convert_tempo(skill_tempo)
	heaven_action_commited.emit()

#test skill that deals damage to the boss
func skill_effect():
	clownstats.subtract_heart(damage_dealt)
	effect_animation.find_attack_spot_enemy()
	effect_animation.play("basic_slash")
	
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
	StatSaver.save_clownstats_to_file("res://Resources/Stats/HeavenStats.tres")
