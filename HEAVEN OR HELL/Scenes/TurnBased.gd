extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func DialogueTesting():
	if Input.is_action_just_pressed("Melee"):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/testingDialogue.dialogue"), "TestingDialogue")
		return

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DialogueTesting()
