extends Node2D
signal hell_blocked
signal hell_parried

@onready var hellTBAnimation = $HellTbAnimation
@onready var hellTBVFX = $"../../BattleEffectManagerPosition/HellBattleEffectManager"
@onready var hellTBVFXSupport = $"../../BattleEffectManagerPosition/HellBattleEffectManagerSupport"
@onready var cameraTricks = $"../../Camera2D"
@export var damage_blink_timer_sec: float
@export var parry_blink_timer_sec: float

func _on_turn_based_hell_disable():
	hellTBAnimation.play("disable")

func _on_turn_based_hell_enable():
	hellTBAnimation.play("idle")

func _on_hell_damage_taken():
	hellTBAnimation.play("hit")
	await get_tree().create_timer(damage_blink_timer_sec).timeout


func _on_block_area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	hellTBAnimation.play("block")
	hell_blocked.emit()


func _on_parry_area_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	hellTBAnimation.play("parry")
	hell_parried.emit()
	HellSounds.HELL_PARRY.play()
	hellTBVFX.find_effect_spot()
	hellTBVFX.play("magia_use")
	cameraTricks.camera_shake_enable()
	hit_stop(0.05, .2)
	await get_tree().create_timer(parry_blink_timer_sec).timeout
	hellTBAnimation.play("disable")


func hit_stop(timeScale, duration):
	Engine.time_scale = timeScale
	await(get_tree().create_timer(duration, true, true,true).timeout)
	Engine.time_scale = 1.0
