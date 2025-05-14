extends Node2D

@export var phan_cam: PhantomCamera2D
@export var hell_cam: PhantomCamera2D
@export var hell_cam_path_follow: PathFollow2D
@export var heaven_cam: PhantomCamera2D
@export var heaven_cam_path_follow: PathFollow2D


@export var camera_speed: float = 10.0


@export var shake_magnitude: float = 10.0
@export var shake_duration: float

@onready var is_shaking: bool = false
@onready var is_heaven_shift: bool = false
@onready var is_hell_shift: bool = false
var shake_amt : Vector2 = Vector2.ZERO
var sitting_pos = Vector2(949, 359).abs()
func _process(delta):
	if !is_shaking: return
	check_if_camera_shake()
	
	if is_heaven_shift == true:
		print_debug("WOWWWW")
		start_camera_shift_heaven(delta)
	if is_hell_shift == true :
		start_camera_shift_hell(delta)


func camera_shake_enable():
	is_shaking = true

func check_if_camera_shake():
	match is_shaking:
		true:
			shake_amt = Vector2(randf_range(-1,1), randf_range(-1,1) * shake_magnitude)
			phan_cam.global_position += shake_amt
			await get_tree().create_timer(shake_duration).timeout
			is_shaking = false

func start_camera_shift_heaven(delta: float):
	phan_cam.set_priority(0)
	hell_cam.set_priority(0)
	heaven_cam.set_priority(1)

	heaven_cam_path_follow.progress += camera_speed * delta
	if heaven_cam_path_follow.progress_ratio == 1.0:
		heaven_cam_path_follow.progress_ratio -= camera_speed * delta
		if heaven_cam_path_follow.progress_ratio == 0.0:
			is_heaven_shift = false
			heaven_cam.set_priority(0)


func start_camera_shift_hell(delta: float):
	phan_cam.set_priority(0)
	heaven_cam.set_priority(0)
	hell_cam.set_priority(1)
	hell_cam_path_follow.progress += camera_speed * delta
	if hell_cam_path_follow.progress_ratio == 1.0:
		hell_cam_path_follow.progress_ratio -= camera_speed * delta
		if hell_cam_path_follow.progress_ratio == 0.0:
			is_hell_shift = false
			hell_cam.set_priority(0)
