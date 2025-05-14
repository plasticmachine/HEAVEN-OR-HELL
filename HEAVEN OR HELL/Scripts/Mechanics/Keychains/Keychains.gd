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
@export var ID_7_percentage_increase: float = .1
@export var ID_8_percentage_increase: float = .2

@export var ID_1_flat_increase: int = 10 # increases HEART
@export var ID_2_flat_increase: int = 20 # increases HEART II
@export var ID_3_flat_increase: int = 5 # increases MALICE
@export var ID_4_flat_increase: int = 10 # increases MALICE II
@export var ID_5_flat_increase: int = 5 # increases DEVILTRY 
@export var ID_6_flat_increase: int = 10 # increases DEVILTRY II
@export var ID_8_flat_increase: int = 10 # increases MAGIA
@export var ID_9_flat_increase: int = 20 # increases MAGIA II
@export var ID_10_flat_increase: int = 15 # increases CRIT I (FIRST STACK)
@export var ID_10_2_flat_increase: int = 10 # increases CRIT I (2-5TH STACK)
@export var ID_11_flat_increase: int =  30 # increases CRIT II 
@export var ID_13_flat_increase: float = .2 # increases LUCK I (FIRST STACK)
@export var ID_13_2_flat_increase: float = .1 # increases LUCK I (2-5TH STACK)
@export var ID_14_flat_decrease: float = .2 # decreases LUCK I 




@export_category("KEYCHAIN STACK BONUS VALUES")
@export var ID_1_stack_bonus_count: int = 1 # protections
@export var ID_2_stack_bonus_count: int = 2 # protections II
@export var ID_3_stack_bonus_count: int = 3 # max variances MALICE
@export var ID_4_stack_bonus_count: int = 7 # max variances MALICE II
@export var ID_5_stack_bonus_count: int = 3 # max variances DEVILTRY
@export var ID_6_stack_bonus_count: int = 7 # max variances DEVILTRY II
@export var ID_8_stack_bonus_count: int = 1 # zero magia spends
@export var ID_9_stack_bonus_count: int = 2 # mzero magia spends II
@export var ID_10_stack_bonus_count: int 
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
			remove_keychain_ID_7_effect_heaven()
		8:
			remove_keychain_ID_6_effect_heaven()
		9:
			remove_keychain_ID_6_effect_heaven()
		10:
			remove_keychain_ID_6_effect_heaven()
		11:
			remove_keychain_ID_6_effect_heaven()
		12:
			remove_keychain_ID_6_effect_heaven()
		13:
			remove_keychain_ID_6_effect_heaven()
		14:
			remove_keychain_ID_6_effect_heaven()
		15:
			remove_keychain_ID_6_effect_heaven()
		16:
			remove_keychain_ID_6_effect_heaven()
		17:
			remove_keychain_ID_6_effect_heaven()
		18:
			remove_keychain_ID_6_effect_heaven()
		19:
			remove_keychain_ID_6_effect_heaven()
		20:
			remove_keychain_ID_6_effect_heaven()

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
			heavenstats.add_max_heart(ID_1_flat_increase)
		2:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(ID_1_flat_increase)
		3:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(ID_1_flat_increase)
		4:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(ID_1_flat_increase)
		5:
			var heart_increase = heavenstats.max_heart * ID_1_percentage_increase
			heavenstats.add_max_heart(ID_1_flat_increase)
			heaveninventory.protections += ID_1_stack_bonus_count
func remove_keychain_ID_1_effect_heaven():
	var heart_decrease = heavenstats.max_heart * ID_1_percentage_increase
	heavenstats.subtract_heart(ID_1_flat_increase)
	if heaveninventory.protections > 0:
		heaveninventory.protections -= ID_1_stack_bonus_count
### ID_1_KEYCHAIN - HELL
func add_keychain_ID_1_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(ID_1_flat_increase)
		2:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(ID_1_flat_increase)
		3:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(ID_1_flat_increase)
		4:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(ID_1_flat_increase)
		5:
			var heart_increase = hellstats.max_heart * ID_1_percentage_increase
			hellstats.add_max_heart(ID_1_flat_increase)
			hellinventory.protections += ID_1_stack_bonus_count
func remove_keychain_ID_1_effect_hell():
	var heart_decrease = hellstats.max_heart * ID_1_percentage_increase
	hellstats.subtract_heart(ID_1_flat_increase)
	if hellinventory.protections > 0:
		hellinventory.protections -= ID_1_stack_bonus_count
