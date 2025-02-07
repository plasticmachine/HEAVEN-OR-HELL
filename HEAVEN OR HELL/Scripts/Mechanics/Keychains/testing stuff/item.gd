# item.gd
class_name Item
extends Area2D

@export var item_id: String
@export var item_name: String
@export var item_texture: Texture2D
@export var max_stack_size: int = 3

@export var quantity: int = 1


func pickup(inventory: Inventory) -> bool: 
		if inventory.add_item(item_id, item_texture):
			queue_free()
			return true
		return false
	
