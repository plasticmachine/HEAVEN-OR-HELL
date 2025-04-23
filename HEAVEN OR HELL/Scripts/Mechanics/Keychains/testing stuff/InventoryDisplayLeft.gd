@tool
extends CanvasLayer

@onready var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")

@onready var slot_1 = $Slot1
@onready var slot_2 = $Slot2
@onready var slot_3 = $Slot3
@onready var slot_4 = $Slot4
@onready var slot_5 = $Slot5

@onready var slot_1_stack = $Slot1/Slot1Stack
@onready var slot_2_stack = $Slot2/Slot2Stack
@onready var slot_3_stack = $Slot3/Slot3Stack
@onready var slot_4_stack = $Slot4/Slot4Stack
@onready var slot_5_stack = $Slot5/Slot5Stack

func _ready():
	update_all_slots()

func _process(delta: float) -> void:
	update_all_slots()

#func check_if_inventory_changed():
	#if hellinventory.inventory_changed == true:
		#update_all_slots()

func update_all_slots():
		if hellinventory.keychain_slot_1 != null:
			slot_1.texture = hellinventory.keychain_slot_1.keychain_texture
			slot_1_stack.text = str(hellinventory.keychain_slot_1_stack)
		else:
				slot_1.texture = null
				slot_1_stack.text = ""
		if hellinventory.keychain_slot_2 != null:
			slot_2.texture = hellinventory.keychain_slot_2.keychain_texture
			slot_2_stack.text =  str(hellinventory.keychain_slot_2_stack)
		else:
				slot_2.texture = null
				slot_2_stack.text = ""
		if hellinventory.keychain_slot_3 != null:
			slot_3.texture = hellinventory.keychain_slot_3.keychain_texture
			slot_3_stack.text =  str(hellinventory.keychain_slot_3_stack)
		else:
				slot_3.texture = null
				slot_3_stack.text = ""
		if hellinventory.keychain_slot_4 != null:
			slot_4.texture = hellinventory.keychain_slot_4.keychain_texture
			slot_4_stack.text =  str(hellinventory.keychain_slot_4_stack)
		else:
				slot_4.texture = null
				slot_4_stack.text = ""
		if hellinventory.keychain_slot_5 != null:
			slot_5.texture = hellinventory.keychain_slot_5.keychain_texture
			slot_5_stack.text =  str(hellinventory.keychain_slot_5_stack)
		else:
				slot_5.texture = null
				slot_5_stack.text = ""
