extends Node

@onready var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")
@onready var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")

@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")

@export var reset_stats: bool = false
@export var reset_hell_inventory = false

@onready var add_heaven_1 = $AddButtons/HeavenAddButtons/AddHeaven
@onready var add_heaven_2 = $AddButtons/HeavenAddButtons/AddHeaven2
@onready var add_heaven_3 = $AddButtons/HeavenAddButtons/AddHeaven3
@onready var add_heaven_4 = $AddButtons/HeavenAddButtons/AddHeaven4
@onready var add_heaven_5 = $AddButtons/HeavenAddButtons/AddHeaven5
@onready var add_heaven_6 = $AddButtons/HeavenAddButtons/AddHeaven6
@onready var add_heaven_7 = $AddButtons/HeavenAddButtons/AddHeaven7
@onready var add_heaven_8 = $AddButtons/HeavenAddButtons/AddHeaven8
@onready var add_heaven_9 = $AddButtons/HeavenAddButtons/AddHeaven9
@onready var add_heaven_10 = $AddButtons/HeavenAddButtons/AddHeaven10
@onready var add_heaven_11 = $AddButtons/HeavenAddButtons/AddHeaven11
@onready var add_heaven_12 = $AddButtons/HeavenAddButtons/AddHeaven12
@onready var add_heaven_13 = $AddButtons/HeavenAddButtons/AddHeaven13
@onready var add_heaven_14 = $AddButtons/HeavenAddButtons/AddHeaven14
@onready var add_heaven_15 = $AddButtons/HeavenAddButtons/AddHeaven15
@onready var add_heaven_16 = $AddButtons/HeavenAddButtons/AddHeaven16
@onready var add_heaven_17 = $AddButtons/HeavenAddButtons/AddHeaven17
@onready var add_heaven_18 = $AddButtons/HeavenAddButtons/AddHeaven18
@onready var add_heaven_19 = $AddButtons/HeavenAddButtons/AddHeaven19
@onready var add_heaven_20 = $AddButtons/HeavenAddButtons/AddHeaven20

@onready var add_hell_1 = $AddButtons/HellAddButtons/AddHell
@onready var add_hell_2 = $AddButtons/HellAddButtons/AddHell2
@onready var add_hell_3 = $AddButtons/HellAddButtons/AddHell3
@onready var add_hell_4 = $AddButtons/HellAddButtons/AddHell4
@onready var add_hell_5 = $AddButtons/HellAddButtons/AddHell5
@onready var add_hell_6 = $AddButtons/HellAddButtons/AddHell6
@onready var add_hell_7 = $AddButtons/HellAddButtons/AddHell7
@onready var add_hell_8 = $AddButtons/HellAddButtons/AddHell8
@onready var add_hell_9 = $AddButtons/HellAddButtons/AddHell9
@onready var add_hell_10 = $AddButtons/HellAddButtons/AddHell10
@onready var add_hell_11 = $AddButtons/HellAddButtons/AddHell11
@onready var add_hell_12 = $AddButtons/HellAddButtons/AddHell12
@onready var add_hell_13 = $AddButtons/HellAddButtons/AddHell13
@onready var add_hell_14 = $AddButtons/HellAddButtons/AddHell14
@onready var add_hell_15 = $AddButtons/HellAddButtons/AddHell15
@onready var add_hell_16 = $AddButtons/HellAddButtons/AddHell16
@onready var add_hell_17 = $AddButtons/HellAddButtons/AddHell17
@onready var add_hell_18 = $AddButtons/HellAddButtons/AddHell18
@onready var add_hell_19 = $AddButtons/HellAddButtons/AddHell19
@onready var add_hell_20 = $AddButtons/HellAddButtons/AddHell20

