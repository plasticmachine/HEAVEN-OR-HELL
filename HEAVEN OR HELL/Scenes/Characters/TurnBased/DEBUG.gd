extends Node2D

@export var inventory_functions: HeavenInventoryFunctions
var keychain1 = preload("res://Resources/Keychains/Test1.tres")

var keychain2 = preload("res://Resources/Keychains/Test2.tres")

var keychain3 = preload("res://Resources/Keychains/Test3.tres")

func _ready():
	# Add keychains to the player's inventory
	#inventory_functions.debug_add_keychain(keychain1)
	inventory_functions.debug_add_keychain(keychain2)

	# Print the inventory
	inventory_functions.debug_print_inventory()

	# Drop an keychain
	inventory_functions.debug_remove_keychain(1)
	inventory_functions.debug_print_inventory()


func _process(delta):
	if Input.is_action_just_pressed("DEBUG_heaven_add_test_keychain_2D"):
		inventory_functions.debug_add_keychain(keychain3)
		inventory_functions.debug_print_inventory()
	if Input.is_action_just_pressed("DEBUG_heaven_remove_test_keychain_2D"):
		inventory_functions.debug_remove_keychain(1)
		inventory_functions.debug_print_inventory()
