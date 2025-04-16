@tool
extends CanvasLayer

@onready var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")

@onready var slot_1 = $Slot1
@onready var slot_2 = $Slot2
@onready var slot_3 = $Slot3
@onready var slot_4 = $Slot4
@onready var slot_5 = $Slot5

func _ready():
	update_all_slots()

#func _process(delta: float) -> void:
	#update_all_slots()
##
func check_if_inventory_changed():
	if heaveninventory.inventory_changed == true:
		update_all_slots()

func update_all_slots():
	if heaveninventory.keychain_slot_1 != null:
		slot_1.texture = heaveninventory.keychain_slot_1.keychain_texture
		slot_2.texture = heaveninventory.keychain_slot_2.keychain_texture
		slot_3.texture = heaveninventory.keychain_slot_3.keychain_texture
		slot_4.texture = heaveninventory.keychain_slot_4.keychain_texture
		slot_5.texture = heaveninventory.keychain_slot_5.keychain_texture
