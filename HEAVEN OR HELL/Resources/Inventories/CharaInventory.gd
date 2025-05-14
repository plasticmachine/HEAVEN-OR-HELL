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
@export var can_dodge: bool = false
@export var can_bonus_attack: bool = false
@export var can_bounce_on_it: bool = false
@export var lucy_active: bool = false
@export var misanthropist: bool = false
@export var kingforaday_active: bool = false
@export var kingslayer_active: bool = false
@export var frenesi_active: bool = false
@export var lefty_active: bool = false
@export var jinxed_active: bool = false


@export var magia_refund_percentage: float = 0.0

@export var protections: int = 0
@export var misanthropist_turns: int = 0
@export var frenesi_actions: int = 0
@export var deviltry_max_variances: int = 0
@export var malice_max_variances: int = 0
@export var zero_magia_spends: int = 0
@export_subgroup("EFFECT_IDS")
@export var inventory_changed: bool = false
@export var added_effect_ID: int = 0
@export var removed_effect_ID: int = 0
@export var current_slot: int = 0
@export var current_slot_stack: int = 0
func _process(delta: float) -> void:
	# Ensure stacks don't exceed limit
	for i in range(1, 6):
		var stack = get("keychain_slot_%d_stack" % i)
		if stack > KeychainStackLimit:
			set("keychain_slot_%d_stack" % i, KeychainStackLimit)
	clampi(protections, 0, 100)
	clampi(deviltry_max_variances, 0, 100)
	clampi(malice_max_variances, 0, 100)
	clampi(zero_magia_spends, 0, 100)


#go back and refactor later
func add_keychain(keychain: KeychainResource) -> bool:
	if not keychain:
		return false
	
	var keychain_size: int = keychain.keychain_size
	
	# First try to add to an existing stack of the same keychain type
	for i in range(1, 6):
		var existing_keychain = get("keychain_slot_%d" % i)
		if existing_keychain == null:
			ResourceSaver.save(self)
			continue
			
		# Check if keychains are the same type (you might want to compare by ID or other unique identifier)
		if existing_keychain.keychain_id == keychain.keychain_id:
			var current_stack = get("keychain_slot_%d_stack" % i)
			var new_stack = current_stack + keychain_size
			
			if new_stack <= KeychainStackLimit:
				set("keychain_slot_%d_stack" % i, new_stack)
				added_effect_ID = keychain.keychain_id
				inventory_changed = true
				current_slot = i
				current_slot_stack = new_stack
				ResourceSaver.save(self)
				return true
			else:
				# If we can't add all, add as much as possible
				var added_amount = KeychainStackLimit - current_stack
				if added_amount > 0:
					set("keychain_slot_%d_stack" % i, KeychainStackLimit)
					added_effect_ID = keychain.keychain_id
					inventory_changed = true
					current_slot = i
					current_slot_stack = new_stack
					ResourceSaver.save(self)
					return true
				# If no room in this stack, continue to next slot
	
	# If no existing stack found, add to first empty slot
	for i in range(1, 6):
		var existing_keychain = get("keychain_slot_%d" % i)
		if existing_keychain == null:
			set("keychain_slot_%d" % i, keychain)
			set("keychain_slot_%d_stack" % i, keychain_size)
			added_effect_ID = keychain.keychain_id
			current_slot = i
			current_slot_stack = 1
			inventory_changed = true
			ResourceSaver.save(self)
			return true
	
	# Inventory is full
	ResourceSaver.save(self)
	return false

#go back and refactor later
func remove_keychain(keychain: KeychainResource) -> bool:
	if not keychain:
		ResourceSaver.save(self)
		return false
	
	var keychain_size: int = keychain.keychain_size
	
	# Try to remove from existing stack
	for i in range(1, 6):
		var existing_keychain = get("keychain_slot_%d" % i)
		if existing_keychain == null:
			ResourceSaver.save(self)
			continue
			
		if existing_keychain.keychain_id == keychain.keychain_id:
			var current_stack = get("keychain_slot_%d_stack" % i)
			var new_stack = current_stack - keychain_size
			if new_stack > 0:
				set("keychain_slot_%d_stack" % i, new_stack)
				ResourceSaver.save(self)
			else:
				# Remove the keychain completely if stack reaches 0
				set("keychain_slot_%d" % i, null)
				set("keychain_slot_%d_stack" % i, 0)
				ResourceSaver.save(self)
			
			removed_effect_ID = keychain.keychain_id
			inventory_changed = true
			current_slot = i
			current_slot_stack = new_stack
			ResourceSaver.save(self)
			return true
	
	# Keychain not found
	ResourceSaver.save(self)
	return false

func reset_all_keychain_effects():
	can_parry = false
	can_block = true
	can_dodge = false
	can_bonus_attack = false
	lucy_active = false
	misanthropist = false
	misanthropist_turns = 0 
	deviltry_max_variances = 0
	malice_max_variances = 0
	protections = 0


func reset_inventory():
	skill_slot_1 = 1
	skill_slot_2 = 2
	skill_slot_3 = 3
	skill_slot_4 = 4
	
	reset_all_keychain_effects()
	for i in range(1, 6):
		set("keychain_slot_%d" % i, null)
		set("keychain_slot_%d_stack" % i, 0)
	ResourceSaver.save(self)
