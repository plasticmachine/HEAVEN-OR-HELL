extends Node2D

@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")


@onready var user: int = 0

@export_category("KEYCHAIN VALUES")
@export var ID_1_percentage_increase: float = .1
@export var ID_2_percentage_increase: float = .2 
@export var ID_3_percentage_increase: float = .1
@export var ID_4_percentage_increase: float = .2
@export var ID_5_percentage_increase: float = .1
@export var ID_6_percentage_increase: float = .2

@export_category("KEYCHAIN STACK BONUS VALUES")
@export var ID_1_stack_bonus_count: int = 1
@export var ID_2_stack_bonus_count: int = 2
@export var ID_3_stack_bonus_count: int = 3
@export var ID_4_stack_bonus_count: int = 7
@export var ID_5_stack_bonus_count: int = 3
@export var ID_6_stack_bonus_count: int = 7
func check_keychain_added_heaven():
	match heaveninventory.added_effect_ID:
		1:
			add_keychain_ID_1_effect_heaven()
		2:
			add_keychain_ID_2_effect_heaven()
		3:
			add_keychain_ID_3_effect_heaven()
		4:
			add_keychain_ID_4_effect_heaven()
		5:
			add_keychain_ID_5_effect_heaven()
		6:
			add_keychain_ID_6_effect_heaven()
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
		16:
			pass
		17:
			pass
		18:
			pass
		19:
			pass
		20:
			pass
func check_keychain_removed_heaven():
	match heaveninventory.removed_effect_ID:
		1:
			remove_keychain_ID_1_effect_heaven()
		2:
			remove_keychain_ID_2_effect_heaven()
		3:
			remove_keychain_ID_3_effect_heaven()
		4:
			remove_keychain_ID_4_effect_heaven()
		5:
			remove_keychain_ID_5_effect_heaven()
		6:
			remove_keychain_ID_6_effect_heaven()
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
		16:
			pass
		17:
			pass
		18:
			pass
		19:
			pass
		20:
			pass

func check_keychain_added_hell():
	match heaveninventory.added_effect_ID:
		1:
			add_keychain_ID_1_effect_hell()
		2:
			add_keychain_ID_2_effect_hell()
		3:
			add_keychain_ID_3_effect_hell()
		4:
			add_keychain_ID_4_effect_hell()
		5:
			add_keychain_ID_5_effect_hell()
		6:
			add_keychain_ID_6_effect_hell()
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
		16:
			pass
		17:
			pass
		18:
			pass
		19:
			pass
		20:
			pass
func check_keychain_removed_hell():
	match heaveninventory.added_effect_ID:
		1:
			remove_keychain_ID_1_effect_hell()
		2:
			remove_keychain_ID_2_effect_hell()
		3:
			remove_keychain_ID_3_effect_hell()
		4:
			remove_keychain_ID_4_effect_hell()
		5:
			remove_keychain_ID_5_effect_hell()
		6:
			remove_keychain_ID_6_effect_hell()
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
		16:
			pass
		17:
			pass
		18:
			pass
		19:
			pass
		20:
			pass

### ID_1_KEYCHAIN - HEAVEN
func add_keychain_ID_1_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(heart_increase)
		2:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(heart_increase)
		3:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(heart_increase)
		4:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(heart_increase)
		5:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(heart_increase)
			heaveninventory.protections += ID_1_stack_bonus_count
func remove_keychain_ID_1_effect_heaven():
	var heart_decrease = heavenstats.max_heart * ID_1_percentage_increase
	heavenstats.subtract_heart(heart_decrease)
	if heaveninventory.protections > 0:
		heaveninventory.protections -= ID_1_stack_bonus_count
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
			hellinventory.protections += ID_1_stack_bonus_count
func remove_keychain_ID_1_effect_hell():
	var heart_decrease = hellstats.max_heart * ID_1_percentage_increase
	hellstats.subtract_heart(heart_decrease)
	if hellinventory.protections > 0:
		hellinventory.protections -= ID_1_stack_bonus_count
