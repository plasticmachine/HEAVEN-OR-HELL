extends Node2D

@export var speed = 4
@export var active := false

func _physics_process(delta: float) -> void:
	if active:
		start_progress(delta)
func start_progress(delta: float):
	self.progress += speed * delta
