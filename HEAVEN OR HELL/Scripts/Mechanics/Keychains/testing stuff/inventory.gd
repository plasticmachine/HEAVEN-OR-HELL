###THIS IS ALL CODE IDK IF IM GONNA USE, FOR NOW ITS JUST TO LEARN MAYBE ILL USE IT IDK ITS AI CODE SO IDK
extends Node
class_name Inventory

signal inventory_changed

# Inventory settings
@export var MAX_UNIQUE_KEYCHAINS = 2
@export var MAX_STACK_SIZE = 3

# Inventory data
var keychains: Array = []  # Array of dictionaries: { "keychains": keychainResource, "quantity": int }

# Add an keychain to the inventory
func add_keychain(keychain: KeychainResource) -> bool:
	# Check if the keychain already exists in the inventory
	for slot in keychains:
		if slot["keychain"].keychain_id == keychain.keychain_id and slot["quantity"] < MAX_STACK_SIZE:
			slot["quantity"] += 1
			emit_signal("inventory_changed")
			return true

	# If the keychain is new and there's space
	if keychains.size() < MAX_UNIQUE_KEYCHAINS:
		keychains.append({ "keychain": keychain, "quantity": 1 })
		emit_signal("inventory_changed")
		return true

	# No space or stack limit reached
	emit_signal("inventory_changed")
	return false
	
	

# Remove an keychain from the inventory
func remove_keychain(keychain_id: int, quantity: int = 1) -> bool:
	for slot in keychains:
		if slot["keychain"].keychain_id == keychain_id:
			slot["quantity"] -= quantity
			if slot["quantity"] <= 0:
				keychains.erase(slot)
			return true
	return false
	
	emit_signal("inventory_changed")

# Drop an keychain from the inventory
func drop_keychain(keychain_id: int) -> KeychainResource:
	for slot in keychains:
		if slot["keychain"].keychain_id == keychain_id:
			var keychain = slot["keychain"]
			remove_keychain(keychain_id)
			return keychain
	return null

# Get the current inventory as a readable string (for debugging)
func get_inventory_string() -> String:
	var result = "Inventory:\n"
	for slot in keychains:
		result += "%s x%d\n" % [slot["keychain"].keychain_name, slot["quantity"]]
	return result
