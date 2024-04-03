extends TextureProgressBar
@onready var action_timer = $"../../ActionTimer"
@onready var action_timer_bar = $"."
@onready var melee = ($"../../Melee")



func _ready() -> void:
	action_timer_bar.max_value = action_timer.wait_time


func _physics_process(_delta: float) -> void:
	
	action_timer_bar.value = action_timer.wait_time - action_timer.time_left
	
	if Input.is_action_just_pressed("Melee_hell") and melee.actionTimer <= 0:
		action_timer.start()
