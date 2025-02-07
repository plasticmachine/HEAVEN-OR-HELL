extends Node2D

@onready var HeavenTBAnimation = $HeavenTbAnimation
@export var damage_blink_timer_sec: float

### TESTING KEYCHAIN STUFF
@export var inventory: Inventory
@export var inventory_display: InventoryDisplay

@onready var item1 = preload("res://Scenes/Keychains/TestItem2D.tscn")
var items: Array[Item] = []
#func _ready():
	#inventory.inventory_updated.connect(_on_inventory_manager_inventory_updated)


#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("DEBUG_heaven_add_test_keychain_2D"):
		#items.append()

func _on_turn_based_heaven_enable():
	HeavenTBAnimation.play("idle")


func _on_turn_based_heaven_disable():
	HeavenTBAnimation.play("disable")


func _on_heaven_damage_taken():
	HeavenTBAnimation.play("hit")
	await get_tree().create_timer(damage_blink_timer_sec).timeout



func _on_inventory_manager_inventory_updated() -> void:
	inventory_display.update_inventory(inventory)
 

func _on_test_area_detection_area_entered(area: Area2D) -> void:
		if Input.is_action_just_pressed("DEBUG_heaven_add_test_keychain_2D"):
				items.append(area)
				print_debug("Appended item!")
