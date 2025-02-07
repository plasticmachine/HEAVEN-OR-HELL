extends Control
class_name InventoryDisplay

@onready var slot_container: GridContainer = $GridContainer

func _ready():
	for child in slot_container.get_children():
		child.visible = false
		
func update_inventory(inventory: Inventory):
	for i in range(slot_container.get_child_count()):
		var slot = slot_container.get_child(i)
		if i < inventory.items.size():
			slot.get_node("TextureRect").texture = inventory.items[i]["texture"]
			slot.get_node("Label").text = str(inventory.items[i]["quantity"])
			slot.visible = true
		else:
			slot.visible = false
