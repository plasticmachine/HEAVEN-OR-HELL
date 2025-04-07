extends Node2D
signal heaven_blocked
signal heaven_parried

@onready var HeavenTBAnimation = $HeavenTbAnimation
@onready var HeavenTBVFX = $"../../BattleEffectManagerPosition/HeavenBattleEffectManager"
@onready var HeavenTBVFXSupport = $"../../BattleEffectManagerPosition/HeavenBattleEffectManagerSupport"
@onready var cameraTricks = $"../../Camera2D"
@export var damage_blink_timer_sec: float
@export var parry_blink_timer_sec: float


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


#func _on_block_area_body_entered(body):
	#heaven_blocked.emit()
#
#
#func _on_block_area_entered(body_rid, body, body_shape_index, local_shape_index):
	#heaven_blocked.emit()
#

func _on_block_area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	HeavenTBAnimation.play("block")
	heaven_blocked.emit()
	await get_tree().create_timer(parry_blink_timer_sec).timeout
	HeavenTBAnimation.play("idle")


func _on_parry_area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	HeavenTBAnimation.play("parry")
	heaven_parried.emit()
	HeavenSounds.HEAVEN_PARRY.play()
	HeavenTBVFX.find_effect_spot()
	HeavenTBVFX.play("magia_use")
	cameraTricks.camera_shake_enable()
	hit_stop(0.05, .2)
	Input.start_joy_vibration(0,1,1,1)
	
	await get_tree().create_timer(parry_blink_timer_sec).timeout
	HeavenTBAnimation.play("idle")
	
func hit_stop(timeScale, duration):
	Engine.time_scale = timeScale
	await(get_tree().create_timer(duration, true, true,true).timeout)
	Engine.time_scale = 1.0
