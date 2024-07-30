extends Node2D

@export var speed = 4

func _physics_process(delta: float) -> void:
	self.progress += speed * delta
