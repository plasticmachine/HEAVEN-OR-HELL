extends Sprite2D

var progress = 0
@export var progress_speed: float # MAX PROGRESS IS 1 SO TRY TO KEEP THIS AROUND LIKE 0.01 ~ 0.001
var phase_shift: bool = false

func _ready():
	self.material.set_shader_parameter("progress", progress)
	#melt_shader.set_shader("progress", progress)

func _process(delta):
	if phase_shift == true:
		progress += progress_speed
		self.material.set_shader_parameter("progress", progress)
		#print_debug(progress)
		if progress >= 1:
			phase_shift = false
		#print_debug(progress)

func _on_clown_phase_1_timeout() -> void:
	phase_shift = true
