extends Node2D

@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")

@export var keychain_ID_1: KeychainResource


@onready var user: int = 0

func check_keychain_heaven_added():
	match heaveninventory.added_effect_ID:
		1:
			add_keychain_ID_1_effect_heaven()
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
func check_keychain_slot_1_heaven_removed():
	match heaveninventory.removed_effect_ID:
		1:
			remove_keychain_ID_1_heaven()
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass







func check_keychain_slot_2_heaven():
	match heaveninventory.keychain_slot_2:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
func check_keychain_slot_3_heaven():
	match heaveninventory.keychain_slot_3:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
func check_keychain_slot_4_heaven():
	match heaveninventory.keychain_slot_4:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
func check_keychain_slot_5_heaven():
	match heaveninventory.keychain_slot_5:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass



func check_keychain_slot_1_hell():
	match hellinventory.keychain_slot_1:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
func check_keychain_slot_2_hell():
	match hellinventory.keychain_slot_2:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
func check_keychain_slot_3_hell():
	match hellinventory.keychain_slot_3:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
func check_keychain_slot_4_hell():
	match hellinventory.keychain_slot_4:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
func check_keychain_slot_5_hell():
	match hellinventory.keychain_slot_5:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass

func check_keychain_slots_heaven():
	#check_keychain_slot_1_heaven_added()
	check_keychain_slot_2_heaven()
	check_keychain_slot_3_heaven()
	check_keychain_slot_4_heaven()
	check_keychain_slot_5_heaven()
func check_keychain_slots_hell():
	check_keychain_slot_1_hell()
	check_keychain_slot_2_hell()
	check_keychain_slot_3_hell()
	check_keychain_slot_4_hell()
	check_keychain_slot_5_hell()


func add_keychain_ID_1_effect_heaven():
	heavenstats.add_malice(5)
	print_debug("ADDED KEYCHAIN 1 TO HEAVEN AND DID THE EFFECT!")
func remove_keychain_ID_1_heaven():
	heavenstats.subtract_malice(5)
	heaveninventory.remove_keychain(keychain_ID_1)
func add_keychain_ID_1_hell():
	hellstats.add_malice(5)
func remove_keychain_ID_1_hell():
	hellstats.subtract_malice(5)

func add_keychain_ID_2_heaven():
	heaveninventory.can_parry = true
func remove_keychain_ID_2_heaven():
	heaveninventory.can_parry = false
