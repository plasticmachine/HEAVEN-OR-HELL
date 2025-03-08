extends TextureButton
signal hell_action_commited

@onready var skills = $"../../../../SkillManager"

var hellstats = preload("res://Resources/Stats/HellStats.tres")
@export var test_skill_1_button_normal: CompressedTexture2D
@export var test_skill_1_button_down: CompressedTexture2D
@export var test_skill_1_button_hover: CompressedTexture2D
@export var test_skill_2_button_normal: CompressedTexture2D
@export var test_skill_2_button_down: CompressedTexture2D
@export var test_skill_3_button_normal: CompressedTexture2D
@export var test_skill_3_button_down: CompressedTexture2D
@export var test_skill_4_button_normal: CompressedTexture2D
@export var test_skill_4_button_down: CompressedTexture2D
@export var test_skill_5_button_normal: CompressedTexture2D
@export var test_skill_5_button_down: CompressedTexture2D
@export var test_skill_6_button_normal: CompressedTexture2D
@export var test_skill_6_button_down: CompressedTexture2D
@export var test_skill_7_button_normal: CompressedTexture2D
@export var test_skill_7_button_down: CompressedTexture2D
@export var test_skill_8_button_normal: CompressedTexture2D
@export var test_skill_8_button_down: CompressedTexture2D
@export var test_skill_9_button_normal: CompressedTexture2D
@export var test_skill_9_button_down: CompressedTexture2D
@export var test_skill_10_button_normal: CompressedTexture2D
@export var test_skill_10_button_down: CompressedTexture2D
@export var test_skill_11_button_normal: CompressedTexture2D
@export var test_skill_11_button_down: CompressedTexture2D

func _ready():
	match skills.skill_slot_1_skill_hell:
		1:
			self.texture_normal = test_skill_1_button_normal
			self.texture_pressed = test_skill_1_button_down
			self.texture_hover = test_skill_1_button_normal
		2:
			self.texture_normal = test_skill_2_button_normal
			self.texture_pressed = test_skill_2_button_down
			self.texure_hover = test_skill_2_button_normal
		3:
			self.texture_normal = test_skill_3_button_normal
			self.texture_pressed = test_skill_3_button_down
			self.texure_hover = test_skill_3_button_normal
		4:
			self.texture_normal = test_skill_4_button_normal
			self.texture_pressed = test_skill_4_button_down
			self.texure_hover = test_skill_4_button_normal
		5:
			self.texture_normal = test_skill_5_button_normal
			self.texture_pressed = test_skill_5_button_down
			self.texure_hover = test_skill_5_button_normal
		6:
			self.texture_normal = test_skill_6_button_normal
			self.texture_pressed = test_skill_6_button_down
			self.texure_hover = test_skill_6_button_normal
		7:
			self.texture_normal = test_skill_7_button_normal
			self.texture_pressed = test_skill_7_button_down
			self.texure_hover = test_skill_7_button_normal
		8:
			self.texture_normal = test_skill_8_button_normal
			self.texture_pressed = test_skill_8_button_down
			self.texure_hover = test_skill_8_button_normal
		9:
			self.texture_normal = test_skill_9_button_normal
			self.texture_pressed = test_skill_9_button_down
			self.texure_hover = test_skill_9_button_normal
		10:
			self.texture_normal = test_skill_10_button_normal
			self.texture_pressed = test_skill_10_button_down
			self.texure_hover = test_skill_10_button_normal
		11:
			self.texture_normal = test_skill_11_button_normal
			self.texture_pressed = test_skill_11_button_down
			self.texure_hover = test_skill_11_button_normal

func _on_pressed():
	hell_action_commited.emit()
	match skills.skill_slot_1_skill_hell:
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
#finds what skill to put in skill slot one to use it for skill_effect() in the TBmanager script
func skill_effect():
	skills.define_skill_slot_1_hell()
