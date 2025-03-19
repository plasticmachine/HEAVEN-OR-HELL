extends Camera2D

@onready var phan_cam = $"../PhantomCamera2D"
@export var shake_magnitude: float = 10.0
@export var shake_duration: float

@onready var is_shaking: bool = false
var shake_amt : Vector2 = Vector2.ZERO
var sitting_pos = Vector2(949, 359).abs()
func _process(delta):
	
	if !is_shaking: return
	check_if_camera_shake()

func camera_shake_enable():
	is_shaking = true

func check_if_camera_shake():
	match is_shaking:
		true:
			shake_amt = Vector2(randf_range(-1,1), randf_range(-1,1) * shake_magnitude)
			phan_cam.global_position += shake_amt
			await get_tree().create_timer(shake_duration).timeout
			is_shaking = false
