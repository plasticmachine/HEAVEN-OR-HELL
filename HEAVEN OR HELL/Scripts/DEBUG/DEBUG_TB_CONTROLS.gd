extends Node2D

@onready var CameraTricks = $"../Cameras"


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("DEBUG_heaven_cam_active"):
		CameraTricks.is_heaven_shift = true
	if Input.is_action_just_pressed("DEBUG_hell_cam_active"):
		CameraTricks.is_hell_shift = true