@onready var heaven_character_name_text = $"../Stats/HeavenStats/heaven_char_name"
@onready var heaven_move_speed_text = $"../Stats/HeavenStats/heaven_move_speed"
@onready var heaven_run_speed_text = $"../Stats/HeavenStats/heaven_run_speed"
@onready var heaven_max_heart_text = $"../Stats/HeavenStats/heaven_max_heart"
@onready var heaven_heart_text = $"../Stats/HeavenStats/heaven_heart"
@onready var heaven_max_magia_text = $"../Stats/HeavenStats/heaven_max_magia"
@onready var heaven_magia_text = $"../Stats/HeavenStats/heaven_magia"
@onready var heaven_malice_text = $"../Stats/HeavenStats/heaven_malice"
@onready var heaven_deviltry_text = $"../Stats/HeavenStats/heaven_deviltry"
@onready var heaven_guts_text = $"../Stats/HeavenStats/heaven_guts"
@onready var heaven_pain_tolerance_text = $"../Stats/HeavenStats/heaven_pain_tolerance"
@onready var heaven_luck_text = $"../Stats/HeavenStats/heaven_luck"
@onready var heaven_crit_text = $"../Stats/HeavenStats/heaven_crit"
@onready var heaven_crit_level = $"../Stats/HeavenStats/heaven_crit_level"

@onready var hell_character_name_text = $"../Stats/HellStats/hell_char_name"
@onready var hell_move_speed_text = $"../Stats/HellStats/hell_move_speed"
@onready var hell_run_speed_text = $"../Stats/HellStats/hell_run_speed"
@onready var hell_max_heart_text = $"../Stats/HellStats/hell_max_heart"
@onready var hell_heart_text = $"../Stats/HellStats/hell_heart"
@onready var hell_max_magia_text = $"../Stats/HellStats/hell_max_magia"
@onready var hell_magia_text = $"../Stats/HellStats/hell_magia"
@onready var hell_malice_text = $"../Stats/HellStats/hell_malice"
@onready var hell_deviltry_text = $"../Stats/HellStats/hell_deviltry"
@onready var hell_guts_text = $"../Stats/HellStats/hell_guts"
@onready var hell_pain_tolerance_text = $"../Stats/HellStats/hell_pain_tolerance"
@onready var hell_luck_text = $"../Stats/HellStats/hell_luck"
@onready var hell_crit_text = $"../Stats/HellStats/hell_crit"
@onready var hell_crit_level = $"../Stats/HellStats/hell_crit_level"


@export var Keychain_ID_1: KeychainResource 
@export var Keychain_ID_2: KeychainResource 
@export var Keychain_ID_3: KeychainResource 
@export var Keychain_ID_4: KeychainResource 
@export var Keychain_ID_5: KeychainResource 
@export var Keychain_ID_6: KeychainResource 
@export var Keychain_ID_7: KeychainResource 
@export var Keychain_ID_8: KeychainResource 
@export var Keychain_ID_9: KeychainResource 
@export var Keychain_ID_10: KeychainResource 
@export var Keychain_ID_11: KeychainResource 
@export var Keychain_ID_12: KeychainResource 
@export var Keychain_ID_13: KeychainResource 
@export var Keychain_ID_14: KeychainResource 
@export var Keychain_ID_15: KeychainResource 
@export var Keychain_ID_16: KeychainResource 
@export var Keychain_ID_17: KeychainResource 
@export var Keychain_ID_18: KeychainResource 
@export var Keychain_ID_19: KeychainResource 
@export var Keychain_ID_20: KeychainResource 