### ID_2_KEYCHAIN - HEAVEN
func add_keychain_ID_2_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(heart_increase)
			#heavenstats.add_heart(heart_increase)
		2:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(heart_increase)
			#heavenstats.add_heart(heart_increase)
		3:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(heart_increase)
			#heavenstats.add_heart(heart_increase)
		4:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(heart_increase)
			#heavenstats.add_heart(heart_increase)
		5:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(heart_increase)
			heaveninventory.protections += ID_2_stack_bonus_count
			#heavenstats.add_heart(heart_increase)
func remove_keychain_ID_2_effect_heaven():
	var heart_decrease = heavenstats.max_heart * ID_2_percentage_increase
	heavenstats.subtract_max_heart(heart_decrease)
	if heaveninventory.protections > 0:
		heaveninventory.protections -= ID_2_stack_bonus_count
### ID_2_KEYCHAIN - HELL
func add_keychain_ID_2_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
		2:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
		3:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
		4:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(heart_increase)
			#hellstats.add_heart(heart_increase)
		5:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(heart_increase)
			hellinventory.protections += ID_2_stack_bonus_count
			#hellstats.add_heart(heart_increase)
func remove_keychain_ID_2_effect_hell():
	var heart_decrease = hellstats.max_heart * ID_2_percentage_increase
	hellstats.subtract_max_heart(heart_decrease)
	hellstats.subtract_current_heart(heart_decrease)
	if hellinventory.protections > 0:
		hellinventory.protections -= ID_2_stack_bonus_count
#func add_keychain_ID_3_effect_hell():
	#hellinventory.
### ID_3_KEYCHAIN - HEAVEN
func add_keychain_ID_3_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(deviltry_increase)
		2:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(deviltry_increase)
		3:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(deviltry_increase)
		4:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(deviltry_increase)
		5:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(deviltry_increase)
			heaveninventory.deviltry_max_variances += ID_3_stack_bonus_count
func remove_keychain_ID_3_effect_heaven():
	var deviltry_decrease = heavenstats.deviltry * ID_3_percentage_increase
	heavenstats.subtract_deviltry(deviltry_decrease)
	if heaveninventory.deviltry_max_variances > 0:
		heaveninventory.deviltry_max_variances -= ID_3_stack_bonus_count
### ID_3_KEYCHAIN - HELL
func add_keychain_ID_3_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(deviltry_increase)
		2:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(deviltry_increase)
		3:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(deviltry_increase)
		4:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(deviltry_increase)
		5:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(deviltry_increase)
			hellinventory.deviltry_max_variances += ID_3_stack_bonus_count
func remove_keychain_ID_3_effect_hell():
	var deviltry_decrease = hellstats.deviltry * ID_3_percentage_increase
	hellstats.subtract_deviltry(deviltry_decrease)
	hellstats.subtract_deviltry(deviltry_decrease)
	if hellinventory.deviltry_max_variances > 0:
		hellinventory.deviltry_max_variances -= ID_3_stack_bonus_count
### ID_4_KEYCHAIN - HEAVEN
func add_keychain_ID_4_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var deviltry_increase = heavenstats.deviltry * ID_4_stack_bonus_count
			heavenstats.add_deviltry(deviltry_increase)
		2:
			var deviltry_increase = heavenstats.deviltry * ID_4_stack_bonus_count
			heavenstats.add_deviltry(deviltry_increase)
		3:
			var deviltry_increase = heavenstats.deviltry * ID_4_stack_bonus_count
			heavenstats.add_deviltry(deviltry_increase)
		4:
			var deviltry_increase = heavenstats.deviltry *ID_4_stack_bonus_count
			heavenstats.add_deviltry(deviltry_increase)
		5:
			var deviltry_increase = heavenstats.deviltry * ID_4_stack_bonus_count
			heavenstats.add_deviltry(deviltry_increase)
			heaveninventory.deviltry_max_variances += ID_4_stack_bonus_count
