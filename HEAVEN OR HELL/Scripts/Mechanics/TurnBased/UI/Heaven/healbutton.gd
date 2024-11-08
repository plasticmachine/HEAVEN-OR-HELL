extends TextureButton
signal heaven_action_commited

@onready var skills = $"../../../../SkillManager"

var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
func _on_pressed():
	heaven_action_commited.emit()
	match skills.skill_slot_3_skill_heaven:
		1:
			skills.skill_ID_1_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		2:
			skills.skill_ID_2_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		3:
			skills.skill_ID_3_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		4:
			skills.skill_ID_4_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		5:
			skills.skill_ID_5_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		6:
			skills.skill_ID_6_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		7:
			skills.skill_ID_7_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		8:
			skills.skill_ID_8_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		9:
			skills.skill_ID_9_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		10:
			skills.skill_ID_10_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
		11:
			skills.skill_ID_11_heaven_tempo_convert()
			print_debug(heavenstats.character_name + " locked in a move with " + str(heavenstats.current_tempo) + " tempo)" )
#finds what skill to put in skill slot three to use it for skill_effect() in the TBmanager script
func skill_effect():
	skills.define_skill_slot_3_heaven()
