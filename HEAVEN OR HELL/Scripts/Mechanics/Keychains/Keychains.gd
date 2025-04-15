extends Node2D

@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")


@onready var user: int = 0

func check_keychain_added_heaven():
	match heaveninventory.added_effect_ID:
		1:
			add_keychain_ID_1_effect_heaven()
		2:
			add_keychain_ID_2_effect_heaven()
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
func check_keychain_removed_heaven():
	match heaveninventory.removed_effect_ID:
		1:
			remove_keychain_ID_1_effect_heaven()
		2:
			remove_keychain_ID_2_effect_heaven()
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
func check_keychain_added_hell():
	match heaveninventory.added_effect_ID:
		1:
			add_keychain_ID_1_effect_hell()
		2:
			add_keychain_ID_2_effect_hell()
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

func add_keychain_ID_1_effect_heaven():
	heavenstats.add_malice(5)
	print_debug("++++++++++++++++++++ADDED KEYCHAIN 1 TO HEAVEN AND DID THE EFFECT!+++++++++++++++++")
func remove_keychain_ID_1_effect_heaven():
	heavenstats.subtract_malice(5)
	print_debug("------------REMOVED KEYCHAIN 1 FROM HEAVEN AND DID THE EFFECT!---------------")
func add_keychain_ID_1_effect_hell():
	hellstats.add_malice(5)
func remove_keychain_ID_1_effect_hell():
	hellstats.subtract_malice(5)

func add_keychain_ID_2_effect_heaven():
	heaveninventory.can_parry = true
	print_debug("+++++++++++++++++++ADDED KEYCHAIN 2 TO HEAVEN AND DID THE EFFECT!++++++++++++++++++++++++++++++++++++++")
func remove_keychain_ID_2_effect_heaven():
	heaveninventory.can_parry = false
	print_debug("---------------------------REMOVED KEYCHAIN 2 FROM HEAVEN AND DID THE EFFECT PROPERLY--------------------------")
func add_keychain_ID_2_effect_hell():
	hellinventory.can_parry = true
	print_debug("+++++++++++++++++++ADDED KEYCHAIN 2 TO HELL AND DID THE EFFECT!++++++++++++++++++++++++++++++++++++++")
func remove_keychain_ID_2_effect_hell():
	hellinventory.can_parry = false
	print_debug("---------------------------REMOVED KEYCHAIN 2 FROM HELL AND DID THE EFFECT PROPERLY--------------------------")
