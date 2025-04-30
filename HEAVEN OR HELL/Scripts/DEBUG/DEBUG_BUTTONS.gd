extends Node

@onready var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")
@onready var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")

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

func _on_add_heaven_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_1)
	KeychainStuff.add_keychain_ID_1_effect_heaven()
	ResourceSaver.save(heaveninventory)
	
func _on_add_heaven_2_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_2)
	KeychainStuff.add_keychain_ID_2_effect_heaven()
	ResourceSaver.save(heaveninventory)

func _on_add_heaven_3_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_3)
	KeychainStuff.add_keychain_ID_3_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_4_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_4)
	KeychainStuff.add_keychain_ID_4_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_5_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_5)
	KeychainStuff.add_keychain_ID_5_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_6_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_6)
	KeychainStuff.add_keychain_ID_6_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_7_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_7)
	KeychainStuff.add_keychain_ID_7_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_8_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_8)
	KeychainStuff.add_keychain_ID_8_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_9_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_9)
	KeychainStuff.add_keychain_ID_9_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_10_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_10)
	KeychainStuff.add_keychain_ID_10_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_11_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_11)
	KeychainStuff.add_keychain_ID_11_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_12_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_12)
	KeychainStuff.add_keychain_ID_12_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_13_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_13)
	KeychainStuff.add_keychain_ID_13_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_14_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_14)
	KeychainStuff.add_keychain_ID_14_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_15_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_15)
	KeychainStuff.add_keychain_ID_15_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_16_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_16)
	KeychainStuff.add_keychain_ID_16_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_17_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_17)
	KeychainStuff.add_keychain_ID_17_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_18_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_18)
	KeychainStuff.add_keychain_ID_18_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_19_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_19)
	KeychainStuff.add_keychain_ID_19_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_heaven_20_pressed() -> void:
	heaveninventory.add_keychain(Keychain_ID_20)
	KeychainStuff.add_keychain_ID_20_effect_heaven()
	ResourceSaver.save(heaveninventory)


func _on_add_hell_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_1)
	KeychainStuff.add_keychain_ID_1_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_2_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_2)
	KeychainStuff.add_keychain_ID_2_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_3_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_3)
	KeychainStuff.add_keychain_ID_3_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_4_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_4)
	KeychainStuff.add_keychain_ID_4_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_5_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_5)
	KeychainStuff.add_keychain_ID_5_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_6_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_6)
	KeychainStuff.add_keychain_ID_6_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_7_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_7)
	KeychainStuff.add_keychain_ID_7_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_8_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_8)
	KeychainStuff.add_keychain_ID_8_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_9_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_9)
	KeychainStuff.add_keychain_ID_9_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_10_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_10)
	KeychainStuff.add_keychain_ID_10_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_11_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_11)
	KeychainStuff.add_keychain_ID_11_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_12_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_12)
	KeychainStuff.add_keychain_ID_12_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_13_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_13)
	KeychainStuff.add_keychain_ID_13_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_14_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_14)
	KeychainStuff.add_keychain_ID_14_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_15_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_15)
	KeychainStuff.add_keychain_ID_3_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_16_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_16)
	KeychainStuff.add_keychain_ID_16_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_17_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_17)
	KeychainStuff.add_keychain_ID_17_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_18_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_18)
	KeychainStuff.add_keychain_ID_18_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_19_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_19)
	KeychainStuff.add_keychain_ID_19_effect_hell()
	ResourceSaver.save(hellinventory)


func _on_add_hell_20_pressed() -> void:
	hellinventory.add_keychain(Keychain_ID_20)
	KeychainStuff.add_keychain_ID_20_effect_hell()
	ResourceSaver.save(hellinventory)