### ID_2_KEYCHAIN - HEAVEN
func add_keychain_ID_2_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(ID_2_flat_increase)
			#heavenstats.add_heart(ID_2_flat_increase)
		2:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(ID_2_flat_increase)
			#heavenstats.add_heart(ID_2_flat_increase)
		3:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(ID_2_flat_increase)
			#heavenstats.add_heart(ID_2_flat_increase)
		4:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(ID_2_flat_increase)
			#heavenstats.add_heart(ID_2_flat_increase)
		5:
			var heart_increase = heavenstats.max_heart * ID_2_percentage_increase
			heavenstats.add_max_heart(ID_2_flat_increase)
			heaveninventory.protections += ID_2_stack_bonus_count
			#heavenstats.add_heart(ID_2_flat_increase)
func remove_keychain_ID_2_effect_heaven():
	var heart_decrease = heavenstats.max_heart * ID_2_percentage_increase
	heavenstats.subtract_max_heart(ID_2_flat_increase)
	if heaveninventory.protections > 0:
		heaveninventory.protections -= ID_2_stack_bonus_count
### ID_2_KEYCHAIN - HELL
func add_keychain_ID_2_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(ID_2_flat_increase)
			#hellstats.add_heart(ID_2_flat_increase)
		2:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(ID_2_flat_increase)
			#hellstats.add_heart(ID_2_flat_increase)
		3:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(ID_2_flat_increase)
			#hellstats.add_heart(ID_2_flat_increase)
		4:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(ID_2_flat_increase)
			#hellstats.add_heart(ID_2_flat_increase)
		5:
			var heart_increase = hellstats.max_heart * ID_2_percentage_increase
			hellstats.add_max_heart(ID_2_flat_increase)
			hellinventory.protections += ID_2_stack_bonus_count
			#hellstats.add_heart(ID_2_flat_increase)
func remove_keychain_ID_2_effect_hell():
	var heart_decrease = hellstats.max_heart * ID_2_percentage_increase
	hellstats.subtract_max_heart(ID_2_flat_increase)
	if hellinventory.protections > 0:
		hellinventory.protections -= ID_2_stack_bonus_count
#func add_keychain_ID_3_effect_hell():
	#hellinventory.
### ID_3_KEYCHAIN - HEAVEN
func add_keychain_ID_3_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(ID_3_flat_increase)
		2:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(ID_3_flat_increase)
		3:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(ID_3_flat_increase)
		4:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(ID_3_flat_increase)
		5:
			var deviltry_increase = heavenstats.deviltry * ID_3_percentage_increase
			heavenstats.add_deviltry(ID_3_flat_increase)
			heaveninventory.deviltry_max_variances += ID_3_stack_bonus_count
func remove_keychain_ID_3_effect_heaven():
	var deviltry_decrease = heavenstats.deviltry * ID_3_percentage_increase
	heavenstats.subtract_deviltry(ID_3_flat_increase)
	if heaveninventory.deviltry_max_variances > 0:
		heaveninventory.deviltry_max_variances -= ID_3_stack_bonus_count
### ID_3_KEYCHAIN - HELL
func add_keychain_ID_3_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(ID_3_flat_increase)
		2:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(ID_3_flat_increase)
		3:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(ID_3_flat_increase)
		4:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(ID_3_flat_increase)
		5:
			var deviltry_increase = hellstats.deviltry * ID_3_percentage_increase
			hellstats.add_deviltry(ID_3_flat_increase)
			hellinventory.deviltry_max_variances += ID_3_stack_bonus_count
func remove_keychain_ID_3_effect_hell():
	var deviltry_decrease = hellstats.deviltry * ID_3_percentage_increase
	hellstats.subtract_deviltry(ID_3_flat_increase)
	if hellinventory.deviltry_max_variances > 0:
		hellinventory.deviltry_max_variances -= ID_3_stack_bonus_count
### ID_4_KEYCHAIN - HEAVEN
func add_keychain_ID_4_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var deviltry_increase = heavenstats.deviltry * ID_4_percentage_increase
			heavenstats.add_deviltry(ID_4_flat_increase)
		2:
			var deviltry_increase = heavenstats.deviltry * ID_4_percentage_increase
			heavenstats.add_deviltry(ID_4_flat_increase)
		3:
			var deviltry_increase = heavenstats.deviltry * ID_4_percentage_increase
			heavenstats.add_deviltry(ID_4_flat_increase)
		4:
			var deviltry_increase = heavenstats.deviltry * ID_4_percentage_increase
			heavenstats.add_deviltry(ID_4_flat_increase)
		5:
			var deviltry_increase = heavenstats.deviltry * ID_4_percentage_increase
			heavenstats.add_deviltry(ID_4_flat_increase)
			heaveninventory.deviltry_max_variances += ID_4_stack_bonus_count
