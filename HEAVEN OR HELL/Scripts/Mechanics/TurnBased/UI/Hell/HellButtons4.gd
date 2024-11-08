extends TextureButton
signal hell_action_commited

@onready var skills = $"../../../../SkillManager"

var hellstats = preload("res://Resources/Stats/HellStats.tres")
func _on_pressed():
	hell_action_commited.emit()
	match skills.skill_slot_4_skill_hell:
		1:
			skills.skill_ID_1_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		2:
			skills.skill_ID_2_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		3:
			skills.skill_ID_3_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		4:
			skills.skill_ID_4_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		5:
			skills.skill_ID_5_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		6:
			skills.skill_ID_6_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		7:
			skills.skill_ID_7_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		8:
			skills.skill_ID_8_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		9:
			skills.skill_ID_9_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		10:
			skills.skill_ID_10_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
		11:
			skills.skill_ID_11_hell_tempo_convert()
			print_debug(hellstats.character_name + " locked in a move with " + str(hellstats.current_tempo) + " tempo)" )
#finds what skill to put in skill slot four to use it for skill_effect() in the TBmanager script
func skill_effect():
	skills.define_skill_slot_4_hell()
