#extends Node2D
#class_name HellInventoryFunctions
#
#@export var hell_inventory: Inventory = Inventory.new()
#
## functions for bullethell section:
#func pick_up_keychain(keychain: KeychainResource) -> bool:
	#return hell_inventory.add_keychain(keychain)
	#
#func drop_keychain(keychain_id: int) -> KeychainResource:
	#return hell_inventory.drop_keychain(keychain_id)
	#
## DEBUG FUNCTIONS!
#func debug_add_keychain(keychain: KeychainResource):
	#if hell_inventory.add_keychain(keychain):
		#print("Keychain added: ", keychain.keychain_name)
	#else:
		#print("hell_inventory is either full OR max stack of keychains was reached")
		#
#func debug_remove_keychain(keychain_id: int):
	#if hell_inventory.remove_keychain(keychain_id):
		#print("Keychain removed ID:", keychain_id)
	#else:
		#print("Keychain was not in hell_inventory?")
#
#func debug_print_hell_inventory():
	#print(hell_inventory.get_inventory_string())