func remove_keychain_ID_4_effect_heaven():
	var deviltry_decrease = heavenstats.deviltry * ID_4_percentage_increase
	heavenstats.subtract_deviltry(ID_4_flat_increase)
	if heaveninventory.deviltry_max_variances > 0:
		heaveninventory.deviltry_max_variances -= ID_4_stack_bonus_count
### ID_4_KEYCHAIN - HELL
func add_keychain_ID_4_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var deviltry_increase = hellstats.deviltry * ID_4_percentage_increase
			hellstats.add_deviltry(ID_4_flat_increase)
		2:
			var deviltry_increase = hellstats.deviltry * ID_4_percentage_increase
			hellstats.add_deviltry(ID_4_flat_increase)
		3:
			var deviltry_increase = hellstats.deviltry * ID_4_percentage_increase
			hellstats.add_deviltry(ID_4_flat_increase)
		4:
			var deviltry_increase = hellstats.deviltry * ID_4_percentage_increase
			hellstats.add_deviltry(ID_4_flat_increase)
		5:
			var deviltry_increase = hellstats.deviltry * ID_4_percentage_increase
			hellstats.add_deviltry(ID_4_flat_increase)
			hellinventory.deviltry_max_variances += ID_4_stack_bonus_count
func remove_keychain_ID_4_effect_hell():
	var deviltry_decrease = hellstats.deviltry * ID_4_percentage_increase
	hellstats.subtract_deviltry(ID_4_flat_increase)
	if hellinventory.deviltry_max_variances > 0:
		hellinventory.deviltry_max_variances -= ID_4_stack_bonus_count
### ID_5_KEYCHAIN - HEAVEN
func add_keychain_ID_5_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var malice_increase = heavenstats.malice * ID_5_percentage_increase
			heavenstats.add_malice(ID_5_flat_increase)
		2:
			var malice_increase = heavenstats.malice * ID_5_percentage_increase
			heavenstats.add_malice(ID_5_flat_increase)
		3:
			var malice_increase = heavenstats.malice * ID_5_percentage_increase
			heavenstats.add_malice(ID_5_flat_increase)
		5:
			var malice_increase = heavenstats.malice *ID_5_percentage_increase
			heavenstats.add_malice(ID_5_flat_increase)
		5:
			var malice_increase = heavenstats.malice * ID_5_percentage_increase
			heavenstats.add_malice(ID_5_flat_increase)
			heaveninventory.malice_max_variances += ID_5_stack_bonus_count
func remove_keychain_ID_5_effect_heaven():
	var malice_decrease = heavenstats.malice * ID_5_percentage_increase
	heavenstats.subtract_malice(ID_5_flat_increase)
	if heaveninventory.malice_max_variances > 0:
		heaveninventory.malice_max_variances -= ID_5_stack_bonus_count
### ID_5_KEYCHAIN - HELL
func add_keychain_ID_5_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var malice_increase = hellstats.malice * ID_5_percentage_increase
			hellstats.add_malice(ID_5_flat_increase)
		2:
			var malice_increase = hellstats.malice * ID_5_percentage_increase
			hellstats.add_malice(ID_5_flat_increase)
		3:
			var malice_increase = hellstats.malice * ID_5_percentage_increase
			hellstats.add_malice(ID_5_flat_increase)
		5:
			var malice_increase = hellstats.malice *ID_5_percentage_increase
			hellstats.add_malice(ID_5_flat_increase)
		5:
			var malice_increase = hellstats.malice * ID_5_percentage_increase
			hellstats.add_malice(ID_5_flat_increase)
			hellinventory.malice_max_variances += ID_5_stack_bonus_count
func remove_keychain_ID_5_effect_hell():
	var malice_decrease = hellstats.malice * ID_5_stack_bonus_count
	hellstats.subtract_malice(ID_5_flat_increase)
	if hellinventory.malice_max_variances > 0:
		hellinventory.malice_max_variances -= ID_5_stack_bonus_count
