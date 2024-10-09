extends TextureButton
signal heaven_action_commited

var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
var hellstats = preload("res://Resources/Stats/HellStats.tres")
var clownstats = preload("res://Resources/Stats/ClownStats.tres")
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"

@export var skill_tempo: int = 5
@export var damage_dealt: int




func _on_pressed():
	heavenstats.convert_tempo(skill_tempo)
	heaven_action_commited.emit()
	

#test skill that deals damage to the boss
func skill_effect():
	effect_animation.find_attack_spot_heaven()
	effect_animation.play("basic_heal")
	heavenstats.add_heart(50)
	
	effect_animation.find_attack_spot_hell()
	effect_animation.play("basic_heal")
	hellstats.add_heart(50)
