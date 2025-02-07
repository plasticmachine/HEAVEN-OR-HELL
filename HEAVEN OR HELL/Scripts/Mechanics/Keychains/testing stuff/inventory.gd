###THIS IS ALL CODE IDK IF IM GONNA USE, FOR NOW ITS JUST TO LEARN MAYBE ILL USE IT IDK ITS AI CODE SO IDK

class_name Inventory
extends Node


signal inventory_updated


const MAX_UNIQUE_ITEMS := 5
const MAX_STACK_SIZE := 3

var items: Array[Dictionary] = []

func add_item(item_id: String, item_texture: Texture2D) -> bool:
	#check for existing slot
	for slot in items:
		if slot['id'] == item_id && slot["quantity"] < MAX_STACK_SIZE:
			slot["quantity"] += 1
			inventory_updated.emit()
			return true
	#check for a new slot
	if items.size() < MAX_UNIQUE_ITEMS:
		items.append({
			"id": item_id,
			"quantity": 1,
			"texture": item_texture
		})
		inventory_updated.emit()
		return true
		
	return false
	
func remove_item(item_id: String, amount: int = 1) -> bool:
	for i in range(items.size()):
		if items[i]["id"] == item_id:
			items[i]["quantity"] -= amount
			if items[i]["quantity"] <= 0:
				items.remove_at(i)
			inventory_updated.emit()
			return true
	return false

func get_item_count(item_id: String) -> int:
	for slot in items:
		if slot["id"] == item_id:
			return slot["quantity"]
	return 0
