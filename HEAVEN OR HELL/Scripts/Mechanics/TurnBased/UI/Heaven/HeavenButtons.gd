extends TextureButton
signal heaven_action_commited

var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var effect_animation = $"../../../../BattleEffectManagerPosition/BattleEffectManager"
@onready var skills = $"res://Scripts/Mechanics/TurnBased/Skills/Skills.gd"

@export var skill_tempo: int = 5
@export var percent_heal: float
@export var skill_cost: int

func _on_pressed():
	heavenstats.convert_tempo(skill_tempo)
	heaven_action_commited.emit()

#test skill that heals some percentage of heaven's HP
func skill_effect():
	
	#TO BE MADE
	skills.define_skill_slot_one()
	
	heavenstats.subtract_magia(skill_cost)
	heavenstats.add_heart(heavenstats.current_heart * percent_heal)
	effect_animation.find_effect_spot_heaven()
	effect_animation.play("basic_heal")
	
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
	StatSaver.save_clownstats_to_file("res://Resources/Stats/Clown.tres")
