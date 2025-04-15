extends Node2D

var keychain_ID_1 = preload("res://Resources/Keychains/TEST/Test1.tres")
var keychain_ID_2 = preload("res://Resources/Keychains/TEST/Test2.tres")
var keychain_ID_3 = preload("res://Resources/Keychains/TEST/Test3.tres")

var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")
var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")

func _process(delta):
	if Input.is_action_just_pressed("DEBUG_heaven_add_test_keychain_1"):
		heaveninventory.add_keychain(keychain_ID_1)

	if Input.is_action_just_pressed("DEBUG_heaven_remove_test_keychain_2D"):
		pass
