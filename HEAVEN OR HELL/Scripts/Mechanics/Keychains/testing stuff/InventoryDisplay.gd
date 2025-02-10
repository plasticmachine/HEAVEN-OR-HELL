extends CanvasLayer

@export var inventory_manager: Node2D
@export var x_offset := 0
@export var keychain_spacing := 10
@export var keychain_size : Vector2
@export var label_size: Vector2
@export var label_y_offset := 16


var displayed_keychains_count: int = 0

func _ready():
	update_hud()


func _on_inventory_manager_inventory_changed():
	update_hud()

func update_hud():
	if inventory_manager.keychains.size() > displayed_keychains_count:
		add_new_keychains_to_hud()
	else:
		update_current_hud()

func add_new_keychains_to_hud():
	var current_keychains_count = inventory_manager.keychains.size()
	var new_keychains_count = current_keychains_count - displayed_keychains_count
	
	for i in range(new_keychains_count):
		var slot = inventory_manager.keychains[displayed_keychains_count + i]
		var keychain_texture = slot["keychain"].keychain_texture
		var keychain_quantity = slot["quantity"]
		
		
		var container = Control.new()
		container.size = keychain_size
		
		var texture_rect = TextureRect.new()
		texture_rect.texture = keychain_texture
		texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
		texture_rect.custom_minimum_size = keychain_size
		texture_rect.position = Vector2(0,0)
		container.add_child(texture_rect)
		
		var label = Label.new()
		label.name = "QuantityLabel"
		label.text = str(keychain_quantity)
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		label.position = Vector2(0, keychain_size.y - label_y_offset)
		label.custom_minimum_size = label.size
		container.add_child(label)
		
		var x_offset = displayed_keychains_count * (keychain_spacing)
		container.position = Vector2(x_offset, 0)
		$InventoryContainer.add_child(container)
		
	displayed_keychains_count = current_keychains_count

func update_current_hud():
	for i in range(displayed_keychains_count):
		var slot = inventory_manager.keychains[i]
		var keychain_quantity = slot['quantity']
		
		var container = $InventoryContainer.get_child(i)
		
		var label = container.get_node("QuantityLabel")
		if label:
			label.text = str(keychain_quantity)
		else:
			print("Error: label not found in container ", i)
