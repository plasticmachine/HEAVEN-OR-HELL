extends Node2D
@onready var ClownAnimationManager = $AnimatedSprite2D

func _on_attackbutton_2_pressed() :
		ClownAnimationManager.play("Kicks")

func _on_animated_sprite_2d_animation_finished():
	ClownAnimationManager.play("Spins")