### ID_6_KEYCHAIN - HEAVEN
func add_keychain_ID_6_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			var malice_increase = heavenstats.malice * ID_6_percentage_increase
			heavenstats.add_malice(ID_6_flat_increase)
		2:
			var malice_increase = heavenstats.malice * ID_6_percentage_increase
			heavenstats.add_malice(ID_6_flat_increase)
		3:
			var malice_increase = heavenstats.malice * ID_6_percentage_increase
			heavenstats.add_malice(ID_6_flat_increase)
		6:
			var malice_increase = heavenstats.malice *ID_6_percentage_increase
			heavenstats.add_malice(ID_6_flat_increase)
		6:
			var malice_increase = heavenstats.malice * ID_6_percentage_increase
			heavenstats.add_malice(ID_6_flat_increase)
			heaveninventory.malice_max_variances += ID_6_stack_bonus_count
func remove_keychain_ID_6_effect_heaven():
	var malice_decrease = heavenstats.malice * ID_6_stack_bonus_count
	heavenstats.subtract_malice(ID_6_flat_increase)
	if heaveninventory.malice_max_variances > 0:
		heaveninventory.malice_max_variances -= ID_6_stack_bonus_count
### ID_6_KEYCHAIN - HELL
func add_keychain_ID_6_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			var malice_increase = hellstats.malice * ID_6_percentage_increase
			hellstats.add_malice(ID_6_flat_increase)
		2:
			var malice_increase = hellstats.malice * ID_6_percentage_increase
			hellstats.add_malice(ID_6_flat_increase)
		3:
			var malice_increase = hellstats.malice * ID_6_percentage_increase
			hellstats.add_malice(ID_6_flat_increase)
		6:
			var malice_increase = hellstats.malice *ID_6_percentage_increase
			hellstats.add_malice(ID_6_flat_increase)
		6:
			var malice_increase = hellstats.malice * ID_6_percentage_increase
			hellstats.add_malice(ID_6_flat_increase)
			hellinventory.malice_max_variances += ID_6_stack_bonus_count
func remove_keychain_ID_6_effect_hell():
	var malice_decrease = hellstats.malice * ID_6_stack_bonus_count
	hellstats.subtract_malice(ID_6_flat_increase)
	if hellinventory.malice_max_variances > 0:
		hellinventory.malice_max_variances -= ID_6_stack_bonus_count
### ID_7_KEYCHAIN - HEAVEN
func add_keychain_ID_7_effect_heaven():
	heaveninventory.misanthropist = true
	match heaveninventory.current_slot_stack:
		1:
			heaveninventory.misanthropist_turns = 1
		2:
			heaveninventory.misanthropist_turns = 2
		3:
			heaveninventory.misanthropist_turns = 3
		4:
			heaveninventory.misanthropist_turns = 4
		5:
			heaveninventory.misanthropist_turns = 5
func remove_keychain_ID_7_effect_heaven():
	heaveninventory.misanthropist = false
	heaveninventory.misanthropist_turns -= 1
### ID_7_KEYCHAIN - HELL
func add_keychain_ID_7_effect_hell():
	hellinventory.misanthropist = true
	match hellinventory.current_slot_stack:
		1:
			hellinventory.misanthropist_turns = 1
		2:
			hellinventory.misanthropist_turns = 2
		3:
			hellinventory.misanthropist_turns = 3
		4:
			hellinventory.misanthropist_turns = 4
		5:
			hellinventory.misanthropist_turns = 5
func remove_keychain_7_effect_hell():
	hellinventory.misanthropist = false
	hellinventory.misanthropist_turns -= 1
# +max_magia(1)
### ID_8_KEYCHAIN - HEAVEN
func add_keychain_8_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			heavenstats.add_max_magia(ID_8_flat_increase)
		2:
			heavenstats.add_max_magia(ID_8_flat_increase)
		3:
			heavenstats.add_max_magia(ID_8_flat_increase)
		4:
			heavenstats.add_max_magia(ID_8_flat_increase)
		5:
			heavenstats.add_max_magia(ID_8_flat_increase)
			heaveninventory.zero_magia_spends += ID_8_stack_bonus_count  #?? i have no clue if this will be broken
func remove_keychain_8_effect_heaven():
	heavenstats.subtract_max_magia(ID_8_flat_increase)
	if heaveninventory.zero_magia_spends > 0:
		heaveninventory.zero_magia_spends -= ID_8_stack_bonus_count
### ID_8_KEYCHAIN - HELL
func add_keychain_8_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			hellstats.add_max_magia(ID_8_flat_increase)
		2:
			hellstats.add_max_magia(ID_8_flat_increase)
		3:
			hellstats.add_max_magia(ID_8_flat_increase)
		4:
			hellstats.add_max_magia(ID_8_flat_increase)
		5:
			hellstats.add_max_magia(ID_8_flat_increase)
			hellinventory.zero_magia_spends += ID_8_stack_bonus_count  #?? i have no clue if this will be broken
