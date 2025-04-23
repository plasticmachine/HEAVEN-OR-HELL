extends Node2D


var keychain_ID_1 = preload("res://Resources/Keychains/TEST/TEST_A1.tres")
var keychain_ID_2 = preload("res://Resources/Keychains/TEST/TEST_A2.tres")
var keychain_ID_3 = preload("res://Resources/Keychains/TEST/TEST_A3.tres")

var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")
var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")
func _process(delta):
	
	if Input.is_action_just_pressed("DEBUG_hell_add_test_keychain_A1"):
		#print_debug("TRYING TO ADD TEST KEYCHAIN")
		hellinventory.add_keychain(keychain_ID_1)
		KeychainStuff.check_keychain_added_hell()
		ResourceSaver.save(hellinventory)

	if Input.is_action_just_pressed("DEBUG_hell_remove_test_keychain_A1"):
		hellinventory.remove_keychain(keychain_ID_1)
		KeychainStuff.check_keychain_removed_hell()
		ResourceSaver.save(hellinventory)
	
	if Input.is_action_just_pressed("DEBUG_hell_add_test_keychain_A2"):
		hellinventory.add_keychain(keychain_ID_2)
		KeychainStuff.check_keychain_added_hell()
		ResourceSaver.save(hellinventory)

	if Input.is_action_just_pressed("DEBUG_hell_remove_test_keychain_A2"):
		hellinventory.remove_keychain(keychain_ID_2)
		KeychainStuff.check_keychain_removed_hell()
		ResourceSaver.save(hellinventory)

	if Input.is_action_just_pressed("DEBUG_hell_add_test_keychain_A3"):
		hellinventory.add_keychain(keychain_ID_3)
		KeychainStuff.check_keychain_added_hell()
		ResourceSaver.save(hellinventory)

	if Input.is_action_just_pressed("DEBUG_hell_remove_test_keychain_A3"):
		hellinventory.remove_keychain(keychain_ID_3)
		KeychainStuff.check_keychain_removed_hell()
		ResourceSaver.save(hellinventory)
