extends Node2D
class_name HeavenInventoryFunctions

@export var inventory: Inventory = Inventory.new()

# functions for bullethell section:
func pick_up_keychain(keychain: KeychainResource) -> bool:
	return inventory.add_keychain(keychain)
	
func drop_keychain(keychain_id: int) -> KeychainResource:
	return inventory.drop_keychain(keychain_id)
	
# DEBUG FUNCTIONS!
func debug_add_keychain(keychain: KeychainResource):
	if inventory.add_keychain(keychain):
		print("Keychain added: ", keychain.keychain_name)
	else:
		print("Inventory is either full OR max stack of keychains was reached")
		
func debug_remove_keychain(keychain_id: int):
	if inventory.remove_keychain(keychain_id):
		print("Keychain removed ID:", keychain_id)
	else:
		print("Keychain was not in inventory?")

func debug_print_inventory():
	print(inventory.get_inventory_string())