func remove_keychain_ID_4_effect_heaven():
	var deviltry_decrease = heavenstats.deviltry * ID_4_stack_bonus_count
	heavenstats.subtract_deviltry(deviltry_decrease)
	heavenstats.subtract_deviltry(deviltry_decrease)
	if heaveninventory.deviltry_max_variances > 0:
		heaveninventory.deviltry_max_variances -= ID_4_stack_bonus_count
### ID_4_KEYCHAIN - HELL
func add_keychain_ID_4_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var deviltry_increase = hellstats.deviltry * ID_4_stack_bonus_count
			hellstats.add_deviltry(deviltry_increase)
		2:
			var deviltry_increase = hellstats.deviltry * ID_4_stack_bonus_count
			hellstats.add_deviltry(deviltry_increase)
		3:
			var deviltry_increase = hellstats.deviltry * ID_4_stack_bonus_count
			hellstats.add_deviltry(deviltry_increase)
		4:
			var deviltry_increase = hellstats.deviltry *ID_4_stack_bonus_count
			hellstats.add_deviltry(deviltry_increase)
		5:
			var deviltry_increase = hellstats.deviltry * ID_4_stack_bonus_count
			hellstats.add_deviltry(deviltry_increase)
			hellinventory.deviltry_max_variances += ID_4_stack_bonus_count
func remove_keychain_ID_4_effect_hell():
	var deviltry_decrease = hellstats.deviltry * ID_4_stack_bonus_count
	hellstats.subtract_deviltry(deviltry_decrease)
	if hellinventory.deviltry_max_variances > 0:
		hellinventory.deviltry_max_variances -= ID_4_stack_bonus_count
### ID_5_KEYCHAIN - HEAVEN
func add_keychain_ID_5_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var malice_increase = heavenstats.malice * ID_5_stack_bonus_count
			heavenstats.add_malice(malice_increase)
		2:
			var malice_increase = heavenstats.malice * ID_5_stack_bonus_count
			heavenstats.add_malice(malice_increase)
		3:
			var malice_increase = heavenstats.malice * ID_5_stack_bonus_count
			heavenstats.add_malice(malice_increase)
		5:
			var malice_increase = heavenstats.malice *ID_5_stack_bonus_count
			heavenstats.add_malice(malice_increase)
		5:
			var malice_increase = heavenstats.malice * ID_5_stack_bonus_count
			heavenstats.add_malice(malice_increase)
			heaveninventory.malice_max_variances += ID_5_stack_bonus_count
func remove_keychain_ID_5_effect_heaven():
	var malice_decrease = heavenstats.malice * ID_5_stack_bonus_count
	heavenstats.subtract_malice(malice_decrease)
	if heaveninventory.malice_max_variances > 0:
		heaveninventory.malice_max_variances -= ID_5_stack_bonus_count
### ID_5_KEYCHAIN - HELL
func add_keychain_ID_5_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var malice_increase = hellstats.malice * ID_5_stack_bonus_count
			hellstats.add_malice(malice_increase)
		2:
			var malice_increase = hellstats.malice * ID_5_stack_bonus_count
			hellstats.add_malice(malice_increase)
		3:
			var malice_increase = hellstats.malice * ID_5_stack_bonus_count
			hellstats.add_malice(malice_increase)
		5:
			var malice_increase = hellstats.malice *ID_5_stack_bonus_count
			hellstats.add_malice(malice_increase)
		5:
			var malice_increase = hellstats.malice * ID_5_stack_bonus_count
			hellstats.add_malice(malice_increase)
			hellinventory.malice_max_variances += ID_5_stack_bonus_count
