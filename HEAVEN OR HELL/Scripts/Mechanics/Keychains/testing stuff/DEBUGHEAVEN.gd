extends Node2D

var keychain_ID_1 = preload("res://Resources/Keychains/TEST/TEST_A1.tres")
var keychain_ID_2 = preload("res://Resources/Keychains/TEST/TEST_A2.tres")
var keychain_ID_3 = preload("res://Resources/Keychains/TEST/TEST_A3.tres")

var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")
var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")

func _process(delta):
	if Input.is_action_just_pressed("DEBUG_go_to_debug_screen"):
		YASM.load_scene("res://Scenes/Screens/debug_screen.tscn")
