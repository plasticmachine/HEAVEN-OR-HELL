extends Node
signal hell_damage_taken
signal heaven_damage_taken
signal clown_damage_taken

@onready var HeavenDamageNumbers = $"../PlayerUI/Data/HeavenData/HeavenDamageNumber"
@onready var HellDamageNumbers = $"../PlayerUI/Data/HellData/HellDamageNumber"
@onready var ClownDamageNumbers = $"../EnemySpot2/ClownDancePath/PathFollow2D/ClownTb/ClownDamageNumber"

@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")

@onready var variance = [.8, .85, .9, .95, 1.0, 1.05, 1.1, 1.5, 1.2]
@export var parry_multiplier: float
static var total_damage: int
static var current_level_crit_hit: int

var crit_hit := false
var crit_multiplier: float


### PLAYER DAMAGE CALCS
	## HEAVEN DAMAGE CALCS
func heaven_to_clown_malice_damagecalc():
	#var total_damage: int
	check_heaven_crit()
	match crit_hit:
		true:
			var outgoing_damage = heavenstats.current_skill_power * heavenstats.malice
			total_damage = outgoing_damage / clownstats.guts * variance.pick_random() * crit_multiplier
			clownstats.subtract_heart(total_damage)
			clown_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_CLOWN_MALICE_CRIT")
			match heavenstats.crit_level:
				1:
					HeavenSounds.HEAVEN_CRIT_1.play()
				2:
					HeavenSounds.HEAVEN_CRIT_2.play()
				3:
					HeavenSounds.HEAVEN_CRIT_3.play()
		false:
			var outgoing_damage = heavenstats.current_skill_power * heavenstats.malice
			total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
			clownstats.subtract_heart(total_damage)
			clown_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_CLOWN_MALICE")
	display_clown_damage_numbers()
func heaven_to_clown_deviltry_damagecalc():
	#var total_damage: int
	check_heaven_crit()
	match crit_hit:
		true:
			var outgoing_damage = heavenstats.current_skill_power * heavenstats.deviltry
			total_damage = outgoing_damage / clownstats.guts * variance.pick_random() * crit_multiplier
			clownstats.subtract_heart(total_damage)
			clown_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_CLOWN_DEVILTRY_CRIT")
			match heavenstats.crit_level:
				1:
					HeavenSounds.HEAVEN_CRIT_1.play()
				2:
					HeavenSounds.HEAVEN_CRIT_2.play()
				3:
					HeavenSounds.HEAVEN_CRIT_3.play()
		false:
			var outgoing_damage = heavenstats.current_skill_power * heavenstats.deviltry
			total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
			clownstats.subtract_heart(total_damage)
			clown_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_CLOWN_DEVILTRY")
	display_clown_damage_numbers()
func heaven_to_hell_malice_damagecalc():
	#var total_damage: int
	check_heaven_crit()
	
	match crit_hit:
		true:
			var outgoing_damage = heavenstats.current_skill_power * heavenstats.malice
			total_damage = outgoing_damage / hellstats.guts * variance.pick_random() * crit_multiplier
			hellstats.subtract_heart(total_damage)
			hell_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_HELL_MALICE_CRIT")
			match heavenstats.crit_level:
				1:
					HeavenSounds.HEAVEN_CRIT_1.play()
				2:
					HeavenSounds.HEAVEN_CRIT_2.play()
				3:
					HeavenSounds.HEAVEN_CRIT_3.play()
		false:
			var outgoing_damage = heavenstats.current_skill_power * heavenstats.malice
			total_damage = outgoing_damage / hellstats.guts * variance.pick_random()
			hellstats.subtract_heart(total_damage)
			hell_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_HELL_MALICE")
func heaven_to_hell_deviltry_damagecalc():
	#var total_damage: int
	check_heaven_crit()
	
	match crit_hit:
		true:
			var outgoing_damage = heavenstats.current_skill_power * heavenstats.deviltry
			total_damage = outgoing_damage / hellstats.guts * variance.pick_random() * crit_multiplier
			hellstats.subtract_heart(total_damage)
			hell_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_HELL_DEVILTRY_CRIT")
			match heavenstats.crit_level:
				1:
					HeavenSounds.HEAVEN_CRIT_1.play()
				2:
					HeavenSounds.HEAVEN_CRIT_2.play()
				3:
					HeavenSounds.HEAVEN_CRIT_3.play()
		false:
			var outgoing_damage = heavenstats.current_skill_power * heavenstats.deviltry
			total_damage = outgoing_damage / hellstats.guts * variance.pick_random()
			hellstats.subtract_heart(total_damage)
			hell_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_HELL_DEVILTRY")