func _process(delta: float) -> void:
	heaven_character_name_text.text=heavenstats.character_name
	heaven_move_speed_text.text=str(heavenstats.move_speed)
	heaven_run_speed_text.text=str(heavenstats.run_speed)
	heaven_max_heart_text.text=str(heavenstats.max_heart)
	heaven_heart_text.text=str(heavenstats.current_heart)
	heaven_max_magia_text.text=str(heavenstats.max_magia)
	heaven_magia_text.text=str(heavenstats.current_magia)
	heaven_malice_text.text=str(heavenstats.malice)
	heaven_deviltry_text.text=str(heavenstats.deviltry)
	heaven_guts_text.text=str(heavenstats.guts)
	heaven_pain_tolerance_text.text=str(heavenstats.pain_tolerance)
	heaven_luck_text.text=str(heavenstats.luck)
	heaven_crit_text.text=str(heavenstats.crit)
	heaven_crit_level=str(heavenstats.crit_level)
	
	hell_character_name_text.text=hellstats.character_name
	hell_move_speed_text.text=str(hellstats.move_speed)
	hell_run_speed_text.text=str(hellstats.run_speed)
	hell_max_heart_text.text=str(hellstats.max_heart)
	hell_heart_text.text=str(hellstats.current_heart)
	hell_max_magia_text.text=str(hellstats.max_magia)
	hell_magia_text.text=str(hellstats.current_magia)
	hell_malice_text.text=str(hellstats.malice)
	hell_deviltry_text.text=str(hellstats.deviltry)
	hell_guts_text.text=str(hellstats.guts)
	hell_pain_tolerance_text.text=str(hellstats.pain_tolerance)
	hell_luck_text.text=str(hellstats.luck)
	hell_crit_text.text=str(hellstats.crit)
	hell_crit_level=str(hellstats.crit_level)

	heaven_tooltip_assign()
	hell_tooltip_assign()
func heaven_tooltip_assign():
	add_heaven_1.tooltip_text = Keychain_ID_1.keychain_description
	add_heaven_2.tooltip_text = Keychain_ID_2.keychain_description
	add_heaven_3.tooltip_text = Keychain_ID_3.keychain_description
	add_heaven_4.tooltip_text = Keychain_ID_4.keychain_description
	add_heaven_5.tooltip_text = Keychain_ID_5.keychain_description
	add_heaven_6.tooltip_text = Keychain_ID_6.keychain_description
	add_heaven_7.tooltip_text = Keychain_ID_7.keychain_description
	add_heaven_8.tooltip_text = Keychain_ID_8.keychain_description
	add_heaven_9.tooltip_text = Keychain_ID_9.keychain_description
	add_heaven_10.tooltip_text = Keychain_ID_10.keychain_description
	add_heaven_11.tooltip_text = Keychain_ID_11.keychain_description
	add_heaven_12.tooltip_text = Keychain_ID_12.keychain_description
	add_heaven_13.tooltip_text = Keychain_ID_13.keychain_description
	add_heaven_14.tooltip_text = Keychain_ID_14.keychain_description
	add_heaven_15.tooltip_text = Keychain_ID_15.keychain_description
	add_heaven_16.tooltip_text = Keychain_ID_16.keychain_description
	add_heaven_17.tooltip_text = Keychain_ID_17.keychain_description
	add_heaven_18.tooltip_text = Keychain_ID_18.keychain_description
	add_heaven_19.tooltip_text = Keychain_ID_19.keychain_description
	add_heaven_20.tooltip_text = Keychain_ID_20.keychain_description
func hell_tooltip_assign():
	add_hell_1.tooltip_text = Keychain_ID_1.keychain_description
	add_hell_2.tooltip_text = Keychain_ID_2.keychain_description
	add_hell_3.tooltip_text = Keychain_ID_3.keychain_description
	add_hell_4.tooltip_text = Keychain_ID_4.keychain_description
	add_hell_5.tooltip_text = Keychain_ID_5.keychain_description
	add_hell_6.tooltip_text = Keychain_ID_6.keychain_description
	add_hell_7.tooltip_text = Keychain_ID_7.keychain_description
	add_hell_8.tooltip_text = Keychain_ID_8.keychain_description
	add_hell_9.tooltip_text = Keychain_ID_9.keychain_description
	add_hell_10.tooltip_text = Keychain_ID_10.keychain_description
	add_hell_11.tooltip_text = Keychain_ID_11.keychain_description
	add_hell_12.tooltip_text = Keychain_ID_12.keychain_description
	add_hell_13.tooltip_text = Keychain_ID_13.keychain_description
	add_hell_14.tooltip_text = Keychain_ID_14.keychain_description
	add_hell_15.tooltip_text = Keychain_ID_15.keychain_description
	add_hell_16.tooltip_text = Keychain_ID_16.keychain_description
	add_hell_17.tooltip_text = Keychain_ID_17.keychain_description
	add_hell_18.tooltip_text = Keychain_ID_18.keychain_description
	add_hell_19.tooltip_text = Keychain_ID_19.keychain_description
	add_hell_20.tooltip_text = Keychain_ID_20.keychain_description
