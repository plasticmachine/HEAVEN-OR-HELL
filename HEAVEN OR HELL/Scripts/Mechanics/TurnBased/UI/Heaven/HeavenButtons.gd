extends TextureButton
signal heaven_action_commited

@onready var skills = $"../../../../SkillManager"

func _on_pressed():
	heaven_action_commited.emit()

#finds what skill to put in skill slot one to use it for skill_effect() in the TBmanager script
func skill_effect():
	skills.define_skill_slot_1_heaven()
