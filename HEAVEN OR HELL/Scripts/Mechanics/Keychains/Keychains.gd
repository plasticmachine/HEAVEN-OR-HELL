extends Node2D

@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")


@onready var user: int = 0

@export_category("KEYCHAIN VALUES")
@export var ID_1_percentage_increase: float = .1
@export var ID_2_percentage_increase: float = .2 

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
func check_keychain_removed_hell():
	match heaveninventory.added_effect_ID:
		1:
			remove_keychain_ID_1_effect_hell()
		2:
			remove_keychain_ID_2_effect_hell()
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

### ID_1_KEYCHAIN - HEAVEN
func add_keychain_ID_1_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			heavenstats.add_malice(5)
		2:
			heavenstats.add_malice(50)
	print_debug("++++++++++++++++++++ADDED KEYCHAIN 1 TO HEAVEN AND DID THE EFFECT!+++++++++++++++++")
func remove_keychain_ID_1_effect_heaven():
	heavenstats.subtract_malice(5)
	print_debug("------------REMOVED KEYCHAIN 1 FROM HEAVEN AND DID THE EFFECT!---------------")

### ID_1_KEYCHAIN - HELL
func add_keychain_ID_1_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(heart_increase)
		2:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(heart_increase)
		3:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(heart_increase)
		4:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(heart_increase)
		5:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(heart_increase)
			hellinventory.protections += 1
func remove_keychain_ID_1_effect_hell():
		var heart_decrease = hellstats.max_heart * ID_1_percentage_increase
		hellstats.subtract_heart(heart_decrease)

### ID_2_KEYCHAIN - HEAVEN
func add_keychain_ID_2_effect_heaven():
	heaveninventory.can_parry = true
	print_debug("+++++++++++++++++++ADDED KEYCHAIN 2 TO HEAVEN AND DID THE EFFECT!++++++++++++++++++++++++++++++++++++++")
func remove_keychain_ID_2_effect_heaven():
	heaveninventory.can_parry = false
	print_debug("---------------------------REMOVED KEYCHAIN 2 FROM HEAVEN AND DID THE EFFECT PROPERLY--------------------------")

### ID_2_KEYCHAIN - HELL
func add_keychain_ID_2_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var heart_increase = hellstats.max_heart * .2
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
		2:
			var heart_increase = hellstats.max_heart * .2
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
		3:
			var heart_increase = hellstats.max_heart * .2
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
		4:
			var heart_increase = hellstats.max_heart * .2
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
		5:
			var heart_increase = hellstats.max_heart * .2
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
func remove_keychain_ID_2_effect_hell():
	var heart_decrease = hellstats.max_heart * .2
	hellstats.subtract_max_heart(heart_decrease)
	hellstats.subtract_current_heart(heart_decrease)
#func add_keychain_ID_3_effect_hell():
	#hellinventory.