func _on_add_heaven_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_1)
	KeychainStuff.add_keychain_ID_1_effect_heaven()
	
	ResourceSaver.save(heavenstats)
func _on_add_heaven_2_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_2)
	KeychainStuff.add_keychain_ID_2_effect_heaven()
	
	ResourceSaver.save(heavenstats)
func _on_add_heaven_3_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_3)
	KeychainStuff.add_keychain_ID_3_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_4_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_4)
	KeychainStuff.add_keychain_ID_4_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_5_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_5)
	KeychainStuff.add_keychain_ID_5_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_6_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_6)
	KeychainStuff.add_keychain_ID_6_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_7_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_7)
	KeychainStuff.add_keychain_ID_7_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_8_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_8)
	KeychainStuff.add_keychain_ID_8_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_9_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_9)
	KeychainStuff.add_keychain_ID_9_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_10_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_10)
	KeychainStuff.add_keychain_ID_10_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_11_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_11)
	KeychainStuff.add_keychain_ID_11_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_12_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_12)
	KeychainStuff.add_keychain_ID_12_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_13_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_13)
	KeychainStuff.add_keychain_ID_13_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_14_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_14)
	KeychainStuff.add_keychain_ID_14_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_15_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_15)
	KeychainStuff.add_keychain_ID_15_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_16_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_16)
	KeychainStuff.add_keychain_ID_16_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_17_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_17)
	KeychainStuff.add_keychain_ID_17_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_18_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_18)
	KeychainStuff.add_keychain_ID_18_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_19_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_19)
	KeychainStuff.add_keychain_ID_19_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_heaven_20_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_20)
	KeychainStuff.add_keychain_ID_20_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_add_hell_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_1)
	KeychainStuff.add_keychain_ID_1_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_2_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_2)
	KeychainStuff.add_keychain_ID_2_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_3_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_3)
	KeychainStuff.add_keychain_ID_3_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_4_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_4)
	KeychainStuff.add_keychain_ID_4_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_5_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_5)
	KeychainStuff.add_keychain_ID_5_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_6_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_6)
	KeychainStuff.add_keychain_ID_6_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_7_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_7)
	KeychainStuff.add_keychain_ID_7_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_8_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_8)
	KeychainStuff.add_keychain_ID_8_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_9_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_9)
	KeychainStuff.add_keychain_ID_9_effect_hell()
	ResourceSaver.save(hellstats)

func _on_add_hell_10_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_10)
	KeychainStuff.add_keychain_ID_10_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_11_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_11)
	KeychainStuff.add_keychain_ID_11_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_12_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_12)
	KeychainStuff.add_keychain_ID_12_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_13_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_13)
	KeychainStuff.add_keychain_ID_13_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_14_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_14)
	KeychainStuff.add_keychain_ID_14_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_15_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_15)
	KeychainStuff.add_keychain_ID_3_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_16_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_16)
	KeychainStuff.add_keychain_ID_16_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_17_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_17)
	KeychainStuff.add_keychain_ID_17_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_18_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_18)
	KeychainStuff.add_keychain_ID_18_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_19_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_19)
	KeychainStuff.add_keychain_ID_19_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_add_hell_20_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_20)
	KeychainStuff.add_keychain_ID_20_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_heaven_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_1)
	KeychainStuff.remove_keychain_ID_1_effect_heaven()
	
	ResourceSaver.save(heavenstats)
func _on_remove_heaven_2_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_2)
	KeychainStuff.remove_keychain_ID_2_effect_heaven()
	
	ResourceSaver.save(heavenstats)