func remove_keychain_ID_5_effect_hell():
	var malice_decrease = hellstats.malice * ID_5_stack_bonus_count
	hellstats.subtract_malice(malice_decrease)
	if hellinventory.malice_max_variances > 0:
		hellinventory.malice_max_variances -= ID_5_stack_bonus_count
### ID_6_KEYCHAIN - HEAVEN
func add_keychain_ID_6_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var malice_increase = heavenstats.malice * ID_6_stack_bonus_count
			heavenstats.add_malice(malice_increase)
		2:
			var malice_increase = heavenstats.malice * ID_6_stack_bonus_count
			heavenstats.add_malice(malice_increase)
		3:
			var malice_increase = heavenstats.malice * ID_6_stack_bonus_count
			heavenstats.add_malice(malice_increase)
		6:
			var malice_increase = heavenstats.malice *ID_6_stack_bonus_count
			heavenstats.add_malice(malice_increase)
		6:
			var malice_increase = heavenstats.malice * ID_6_stack_bonus_count
			heavenstats.add_malice(malice_increase)
			heaveninventory.malice_max_variances += ID_6_stack_bonus_count
func remove_keychain_ID_6_effect_heaven():
	var malice_decrease = heavenstats.malice * ID_6_stack_bonus_count
	heavenstats.subtract_malice(malice_decrease)
	if heaveninventory.malice_max_variances > 0:
		heaveninventory.malice_max_variances -= ID_6_stack_bonus_count
### ID_6_KEYCHAIN - HELL
func add_keychain_ID_6_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var malice_increase = hellstats.malice * ID_6_stack_bonus_count
			hellstats.add_malice(malice_increase)
		2:
			var malice_increase = hellstats.malice * ID_6_stack_bonus_count
			hellstats.add_malice(malice_increase)
		3:
			var malice_increase = hellstats.malice * ID_6_stack_bonus_count
			hellstats.add_malice(malice_increase)
		6:
			var malice_increase = hellstats.malice *ID_6_stack_bonus_count
			hellstats.add_malice(malice_increase)
		6:
			var malice_increase = hellstats.malice * ID_6_stack_bonus_count
			hellstats.add_malice(malice_increase)
			hellinventory.malice_max_variances += ID_6_stack_bonus_count
func remove_keychain_ID_6_effect_hell():
	var malice_decrease = hellstats.malice * ID_6_stack_bonus_count
	hellstats.subtract_malice(malice_decrease)
	if hellinventory.malice_max_variances > 0:
		hellinventory.malice_max_variances -= ID_6_stack_bonus_count
### ID_7_KEYCHAIN - HEAVEN
### ID_7_KEYCHAIN - HELL
### ID_8_KEYCHAIN - HEAVEN
### ID_8_KEYCHAIN - HELL
### ID_9_KEYCHAIN - HEAVEN
### ID_9_KEYCHAIN - HELL
### ID_10_KEYCHAIN - HEAVEN
### ID_10_KEYCHAIN - HELL
### ID_11_KEYCHAIN - HEAVEN
### ID_11_KEYCHAIN - HELL
### ID_12_KEYCHAIN - HEAVEN
### ID_12_KEYCHAIN - HELL
### ID_13_KEYCHAIN - HEAVEN
### ID_13_KEYCHAIN - HELL
### ID_14_KEYCHAIN - HEAVEN
### ID_14_KEYCHAIN - HELL
### ID_15_KEYCHAIN - HEAVEN
### ID_15_KEYCHAIN - HELL
### ID_16_KEYCHAIN - HEAVEN
### ID_16_KEYCHAIN - HELL
### ID_17_KEYCHAIN - HEAVEN
### ID_17_KEYCHAIN - HELL
### ID_18_KEYCHAIN - HEAVEN
### ID_18_KEYCHAIN - HELL
### ID_19_KEYCHAIN - HEAVEN
### ID_19_KEYCHAIN - HELL
### ID_20_KEYCHAIN - HEAVEN
### ID_20_KEYCHAIN - HELL
