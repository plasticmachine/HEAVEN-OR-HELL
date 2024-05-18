extends Node2D
@onready var clown = $ClownTb
@onready var hell = $PlayerSpots/HellTb



#var clownstats = Stats.get_character_stats(clown)
# Called when the node enters the scene tree for the first time.
func _ready():
	TurnBasedClownDialogue()

#func DialogueTesting():
	#if Input.is_action_just_pressed("Melee_hell"):
		#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/testingDialogue.dialogue"), "TestingDialogue")
		##print_debug(clownstats.heart)
		#return

func TurnBasedClownDialogue():
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/TurnBasedClown.dialogue"), "TurnBasedClown")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#DialogueTesting()
	pass
