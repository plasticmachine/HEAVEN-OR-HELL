@tool
extends Resource
static var KeychainStackLimit: int = 5

@export var character_name = "ANGEL/DEVIL"
@export_category("SKILL SLOTS")
@export var skill_slot_1: int = 0
@export var skill_slot_2: int = 0
@export var skill_slot_3: int = 0
@export var skill_slot_4: int = 0

@export_category("KEYCHAIN SLOTS")
@export var keychain_slot_1: KeychainResource
@export var keychain_slot_2: KeychainResource
@export var keychain_slot_3: KeychainResource
@export var keychain_slot_4: KeychainResource
@export var keychain_slot_5: KeychainResource

@export_category("KEYCHAIN STACKS")
@export var keychain_slot_1_stack: int = 0
@export var keychain_slot_2_stack: int = 0
@export var keychain_slot_3_stack: int = 0
@export var keychain_slot_4_stack: int = 0
@export var keychain_slot_5_stack: int = 0

@export_category("KEYCHAIN BOOLEANS / EFFECT_IDS")
@export var can_parry: bool = false
@export var can_block: bool = false

@export var added_effect_ID: int = 0
@export var removed_effect_ID: int = 0
func _process(delta: float) -> void:
	if keychain_slot_1_stack > 5:
		keychain_slot_1_stack = 5
	if keychain_slot_2_stack > 5:
		keychain_slot_2_stack = 5
	if keychain_slot_3_stack > 5:
		keychain_slot_3_stack = 5
	if keychain_slot_4_stack > 5:
		keychain_slot_4_stack = 5
	if keychain_slot_5_stack > 5:
		keychain_slot_5_stack = 5

func add_keychain(keychain: KeychainResource) -> bool:
	if not keychain:
		return false
	
	var keychain_size: int = keychain.get("keychain_size")
	#if keychain and keychain.get("keychain_size") != null:
		#keychain_size = keychain.keychain_size
		#
	#trying to add to an existing keychain stack
	for i in range(1,6):
		var slot = get("keychain_slot_%d" % i)
		if slot != keychain:
			continue
			
		var current_stack = get("keychain_slot_%d_stack" % i)
		var new_stack =+ current_stack + keychain_size
		if new_stack <= KeychainStackLimit:
			set("keychain_slot_%d" % i, new_stack)
			added_effect_ID = keychain.keychain_id
			return true
		print_debug("CURRENT KEYCHAIN STACK FOR SLOT " + str(slot) + " IS " + str(new_stack))
	#finding a new stack to populate if there's not an existing one, add to first empty slot=
	for i in range(1,6):
		var slot = get("keychain_slot_%d" % i)
		if slot != null:
			continue
		set("keychain_slot_%d" % i, keychain)
		set("keychain_slot_%d_stack" % i, keychain_size)
		added_effect_ID = keychain.keychain_id
		return true
		print_debug("CURRENT KEYCHAIN STACK FOR " + str(slot) + " NO STACK YET!")
	#full inventory!
	return false

func remove_keychain(keychain: KeychainResource) -> bool:
	#try to remove from existing stack
	var keychain_size: int = 1
	if keychain and keychain.get("keychain_size") != null:
		keychain_size = keychain.keychain_size
	for i in range(1,6):
		var slot = get("keychain_slot_%d" % i)
		var stack = get("keychain_slot_%d_stack" % i)
		
		if slot == keychain and stack >= keychain_size:
			set("keychain_slot_%d_stack" % i, stack - keychain_size)
			
			if stack - keychain_size <= 0:
				set("keychain_slot_%d" % i, null)
				set("keychain_slot_%d_stack" % i, 0)
				removed_effect_ID = keychain.keychain_id
			return true
	#keychain not found
	return false
