extends Node2D

@onready var HeavenTBAnimation = $HeavenTbAnimation
@export var damage_blink_timer_sec: float

func _on_turn_based_heaven_enable():
	HeavenTBAnimation.play("idle")


func _on_turn_based_heaven_disable():
	HeavenTBAnimation.play("disable")


func _on_heaven_damage_taken():
	HeavenTBAnimation.play("hit")
	await get_tree().create_timer(damage_blink_timer_sec).timeout
