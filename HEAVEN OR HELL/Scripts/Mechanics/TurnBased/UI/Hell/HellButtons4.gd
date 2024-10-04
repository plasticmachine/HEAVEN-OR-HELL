extends TextureButton
signal hell_action_commited

var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")
var heavenstats = ResourceLoader.load("res://Resources/Stats/HeavenStats.tres")
var clownstats = ResourceLoader.load("res://Resources/Stats/ClownStats.tres")
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"

@export var skill_tempo: float


func _on_pressed():
	hellstats.convert_tempo(skill_tempo)
	hell_action_commited.emit()

#test skill that deals massive damage but completely drains the magia bar of hell
func skill_effect():
	
	effect_animation.find_effect_spot_enemy()
	effect_animation.play("basic_slash")
	clownstats.subtract_heart(hellstats.current_magia)
	
	hellstats.subtract_magia(hellstats.current_magia)
	
	effect_animation.find_effect_spot_hell()
	effect_animation.play_backwards("basic_heal")
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/ClownStats.tres")