## HELL DAMAGE CALCS
func hell_to_clown_malice_damagecalc():
	#var total_damage: int
	check_hell_crit()
	
	match crit_hit:
		true:
			var outgoing_damage = hellstats.current_skill_power * hellstats.malice
			total_damage = outgoing_damage / heavenstats.guts * variance.pick_random() * crit_multiplier
			clownstats.subtract_heart(total_damage)
			clown_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_CLOWN_MALICE_CRIT")
			match hellstats.crit_level:
				1:
					HellSounds.HELL_CRIT_1.play()
				2:
					HellSounds.HELL_CRIT_2.play()
				3:
					HellSounds.HELL_CRIT_3.play()
		false:
			var outgoing_damage = hellstats.current_skill_power * hellstats.malice
			total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
			clownstats.subtract_heart(total_damage)
			clown_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_CLOWN_MALICE")
	display_clown_damage_numbers()
	
	#if crit_hit == true:
		#match hellstats.crit_level:
			#1:
				#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_CLOWN_MALICE_CRIT_1")
			#2:
				#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_CLOWN_MALICE_CRIT_2")
			#3:
				#DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_CLOWN_MALICE_CRIT_3")
func hell_to_clown_deviltry_damagecalc():
	#var total_damage: int
	#var total_damage: int
	check_hell_crit()
	
	match crit_hit:
		true:
			var outgoing_damage = hellstats.current_skill_power * hellstats.deviltry
			total_damage = outgoing_damage / clownstats.guts * variance.pick_random() * crit_multiplier
			clownstats.subtract_heart(total_damage)
			clown_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_CLOWN_DEVILTRY_CRIT")
			match hellstats.crit_level:
				1:
					HellSounds.HELL_CRIT_1.play()
				2:
					HellSounds.HELL_CRIT_2.play()
				3:
					HellSounds.HELL_CRIT_3.play()
		false:
			var outgoing_damage = hellstats.current_skill_power * hellstats.deviltry
			total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
			clownstats.subtract_heart(total_damage)
			clown_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_CLOWN_DEVILTRY")
	display_clown_damage_numbers()
func hell_to_heaven_malice_damagecalc():
	#var total_damage: int
	check_hell_crit()
	
	match crit_hit:
		true:
			var outgoing_damage = hellstats.current_skill_power * hellstats.malice
			total_damage = outgoing_damage / heavenstats.guts * variance.pick_random() * crit_multiplier
			heavenstats.subtract_heart(total_damage)
			heaven_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_HEAVEN_MALICE_CRIT")
			match hellstats.crit_level:
				1:
					HellSounds.HELL_CRIT_1.play()
				2:
					HellSounds.HELL_CRIT_2.play()
				3:
					HellSounds.HELL_CRIT_3.play()
		false:
			var outgoing_damage = hellstats.current_skill_power * hellstats.malice
			total_damage = outgoing_damage / heavenstats.guts * variance.pick_random()
			heavenstats.subtract_heart(total_damage)
			heaven_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_HEAVEN_MALICE")
	display_clown_damage_numbers()
func hell_to_heaven_deviltry_damagecalc():
	#var total_damage: int
	check_hell_crit()
	
	match crit_hit:
		true:
			var outgoing_damage = hellstats.current_skill_power * hellstats.deviltry
			total_damage = outgoing_damage / heavenstats.guts * variance.pick_random() * crit_multiplier
			heavenstats.subtract_heart(total_damage)
			heaven_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_HEAVEN_DEVILTRY_CRIT")
			match hellstats.crit_level:
				1:
					HellSounds.HELL_CRIT_1.play()
				2:
					HellSounds.HELL_CRIT_2.play()
				3:
					HellSounds.HELL_CRIT_3.play()
		false:
			var outgoing_damage = hellstats.current_skill_power * hellstats.deviltry
			total_damage = outgoing_damage / heavenstats.guts * variance.pick_random()
			heavenstats.subtract_heart(total_damage)
			heaven_damage_taken.emit()
			DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_HEAVEN_DEVILTRY")
	display_clown_damage_numbers()

### BOSS DAMAGE CALCS
	## CLOWN DAMAGE CALCS
func clown_to_heaven_malice_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.malice
	
	total_damage = outgoing_damage / heavenstats.guts * variance.pick_random()
	heavenstats.subtract_heart(total_damage)
	heaven_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "CLOWN_DAMAGING_HEAVEN_MALICE")
	display_heaven_damage_numbers()
func clown_to_heaven_deviltry_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.deviltry
	
	total_damage = outgoing_damage / heavenstats.guts * variance.pick_random()
	heavenstats.subtract_heart(total_damage)
	heaven_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "CLOWN_DAMAGING_HEAVEN_DEVILTRY")
	display_heaven_damage_numbers()
func clown_to_hell_malice_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.malice
	
	total_damage = outgoing_damage / hellstats.guts * variance.pick_random()
	hellstats.subtract_heart(total_damage)
	hell_damage_taken.emit() 
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "CLOWN_DAMAGING_HELL_MALICE")
	display_hell_damage_numbers()
