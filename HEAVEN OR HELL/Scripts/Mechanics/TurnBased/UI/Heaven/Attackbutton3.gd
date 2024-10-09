extends TextureButton
signal hell_action_commited

var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")
var heavenstats = ResourceLoader.load("res://Resources/Stats/HeavenStats.tres")
var clownstats = ResourceLoader.load("res://Resources/Stats/ClownStats.tres")
@onready var skills = $"../../../../SkillManager"

@export var skill_tempo: int
@export var damage_dealt: int
@export var skill_cost: int

func _on_pressed():
	hellstats.convert_tempo(skill_tempo)
	hell_action_commited.emit()

#test skill that deals extra damage but takes away magia bar
func skill_effect():
	if hellstats.current_magia > skill_cost:
		clownstats.subtract_heart(damage_dealt)
		hellstats.subtract_magia(skill_cost)
		
		effect_animation.find_effect_spot_enemy()
		effect_animation.play("basic_heal")
		
		StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
		StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
		StatSaver.save_heavenstats_to_file("res://Resources/Stats/ClownStats.tres")
	else: 
		hellstats.subtract_heart(1)
		hellstats.add_magia(1)