func remove_keychain_8_effect_hell():
	hellstats.subtract_max_magia(ID_8_flat_increase)
	if hellinventory.zero_magia_spends > 0:
		hellinventory.zero_magia_spends -= ID_8_stack_bonus_count
### ID_9_KEYCHAIN - HEAVEN
func add_keychain_9_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			heavenstats.add_max_magia(ID_9_flat_increase)
		2:
			heavenstats.add_max_magia(ID_9_flat_increase)
		3:
			heavenstats.add_max_magia(ID_9_flat_increase)
		4:
			heavenstats.add_max_magia(ID_9_flat_increase)
		5:
			heavenstats.add_max_magia(ID_9_flat_increase)
			heaveninventory.zero_magia_spends += ID_9_stack_bonus_count  #?? i have no clue if this will be broken
func remove_keychain_9_effect_heaven():
	heavenstats.subtract_max_magia(ID_9_flat_increase)
	if heaveninventory.zero_magia_spends > 0:
		heaveninventory.zero_magia_spends -= ID_9_stack_bonus_count
### ID_9_KEYCHAIN - HELL
func add_keychain_9_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			hellstats.add_max_magia(ID_9_flat_increase)
		2:
			hellstats.add_max_magia(ID_9_flat_increase)
		3:
			hellstats.add_max_magia(ID_9_flat_increase)
		4:
			hellstats.add_max_magia(ID_9_flat_increase)
		5:
			hellstats.add_max_magia(ID_9_flat_increase)
			hellinventory.zero_magia_spends += ID_9_stack_bonus_count #?? i have no clue if this will be broken
func remove_keychain_9_effect_hell():
	hellstats.subtract_max_magia(ID_9_flat_increase)
	if hellinventory.zero_magia_spends > 0:
		hellinventory.zero_magia_spends -= ID_9_stack_bonus_count
### ID_10_KEYCHAIN - HEAVEN
func add_keychain_10_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			heavenstats.add_crit(ID_10_flat_increase)
		2:
			heavenstats.add_crit(ID_10_2_flat_increase)
		3:
			heavenstats.add_crit(ID_10_2_flat_increase)
		4:
			heavenstats.add_crit(ID_10_2_flat_increase)
		5:
			heavenstats.add_crit(ID_10_2_flat_increase)
func remove_keychain_10_effect_heaven():
	heavenstats.subtract_crit(ID_10_flat_increase)
### ID_10_KEYCHAIN - HELL
func add_keychain_10_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			hellstats.add_crit(ID_10_flat_increase)
		2:
			hellstats.add_crit(ID_10_2_flat_increase)
		3:
			hellstats.add_crit(ID_10_2_flat_increase)
		4:
			hellstats.add_crit(ID_10_2_flat_increase)
		5:
			hellstats.add_crit(ID_10_2_flat_increase)
func remove_keychain_10_effect_hell():
	hellstats.subtract_crit(ID_10_flat_increase)
### ID_11_KEYCHAIN - HEAVEN
func add_keychain_11_effect_heaven():
	match heaveninventory.current_slot_stack:
		1:
			heavenstats.add_crit(ID_11_flat_increase)
		2:
			heavenstats.add_crit(ID_11_flat_increase)
		3:
			heavenstats.add_crit(ID_11_flat_increase)
		4:
			heavenstats.add_crit(ID_11_flat_increase)
		5:
			heavenstats.add_crit(ID_11_flat_increase)
func remove_keychain_11_effect_heaven():
	heavenstats.subtract_crit(ID_11_flat_increase)
### ID_11_KEYCHAIN - HELL
func add_keychain_11_effect_hell():
	match hellinventory.current_slot_stack:
		1:
			hellstats.add_crit(ID_11_flat_increase)
		2:
			hellstats.add_crit(ID_11_flat_increase)
		3:
			hellstats.add_crit(ID_11_flat_increase)
		4:
			hellstats.add_crit(ID_11_flat_increase)
		5:
			hellstats.add_crit(ID_11_flat_increase)
func remove_keychain_11_effect_hell():
	hellstats.subtract_crit(ID_11_flat_increase)
### ID_12_KEYCHAIN - HEAVEN
func add_keychain_12_effect_heaven():
	match heaveninventory.current_slot_stack:
		2:
			heavenstats.add_crit(25)
			heaveninventory.frenesi_actions += 1
		4:
			heaveninventory.frenesi_actions += 1
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
