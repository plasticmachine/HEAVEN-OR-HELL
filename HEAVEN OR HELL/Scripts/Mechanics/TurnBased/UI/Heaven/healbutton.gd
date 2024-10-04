extends TextureButton
signal heaven_action_commited

var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"

@export var skill_tempo: int = 5
@export var percent_heal: float
@export var percent_regen: float

func _on_pressed():
	heavenstats.convert_tempo(skill_tempo)
	heaven_action_commited.emit()

#test skill that sacrifices heaven's heart to regen hell's heart and magia
func skill_effect():
	effect_animation.find_effect_spot_heaven()
	effect_animation.play("basic_slash")
	heavenstats.subtract_heart(heavenstats.max_heart * percent_heal)
	
	effect_animation.find_effect_spot_hell()
	effect_animation.play("basic_heal")
	hellstats.add_heart(hellstats.max_heart * percent_heal)
	hellstats.add_magia(hellstats.max_magia * percent_regen)

	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
	
