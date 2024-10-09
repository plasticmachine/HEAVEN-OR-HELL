extends TextureButton
signal heaven_action_commited

var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")
var heavenstats = ResourceLoader.load("res://Resources/Stats/HeavenStats.tres")
var clownstats = ResourceLoader.load("res://Resources/Stats/ClownStats.tres")
@onready var skills = $"../../../../SkillManager"

@export var skill_tempo: int = 5
@export var percent_heal: float
@export var skill_cost: int

func _on_pressed():
	heaven_action_commited.emit()

#test skill that heals some percentage of heaven's HP
func skill_effect():
	
	#TO BE MADE
	skills.define_skill_slot_1_heaven()
