extends Node2D
#@onready var clown = $ClownTbs

signal clown_skill_search

var turn_count: int
var turn_queue_amount: int
var turn_pop_amount: int = 2

var wait_for_next_turn_time: float = 2
var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
var hellstats = preload("res://Resources/Stats/HellStats.tres")
var clownstats = preload("res://Resources/Stats/ClownStats.tres")
var heavenskill: int
var hellskill: int
var clwnskill: int
#var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
#@onready var ClownSocket = $Sockets/ClownSocket
#@onready var HeavenSocket = $Sockets/HeavenSocket
#@onready var HellSocket = $Sockets/HellSocket

@onready var HeavenTB = $PlayerSpots/HeavenTb
@onready var HellTB = $PlayerSpots/HellTb
@onready var ClownTB = $EnemySpot2/ClownDancePath/PathFollow2D/ClownTb

@onready var heaven_action_button_1 = $PlayerUI/Buttons/HeavenButtons/Attackbutton1
@onready var heaven_action_button_2 = $PlayerUI/Buttons/HeavenButtons/Attackbutton2
@onready var heaven_action_button_3 = $PlayerUI/Buttons/HeavenButtons/Attackbutton3
@onready var heaven_action_button_4 = $PlayerUI/Buttons/HeavenButtons/Attackbutton4


@onready var hell_action_button_1 = $PlayerUI/Buttons/HellButtons/Attackbutton1
@onready var hell_action_button_2 = $PlayerUI/Buttons/HellButtons/Attackbutton2
@onready var hell_action_button_3 = $PlayerUI/Buttons/HellButtons/Attackbutton3
@onready var hell_action_button_4 = $PlayerUI/Buttons/HellButtons/Attackbutton4

@onready var StatusEffects = $StatusEffects



@export var BOSS_ID: int
#var clownstats = Stats.get_character_stats(clown)
# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = 144
	TurnBasedClownDialogue()
	
	heavenstats.current_skill_power = 0
	heavenstats.current_tempo = 0
	hellstats.current_skill_power = 0
	hellstats.current_tempo = 0
	
	
	match BOSS_ID:
		3:
			clownstats.current_skill_power = 0
			clownstats.current_tempo = 0
	#_init_battle()
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
	if clownstats.current_heart <= 0:
		YASM.load_scene("res://Scenes/Screens/Main_Menu.tscn")
	if heavenstats.current_heart <= 0:
		HeavenTB.hide()
		disable_heaven_buttons()
		turn_pop_amount = 1
		heavenskill = 0
	if hellstats.current_heart <= 0:
		HellTB.hide()
		disable_hell_buttons()
		turn_pop_amount = 1
		hellskill = 0
	if heavenstats.current_heart <= 0 and hellstats.current_heart <= 0:
		YASM.load_scene("res://Scenes/Screens/Main_Menu.tscn")
	


