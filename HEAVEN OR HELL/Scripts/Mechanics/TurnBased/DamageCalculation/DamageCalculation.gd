extends Node
signal hell_damage_taken
signal heaven_damage_taken
signal clown_damage_taken

@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")


@onready var variance = [.8, .85, .9, .95, 1.0, 1.05, 1.1, 1.5, 1.2]

static var total_damage: int
### PLAYER DAMAGE CALCS
	## HEAVEN DAMAGE CALCS
func heaven_to_clown_malice_damagecalc():
	#var total_damage: int
	var outgoing_damage = heavenstats.current_skill_power * heavenstats.malice
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
	clown_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_CLOWN_MALICE")
func heaven_to_clown_deviltry_damagecalc():
	#var total_damage: int
	var outgoing_damage = heavenstats.current_skill_power * heavenstats.deviltry
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
	clown_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_CLOWN_DEVILTRY")
func heaven_to_hell_malice_damagecalc():
	#var total_damage: int
	var outgoing_damage = heavenstats.current_skill_power * heavenstats.malice
	
	total_damage = outgoing_damage / hellstats.guts * variance.pick_random()
	hellstats.subtract_heart(total_damage)
	hell_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_HEAVEN_MALICE")
func heaven_to_hell_deviltry_damagecalc():
	#var total_damage: int
	var outgoing_damage = heavenstats.current_skill_power * heavenstats.deviltry
	
	total_damage = outgoing_damage / hellstats.guts * variance.pick_random()
	hellstats.subtract_heart(total_damage)
	hell_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HEAVEN_DAMAGING_HELL_DEVILTRY")
## HELL DAMAGE CALCS
func hell_to_clown_malice_damagecalc():
	#var total_damage: int
	var outgoing_damage = hellstats.current_skill_power * hellstats.malice
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
	clown_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_CLOWN_MALICE")
func hell_to_clown_deviltry_damagecalc():
	#var total_damage: int
	var outgoing_damage = hellstats.current_skill_power * hellstats.deviltry
	
	total_damage = outgoing_damage / clownstats.guts * variance.pick_random()
	clownstats.subtract_heart(total_damage)
	clown_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_CLOWN_DEVILTRY")
func hell_to_heaven_malice_damagecalc():
	#var total_damage: int
	var outgoing_damage = hellstats.current_skill_power * hellstats.malice
	
	total_damage = outgoing_damage / heavenstats.guts * variance.pick_random()
	heavenstats.subtract_heart(total_damage)
	heaven_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_HEAVEN_MALICE")
func hell_to_heaven_deviltry_damagecalc():
	
	#var total_damage: int
	var outgoing_damage = hellstats.current_skill_power * hellstats.deviltry
	
	total_damage = outgoing_damage / heavenstats.guts * variance.pick_random()
	heavenstats.subtract_heart(total_damage)
	heaven_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "HELL_DAMAGING_HEAVEN_DEVILTRY")
### BOSS DAMAGE CALCS
	## CLOWN DAMAGE CALCS
func clown_to_heaven_malice_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.malice
	
	total_damage = outgoing_damage / heavenstats.guts * variance.pick_random()
	heavenstats.subtract_heart(total_damage)
	heaven_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "CLOWN_DAMAGING_HEAVEN_MALICE")
func clown_to_heaven_deviltry_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.deviltry
	
	total_damage = outgoing_damage / heavenstats.guts * variance.pick_random()
	heavenstats.subtract_heart(total_damage)
	heaven_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "CLOWN_DAMAGING_HEAVEN_DEVILTRY")
func clown_to_hell_malice_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.malice
	
	total_damage = outgoing_damage / hellstats.guts * variance.pick_random()
	hellstats.subtract_heart(total_damage)
	hell_damage_taken.emit() 
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "CLOWN_DAMAGING_HELL_MALICE")
func clown_to_hell_deviltry_damagecalc():
	#var total_damage: int
	var outgoing_damage = clownstats.current_skill_power * clownstats.deviltry
	
	total_damage = outgoing_damage / hellstats.guts * variance.pick_random()
	hellstats.subtract_heart(total_damage)
	hell_damage_taken.emit()
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/BATTLE_SYSTEM_TEXT.dialogue"), "CLOWN_DAMAGING_HELL_DEVILTRY")
