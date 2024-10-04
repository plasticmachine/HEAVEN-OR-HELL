extends TextureButton
signal heaven_action_commited

var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
var hellstats = preload("res://Resources/Stats/HellStats.tres")
var clownstats = preload("res://Resources/Stats/ClownStats.tres")
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"

@export var skill_tempo: int = 5
#@export var percent_heal: float
#@export var percent_regen: float

func _on_pressed():
	heavenstats.convert_tempo(skill_tempo)
	heaven_action_commited.emit()

#test skill that deals massive damage, but cut's hell's life in half (damage based on the amount of health hell had before it was cut in half) / heal that much for yourself / 2
func skill_effect():
	
	clownstats.subtract_heart(hellstats.current_heart)
	effect_animation.find_effect_spot_enemy()
	effect_animation.play("basic_slash")
	
	heavenstats.add_heart(hellstats.current_heart / 2)
	effect_animation.find_effect_spot_heaven()
	effect_animation.play("basic_heal")
	
	hellstats.divide_heart(2)
	effect_animation.find_effect_spot_hell()
	effect_animation.play("basic_slash")
	
	


	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/ClownStats.tres")
