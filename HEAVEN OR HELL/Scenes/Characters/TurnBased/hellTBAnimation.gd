extends Node2D

@onready var hellTBAnimation = $HellTbAnimation
@export var damage_blink_timer_sec: float

func _on_turn_based_hell_disable():
	hellTBAnimation.play("disable")


func _on_turn_based_hell_enable():
	hellTBAnimation.play("idle")


func _on_hell_damage_taken():
	hellTBAnimation.play("hit")
	await get_tree().create_timer(damage_blink_timer_sec).timeout
