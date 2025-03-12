extends Node2D
signal heaven_blocked

@onready var HeavenTBAnimation = $HeavenTbAnimation
@export var damage_blink_timer_sec: float



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


func _on_block_area_body_entered(body):
	heaven_blocked.emit()