func clown_to_hell_deviltry_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.deviltry
	
	total_damage = outgoing_damage / hellstats.guts * variance.pick_random()
	hellstats.subtract_heart(total_damage)
	hell_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "CLOWN_DAMAGING_HELL_DEVILTRY")
	display_hell_damage_numbers()
	## PARRY DAMAGE CALCS
func heaven_to_clown_malice_PARRY_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.malice * parry_multiplier
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
	clown_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_PARRIED_CLOWN_MALICE")
	display_clown_damage_numbers()
func heaven_to_clown_deviltry_PARRY_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.deviltry * parry_multiplier
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
	clown_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_PARRIED_CLOWN_DEVILTRY")
	display_clown_damage_numbers()
func hell_to_clown_malice_PARRY_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.malice * parry_multiplier
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
	clown_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_PARRIED_CLOWN_MALICE")
	display_clown_damage_numbers()
func hell_to_clown_deviltry_PARRY_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.deviltry * parry_multiplier
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
	clown_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_PARRIED_CLOWN_DEVILTRY")
	display_clown_damage_numbers()
func check_heaven_crit():
	heavenstats.calc_crit_level()
	
	var crit_rng_1 =  randi_range(1,100)
	var crit_rng_2 = randi_range(101,200)
	var crit_rng_3 = randi_range(201,300)
	
	print_debug(hellstats.crit_level)
	#print_debug(crit_rng_1)
	#print_debug(crit_rng_2)
	#print_debug(crit_rng_3)
	match heavenstats.crit_level:
		1:
			if heavenstats.crit >= crit_rng_1:
				crit_hit = true
				crit_multiplier = 1.5
				current_level_crit_hit = heavenstats.crit_level
			else:
				crit_hit = false
				current_level_crit_hit = 0
		2:
			if heavenstats.crit >= crit_rng_2:
				crit_hit = true
				crit_multiplier = 2
				current_level_crit_hit = heavenstats.crit_level
			else:
				crit_hit = false
				current_level_crit_hit = 0
		3:
			if heavenstats.crit >= crit_rng_3:
				crit_hit = true
				crit_multiplier = 2.5
				current_level_crit_hit = heavenstats.crit_level
			else:
				crit_hit = false
				current_level_crit_hit = 0
func check_hell_crit():
	hellstats.calc_crit_level()
	
	var crit_rng_1 =  randi_range(1,100)
	var crit_rng_2 = randi_range(101,200)
	var crit_rng_3 = randi_range(201,300)
	
	print_debug(hellstats.crit_level)
	#print_debug(crit_rng_1)
	#print_debug(crit_rng_2)
	#print_debug(crit_rng_3)
	match hellstats.crit_level:
		1:
			if hellstats.crit >= crit_rng_1:
				crit_hit = true
				crit_multiplier = 1.5
				current_level_crit_hit = hellstats.crit_level
			else:
				crit_hit = false
				current_level_crit_hit = 0
		2:
			if hellstats.crit >= crit_rng_2:
				crit_hit = true
				crit_multiplier = 2
				current_level_crit_hit = hellstats.crit_level
			else:
				crit_hit = false
				current_level_crit_hit = 0
		3:
			if hellstats.crit >= crit_rng_3:
				crit_hit = true
				crit_multiplier = 2.5
				current_level_crit_hit = hellstats.crit_level
			else:
				crit_hit = false
				current_level_crit_hit = 0

func display_hell_damage_numbers():
			HellDamageNumbers.visible = true
			HellDamageNumbers.text = "[tornado radius=10.0 freq=10.0 connected=1]" + str(total_damage) + "[/tornado]"
			
			await get_tree().create_timer(1).timeout
			
			HellDamageNumbers.visible = false
func display_heaven_damage_numbers():
			HeavenDamageNumbers.visible = true
			HeavenDamageNumbers.text = "[tornado radius=10.0 freq=10.0 connected=1]" + str(total_damage) + "[/tornado]"
			
			await get_tree().create_timer(1).timeout
			
			HeavenDamageNumbers.visible = false
func display_clown_damage_numbers():
			ClownDamageNumbers.visible = true
			
			match current_level_crit_hit:
				0:
					ClownDamageNumbers.text = "[tornado radius=10.0 freq=10.0 connected=1]" + str(total_damage)
				1:
					ClownDamageNumbers.text = "[tornado radius=10.0 freq=10.0 connected=1][rainbow freq=1.0 sat=0.8 val=0.8 speed=1.0]" + str(total_damage)
				2:
					ClownDamageNumbers.text = "[tornado radius=10.0 freq=15.0 connected=1][rainbow freq=5.0 sat=0.8 val=0.8 speed=1.0]" + str(total_damage)
				3:
					ClownDamageNumbers.text = "[tornado radius=10.0 freq=30.0 connected=1][rainbow freq=1000.0 sat=0.8 val=0.8 speed=100.0]" + str(total_damage)
			
			await get_tree().create_timer(1).timeout
			
			ClownDamageNumbers.visible = false
