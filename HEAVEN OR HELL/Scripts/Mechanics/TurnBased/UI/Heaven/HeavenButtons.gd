extends TextureButton
signal heaven_action_commited

@onready var skills = $"../../../../SkillManager"

var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
func _on_pressed():
	heaven_action_commited.emit()
	match skills.skill_slot_1_skill_heaven:
		1:
			skills.skill_ID_1_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		2:
			skills.skill_ID_2_heaven_tempo_convert()
		3:
			skills.skill_ID_3_heaven_tempo_convert()
		4:
			skills.skill_ID_4_heaven_tempo_convert()
		5:
			skills.skill_ID_5_heaven_tempo_convert()
		6:
			skills.skill_ID_6_heaven_tempo_convert()
		7:
			skills.skill_ID_7_heaven_tempo_convert()
		8:
			skills.skill_ID_8_heaven_tempo_convert()
#finds what skill to put in skill slot one to use it for skill_effect() in the TBmanager script
func skill_effect():
	skills.define_skill_slot_1_heaven()
