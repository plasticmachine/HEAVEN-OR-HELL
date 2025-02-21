extends Node2D

@export var speed = 4
@export var active := false
@export var wait_time: float = 0.0
@export var mat: Material

func _process(delta: float) -> void:
	if active:
		await get_tree().create_timer(wait_time).timeout
		start_progress(delta)
		
func start_progress(delta: float): 
	self.progress += speed * delta
	