func turn_queue_pop_check():
	var hell_turn_order = hellstats.current_tempo
	var heaven_turn_order = heavenstats.current_tempo
	var clown_turn_order = clownstats.current_tempo
	
	
	var turn_order = [hell_turn_order, heaven_turn_order, clown_turn_order]
	
	match BOSS_ID:
		3:
			if turn_queue_amount == turn_pop_amount:
				#this is where im going to put the function that actually runs all of the skill functions
				if (hellstats.current_tempo > heavenstats.current_tempo) && (heavenstats.current_tempo > clownstats.current_tempo):
					#choosing which skill its going to use (hell)
					match hellskill:
						1: hell_action_button_1.skill_effect()
						2: hell_action_button_2.skill_effect()
						3: hell_action_button_3.skill_effect()
						4: hell_action_button_4.skill_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					#choosing which skill its going to use (heaven)
					match heavenskill:
						1: heaven_action_button_1.skill_effect()
						2: heaven_action_button_2.skill_effect()
						3: heaven_action_button_3.skill_effect()
						4: heaven_action_button_4.skill_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match ClownTB.clownskill:
						1: ClownTB.skill_1_effect()
						2: ClownTB.skill_2_effect()
				if (hellstats.current_tempo > clownstats.current_tempo) && (clownstats.current_tempo > heavenstats.current_tempo):
					#choosing which skill its going to use (hell)
					match hellskill:
						1: hell_action_button_1.skill_effect()
						2: hell_action_button_2.skill_effect()
						3: hell_action_button_3.skill_effect()
						4: hell_action_button_4.skill_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					#choosing which skill its going to use (heaven)
					match ClownTB.clownskill:
						1: ClownTB.skill_1_effect()
						2: ClownTB.skill_2_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match heavenskill:
						1: heaven_action_button_1.skill_effect()
						2: heaven_action_button_2.skill_effect()
						3: heaven_action_button_3.skill_effect()
						4: heaven_action_button_4.skill_effect()

				if (heavenstats.current_tempo > hellstats.current_tempo) &&  (hellstats.current_tempo > clownstats.current_tempo):
					match heavenskill:
						1: heaven_action_button_1.skill_effect()
						2: heaven_action_button_2.skill_effect()
						3: heaven_action_button_3.skill_effect()
						4: heaven_action_button_4.skill_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match hellskill:
						1: hell_action_button_1.skill_effect()
						2: hell_action_button_2.skill_effect()
						3: hell_action_button_3.skill_effect()
						4: hell_action_button_4.skill_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match ClownTB.clownskill:
						1: ClownTB.skill_1_effect()
						2: ClownTB.skill_2_effect()
				if (heavenstats.current_tempo > clownstats.current_tempo) && (clownstats.current_tempo > hellstats.current_tempo):
					match heavenskill:
						1: heaven_action_button_1.skill_effect()
						2: heaven_action_button_2.skill_effect()
						3: heaven_action_button_3.skill_effect()
						4: heaven_action_button_4.skill_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match ClownTB.clownskill:
						1: ClownTB.skill_1_effect()
						2: ClownTB.skill_2_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match hellskill:
						1: hell_action_button_1.skill_effect()
						2: hell_action_button_2.skill_effect()
						3: hell_action_button_3.skill_effect()
						4: hell_action_button_4.skill_effect()

				if (clownstats.current_tempo > heavenstats.current_tempo) && (heavenstats.current_tempo > hellstats.current_tempo):
					match ClownTB.clownskill:
						1: ClownTB.skill_1_effect()
						2: ClownTB.skill_2_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match heavenskill:
						1: heaven_action_button_1.skill_effect()
						2: heaven_action_button_2.skill_effect()
						3: heaven_action_button_3.skill_effect()
						4: heaven_action_button_4.skill_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match hellskill:
						1: hell_action_button_1.skill_effect()
						2: hell_action_button_2.skill_effect()
						3: hell_action_button_3.skill_effect()
						4: hell_action_button_4.skill_effect()
				if (clownstats.current_tempo > hellstats.current_tempo) && (hellstats.current_tempo > heavenstats.current_tempo):
					match ClownTB.clownskill:
						1: ClownTB.skill_1_effect()
						2: ClownTB.skill_2_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match hellskill:
						1: hell_action_button_1.skill_effect()
						2: hell_action_button_2.skill_effect()
						3: hell_action_button_3.skill_effect()
						4: hell_action_button_4.skill_effect()
					await get_tree().create_timer(wait_for_next_turn_time).timeout
					match heavenskill:
						1: heaven_action_button_1.skill_effect()
						2: heaven_action_button_2.skill_effect()
						3: heaven_action_button_3.skill_effect()
						4: heaven_action_button_4.skill_effect()

				if (heavenstats.current_tempo == hellstats.current_tempo) && (hellstats.current_tempo == clownstats.current_tempo):
					print_debug("equal tempo detected: rolling a dice...")
					var rand_num = [1,2,3].pick_random()
					if rand_num == 1:
						print_debug("rolling... done! heaven goes first")
						var num = [1,2].pick_random()
						match heavenskill:
							1: heaven_action_button_1.skill_effect()
							2: heaven_action_button_2.skill_effect()
							3: heaven_action_button_3.skill_effect()
							4: heaven_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						if num == 1:
							match hellskill:
								1: hell_action_button_1.skill_effect()
								2: hell_action_button_2.skill_effect()
								3: hell_action_button_3.skill_effect()
								4: hell_action_button_4.skill_effect()
							await get_tree().create_timer(wait_for_next_turn_time).timeout
							match ClownTB.clownskill:
								1: ClownTB.skill_1_effect()
								2: ClownTB.skill_2_effect()
						if num == 2:
							print_debug("rolling... done! heaven goes first [HEAVEN / BOSS / HELL]")
							match ClownTB.clownskill:
								1: ClownTB.skill_1_effect()
								2: ClownTB.skill_2_effect()
							await get_tree().create_timer(wait_for_next_turn_time).timeout
							match hellskill:
								1: hell_action_button_1.skill_effect()
								2: hell_action_button_2.skill_effect()
								3: hell_action_button_3.skill_effect()
								4: hell_action_button_4.skill_effect()
					if rand_num == 2:
						var num = [1,2].pick_random()
						print_debug("rolling... done! hell goes first")
						match hellskill:
							1: hell_action_button_1.skill_effect()
							2: hell_action_button_2.skill_effect()
							3: hell_action_button_3.skill_effect()
							4: hell_action_button_4.skill_effect()
						if num == 1:
							match heavenskill:
								1: heaven_action_button_1.skill_effect()
								2: heaven_action_button_2.skill_effect()
								3: heaven_action_button_3.skill_effect()
								4: heaven_action_button_4.skill_effect()
							await get_tree().create_timer(wait_for_next_turn_time).timeout
							match ClownTB.clownskill:
								1: ClownTB.skill_1_effect()
								2: ClownTB.skill_2_effect()
						if num == 2:
							match ClownTB.clownskill:
								1: ClownTB.skill_1_effect()
								2: ClownTB.skill_2_effect()
							await get_tree().create_timer(wait_for_next_turn_time).timeout
							match heavenskill:
								1: heaven_action_button_1.skill_effect()
								2: heaven_action_button_2.skill_effect()
								3: heaven_action_button_3.skill_effect()
								4: heaven_action_button_4.skill_effect()
					if rand_num == 3:
						print_debug("rolling... done! boss goes first")
						var num = [1,2].pick_random()
						match ClownTB.clownskill:
								1: ClownTB.skill_1_effect()
								2: ClownTB.skill_2_effect()
						if num == 1:
							match hellskill:
								1: hell_action_button_1.skill_effect()
								2: hell_action_button_2.skill_effect()
								3: hell_action_button_3.skill_effect()
								4: hell_action_button_4.skill_effect()
							await get_tree().create_timer(wait_for_next_turn_time).timeout
							match heavenskill:
								1: heaven_action_button_1.skill_effect()
								2: heaven_action_button_2.skill_effect()
								3: heaven_action_button_3.skill_effect()
								4: heaven_action_button_4.skill_effect()
						if num == 2:
							match heavenskill:
								1: heaven_action_button_1.skill_effect()
								2: heaven_action_button_2.skill_effect()
								3: heaven_action_button_3.skill_effect()
								4: heaven_action_button_4.skill_effect()
							await get_tree().create_timer(wait_for_next_turn_time).timeout
							match hellskill:
								1: hell_action_button_1.skill_effect()
								2: hell_action_button_2.skill_effect()
								3: hell_action_button_3.skill_effect()
								4: hell_action_button_4.skill_effect()
				if (heavenstats.current_tempo == hellstats.current_tempo) && (hellstats.current_tempo > clownstats.current_tempo):
					print_debug("equal tempo detected: rolling a dice...")
					var rand_num = [1,2].pick_random()
					
					if rand_num == 1:
						match hellskill:
							1: hell_action_button_1.skill_effect()
							2: hell_action_button_2.skill_effect()
							3: hell_action_button_3.skill_effect()
							4: hell_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match heavenskill:
							1: heaven_action_button_1.skill_effect()
							2: heaven_action_button_2.skill_effect()
							3: heaven_action_button_3.skill_effect()
							4: heaven_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match ClownTB.clownskill:
							1: ClownTB.skill_1_effect()
							2: ClownTB.skill_2_effect()
					if rand_num == 2:
						match heavenskill:
							1: heaven_action_button_1.skill_effect()
							2: heaven_action_button_2.skill_effect()
							3: heaven_action_button_3.skill_effect()
							4: heaven_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match hellskill:
							1: hell_action_button_1.skill_effect()
							2: hell_action_button_2.skill_effect()
							3: hell_action_button_3.skill_effect()
							4: hell_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match ClownTB.clownskill:
							1: ClownTB.skill_1_effect()
							2: ClownTB.skill_2_effect()
				if (heavenstats.current_tempo > hellstats.current_tempo) && (hellstats.current_tempo == clownstats.current_tempo):
					print_debug("equal tempo detected: rolling a dice...")
					var rand_num = [1,2].pick_random()
					match heavenskill:
						1: heaven_action_button_1.skill_effect()
						2: heaven_action_button_2.skill_effect()
						3: heaven_action_button_3.skill_effect()
						4: heaven_action_button_4.skill_effect()
					if rand_num == 1:
						print_debug("rolling... done! heaven goes first [HEAVEN / HELL / BOSS]")
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match hellskill:
							1: hell_action_button_1.skill_effect()
							2: hell_action_button_2.skill_effect()
							3: hell_action_button_3.skill_effect()
							4: hell_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match ClownTB.clownskill:
							1: ClownTB.skill_1_effect()
							2: ClownTB.skill_2_effect()
					if rand_num == 2:
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match ClownTB.clownskill:
							1: ClownTB.skill_1_effect()
							2: ClownTB.skill_2_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match hellskill:
							1: hell_action_button_1.skill_effect()
							2: hell_action_button_2.skill_effect()
							3: hell_action_button_3.skill_effect()
							4: hell_action_button_4.skill_effect()
				if (hellstats.current_tempo > heavenstats.current_tempo) && (heavenstats.current_tempo == clownstats.current_tempo):
					print_debug("equal tempo detected: rolling a dice...")
					var rand_num = [1,2].pick_random()
					match hellskill:
						1: hell_action_button_1.skill_effect()
						2: hell_action_button_2.skill_effect()
						3: hell_action_button_3.skill_effect()
						4: hell_action_button_4.skill_effect()
					if rand_num == 1:
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match heavenskill:
							1: heaven_action_button_1.skill_effect()
							2: heaven_action_button_2.skill_effect()
							3: heaven_action_button_3.skill_effect()
							4: heaven_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match ClownTB.clownskill:
							1: ClownTB.skill_1_effect()
							2: ClownTB.skill_2_effect()
							
					if rand_num == 2:
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match ClownTB.clownskill:
							1: ClownTB.skill_1_effect()
							2: ClownTB.skill_2_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match heavenskill:
							1: heaven_action_button_1.skill_effect()
							2: heaven_action_button_2.skill_effect()
							3: heaven_action_button_3.skill_effect()
							4: heaven_action_button_4.skill_effect()
				if (clownstats.current_tempo > heavenstats.current_tempo) && (heavenstats.current_tempo == hellstats.current_tempo):
					print_debug("equal tempo detected: rolling a dice...")
					var rand_num = [1,2].pick_random()
					print_debug(rand_num)
					match ClownTB.clownskill:
						1: ClownTB.skill_1_effect()
						2: ClownTB.skill_2_effect()
					if rand_num == 1:
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match heavenskill:
							1: heaven_action_button_1.skill_effect()
							2: heaven_action_button_2.skill_effect()
							3: heaven_action_button_3.skill_effect()
							4: heaven_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match hellskill:
							1: hell_action_button_1.skill_effect()
							2: hell_action_button_2.skill_effect()
							3: hell_action_button_3.skill_effect()
							4: hell_action_button_4.skill_effect()
						print_debug("turn order was BOSS / HEAVEN / HELL")
					if rand_num == 2:
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match hellskill:
							1: hell_action_button_1.skill_effect()
							2: hell_action_button_2.skill_effect()
							3: hell_action_button_3.skill_effect()
							4: hell_action_button_4.skill_effect()
						await get_tree().create_timer(wait_for_next_turn_time).timeout
						match heavenskill:
							1: heaven_action_button_1.skill_effect()
							2: heaven_action_button_2.skill_effect()
							3: heaven_action_button_3.skill_effect()
							4: heaven_action_button_4.skill_effect()
						print_debug("turn order was BOSS / HELL / HEAVEN")
				#print_debug(str(heavenskill) + " and " + str(heavenstats.current_tempo))
				#print_debug(str(hellskill) + " and " + str(hellstats.current_tempo))
				#print_debug(str(ClownTB.clownskill) + " and " + str(clownstats.current_tempo))
				StatusEffects.check_if_effects_active_end_turn()
				StatusEffects.check_if_effects_worn_off()
				turn_queue_amount = 0
				turn_count += 1
				print_debug("turn queue cleared!")
				print_debug("turncount is " + str(turn_count) )
				save_all_stats()
				enable_all_buttons()
			else:
				print_debug("awaiting turn_queue_pop")