func _on_remove_heaven_3_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_3)
	KeychainStuff.remove_keychain_ID_3_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_4_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_4)
	KeychainStuff.remove_keychain_ID_4_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_5_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_5)
	KeychainStuff.remove_keychain_ID_5_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_6_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_6)
	KeychainStuff.remove_keychain_ID_6_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_7_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_7)
	KeychainStuff.remove_keychain_ID_7_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_8_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_8)
	KeychainStuff.remove_keychain_ID_8_effect_heaven()
	
	ResourceSaver.save(heavenstats)
func _on_remove_heaven_9_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_9)
	KeychainStuff.remove_keychain_ID_9_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_10_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_10)
	KeychainStuff.remove_keychain_ID_10_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_11_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_11)
	KeychainStuff.remove_keychain_ID_11_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_12_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_12)
	KeychainStuff.remove_keychain_ID_12_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_13_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_13)
	KeychainStuff.remove_keychain_ID_13_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_14_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_14)
	KeychainStuff.remove_keychain_ID_14_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_15_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_15)
	KeychainStuff.remove_keychain_ID_15_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_16_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_16)
	KeychainStuff.remove_keychain_ID_16_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_17_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_17)
	KeychainStuff.remove_keychain_ID_17_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_18_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_18)
	KeychainStuff.remove_keychain_ID_18_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_19_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_19)
	KeychainStuff.remove_keychain_ID_19_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_heaven_20_pressed() -> void:
	heaveninventory.remove_keychain(Keychain_ID_20)
	KeychainStuff.remove_keychain_ID_20_effect_heaven()
	
	ResourceSaver.save(heavenstats)

func _on_remove_hell_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_1)
	KeychainStuff.remove_keychain_ID_1_effect_hell()
	
	ResourceSaver.save(hellstats)
func _on_remove_hell_2_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_2)
	KeychainStuff.remove_keychain_ID_2_effect_hell()
	
	ResourceSaver.save(hellstats)
func _on_remove_hell_3_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_3)
	KeychainStuff.remove_keychain_ID_3_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_4_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_4)
	KeychainStuff.remove_keychain_ID_4_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_5_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_5)
	KeychainStuff.remove_keychain_ID_5_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_6_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_6)
	KeychainStuff.remove_keychain_ID_6_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_7_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_7)
	KeychainStuff.remove_keychain_ID_7_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_8_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_8)
	KeychainStuff.remove_keychain_ID_8_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_9_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_9)
	KeychainStuff.remove_keychain_ID_9_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_10_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_10)
	KeychainStuff.remove_keychain_ID_10_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_11_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_11)
	KeychainStuff.remove_keychain_ID_11_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_12_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_12)
	KeychainStuff.remove_keychain_ID_12_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_13_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_13)
	KeychainStuff.remove_keychain_ID_13_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_14_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_14)
	KeychainStuff.remove_keychain_ID_14_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_15_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_15)
	KeychainStuff.remove_keychain_ID_15_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_16_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_16)
	KeychainStuff.remove_keychain_ID_16_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_17_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_17)
	KeychainStuff.remove_keychain_ID_17_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_18_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_18)
	KeychainStuff.remove_keychain_ID_18_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_19_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_19)
	KeychainStuff.remove_keychain_ID_19_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_remove_hell_20_pressed() -> void:
	hellinventory.remove_keychain(Keychain_ID_20)
	KeychainStuff.remove_keychain_ID_20_effect_hell()
	
	ResourceSaver.save(hellstats)

func _on_reset_hell_stats_pressed() -> void:
	hellstats.reset_stats()


func _on_reset_heaven_stats_pressed() -> void:
	heavenstats.reset_stats()


func _on_clear_hell_pressed() -> void:
	hellinventory.reset_inventory()


func _on_clear_heaven_pressed() -> void:
	heaveninventory.reset_inventory()


func _on_scene_selector_pressed() -> void:
	YASM.load_scene("res://Scenes/Screens/Main_Menu.tscn")
