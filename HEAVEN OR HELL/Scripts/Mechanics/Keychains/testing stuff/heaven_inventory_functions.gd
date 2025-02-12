extends Node2D
class_name HeavenInventoryFunctions

@export var heaven_inventory: Inventory = Inventory.new()

# functions for bullethell section:
func pick_up_keychain(keychain: KeychainResource) -> bool:
	return heaven_inventory.add_keychain(keychain)
	
func drop_keychain(keychain_id: int) -> KeychainResource:
	return heaven_inventory.drop_keychain(keychain_id)
	
# DEBUG FUNCTIONS!
func debug_add_keychain(keychain: KeychainResource):
	if heaven_inventory.add_keychain(keychain):
		print("Keychain added: ", keychain.keychain_name)
	else:
		print("heaven_inventory is either full OR max stack of keychains was reached")
		
func debug_remove_keychain(keychain_id: int):
	if heaven_inventory.remove_keychain(keychain_id):
		print("Keychain removed ID:", keychain_id)
	else:
		print("Keychain was not in heaven_inventory?")

func debug_print_heaven_inventory():
	print(heaven_inventory.get_inventory_string())