#connecting signal thats emitted from heaven's attackbuttons (populated with skill effect)
func _on_heaven_action_commited_skill_1():
	heavenskill = 1
	#heavenstats.current_tempo = 10
	turn_queue_amount += 1
	print_debug("this is commiting an action!")
	turn_queue_pop_check()
	disable_heaven_buttons()
func _on_heaven_action_commited_skill_2():
	heavenskill = 2
	turn_queue_amount += 1
	print_debug("this is commiting an action!")
	turn_queue_pop_check()
	disable_heaven_buttons()
func _on_heaven_action_commited_skill_3():
	heavenskill = 3
	turn_queue_amount += 1
	print_debug("this is commiting an action!")
	turn_queue_pop_check()
	disable_heaven_buttons()
func _on_heaven_action_commited_skill_4():
	heavenskill = 4
	turn_queue_amount += 1
	print_debug("this is commiting an action!")
	turn_queue_pop_check()
	disable_heaven_buttons()

#connecting signal thats emitted from hell's attackbuttons (populated with skill effect)
func _on_hell_action_commited_skill_1():
	#hellstats.current_tempo = 10
	hellskill = 1
	turn_queue_amount += 1
	print_debug("this is commiting an action!")
	turn_queue_pop_check()
	disable_hell_buttons()
