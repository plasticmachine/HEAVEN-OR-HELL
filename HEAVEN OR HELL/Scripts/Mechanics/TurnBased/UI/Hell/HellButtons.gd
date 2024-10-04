extends TextureButton
signal hell_action_commited

var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")
var heavenstats = ResourceLoader.load("res://Resources/Stats/HeavenStats.tres")
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"

@export var skill_tempo: int
@export var skill_cost: int
@export var percent_heal: float

func _on_pressed():
	hellstats.convert_tempo(skill_tempo)
	hell_action_commited.emit()

#test skill that heals 25% of total health (1 is 100%)
func skill_effect():
	
	hellstats.subtract_magia(skill_cost)
	hellstats.add_heart(hellstats.current_heart * percent_heal)
	effect_animation.find_effect_spot_hell()
	effect_animation.play("basic_heal")
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
