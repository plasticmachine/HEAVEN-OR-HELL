extends Node2D

@export var inventory_functions: HellInventoryFunctions
var keychain1 = preload("res://Resources/Keychains/Test1.tres")

var keychain2 = preload("res://Resources/Keychains/Test2.tres")

var keychain3 = preload("res://Resources/Keychains/Test3.tres")

func _ready():
	# Add keychains to the player's inventory
	#inventory_functions.debug_add_keychain(keychain1)
	inventory_functions.debug_add_keychain(keychain2)

	# Print the inventory
	inventory_functions.debug_print_hell_inventory()

	# Drop an keychain
	inventory_functions.debug_remove_keychain(1)
	inventory_functions.debug_print_hell_inventory()


func _process(delta):
	if Input.is_action_just_pressed("DEBUG_hell_add_test_keychain_2D"):
		inventory_functions.debug_add_keychain(keychain1)
		inventory_functions.debug_add_keychain(keychain2)
		inventory_functions.debug_print_hell_inventory()
	if Input.is_action_just_pressed("DEBUG_hell_remove_test_keychain_2D"):
		inventory_functions.debug_remove_keychain(1)
		inventory_functions.debug_remove_keychain(2)
		inventory_functions.debug_print_hell_inventory()