func _on_hell_action_commited_skill_2():
	hellskill = 2
	turn_queue_amount += 1
	print_debug("this is commiting an action!")
	turn_queue_pop_check()
	disable_hell_buttons()
func _on_hell_action_commited_skill_3():
	hellskill = 3
	turn_queue_amount += 1
	print_debug("this is commiting an action!")
	turn_queue_pop_check()
	disable_hell_buttons()
func _on_hell_action_commited_skill_4():
	hellskill = 4
	turn_queue_amount += 1
	print_debug("this is commiting an action!")
	turn_queue_pop_check()
	disable_hell_buttons()



#enabling/disabling all buttons functionality
func enable_hell_buttons():
	hell_action_button_1.disabled = false
	hell_action_button_2.disabled = false
	hell_action_button_3.disabled = false
	hell_action_button_4.disabled = false
func disable_hell_buttons():
	hell_action_button_1.disabled = true
	hell_action_button_2.disabled = true
	hell_action_button_3.disabled = true
	hell_action_button_4.disabled = true
	clown_skill_search.emit()
func enable_heaven_buttons():
	heaven_action_button_1.disabled = false
	heaven_action_button_2.disabled = false
	heaven_action_button_3.disabled = false
	heaven_action_button_4.disabled = false
func disable_heaven_buttons():
	heaven_action_button_1.disabled = true
	heaven_action_button_2.disabled = true
	heaven_action_button_3.disabled = true
	heaven_action_button_4.disabled = true
	clown_skill_search.emit()
func disable_all_buttons():
	heaven_action_button_1.disabled = true
	heaven_action_button_2.disabled = true
	heaven_action_button_3.disabled = true
	heaven_action_button_4.disabled = true
	
	hell_action_button_1.disabled = true
	hell_action_button_2.disabled = true
	hell_action_button_3.disabled = true
	hell_action_button_4.disabled = true
func enable_all_buttons():
	heaven_action_button_1.disabled = false
	heaven_action_button_2.disabled = false
	heaven_action_button_3.disabled = false
	heaven_action_button_4.disabled = false
	
	hell_action_button_1.disabled = false
	hell_action_button_2.disabled = false
	hell_action_button_3.disabled = false
	hell_action_button_4.disabled = false


func _on_clown_tb_action_committed() -> void:
	print_debug("Boss chose their action")


func save_all_stats():
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
	StatSaver.save_clownstats_to_file("res://Resources/Stats/ClownStats.tres")
