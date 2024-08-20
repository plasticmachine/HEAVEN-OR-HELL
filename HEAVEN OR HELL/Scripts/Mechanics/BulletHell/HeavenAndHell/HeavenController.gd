extends CharacterBody2D
var current_animation = "idle"
var angle = 0

enum {WALK, RUN, TAKEOFF}
var state = WALK

@onready var animationTree = $AnimationTree
@onready var state_machine = animationTree["parameters/playback"]
var blend_position : Vector2 = Vector2.ZERO
var blend_pos_path = [
	"parameters/Walk/WalkBS/blend_position",
	"parameters/Run/RunBS/blend_position",
	"parameters/Takeoff/TakeoffBS/blend_position"
]

var animTree_state_keys = [
	"Walk",
	"Run",
	"Takeoff"
]

@onready var heavenstats = load("res://Resources/Stats/HeavenStats.tres")
#var screen_size #size of game window
var meleeScript

func _ready():
	meleeScript = $Melee
	#heavenstats.subtract_heart(10)
	print_debug(heavenstats.current_heart)
	#screen_size = get_viewport_rect().size
	#hide()
	
func _process(delta):
	_movement(delta)
	animate()


func _movement(delta):
	current_animation = "idle"
	var input_dir = Input.get_vector("move_left_heaven", "move_right_heaven", "move_up_heaven","move_down_heaven")
	
	if input_dir.length() != 0:
		state = WALK
		#print_debug("walking!")
		#forgotten angle code WALK:
			#angle = input_dir.angle() / (PI/4)
			#angle = wrapi(int(angle), 0, 8)
			#if angle == 7:
				#current_animation = "up_right"
			#if angle == 6:
				#current_animation = "up"
			#if angle == 5:
				#current_animation = "up_left"
			#if angle == 4:
				#current_animation = "left"
			#if angle == 3:
				#current_animation = "down_left"
			#if angle == 2:
				#current_animation = "down"
			#if angle == 1:
				#current_animation = "down_right"
			#if angle == 0:
				#current_animation = "right"
	if Input.is_action_pressed("run_heaven") and input_dir.length() != 0:
		state = TAKEOFF
		state = RUN
		#forgotten angle code RUN:
			#print_debug("running!")
			#if angle == 7:
				#current_animation = "up_right"
			#if angle == 6:
				#current_animation = "up"
			#if angle == 5:
				#current_animation = "up_left"
			#if angle == 4:
				#current_animation = "takeoff_left"
			#if angle == 3:
				#current_animation = "down_left"
			#if angle == 2:
				#current_animation = "down"
			#if angle == 1:
				#current_animation = "down_right"
			#if angle == 0:
				#current_animation = "takeoff_right"
				#$AnimationPlayer.queue("run_right")
		velocity = input_dir * heavenstats.run_speed
	else:
		velocity = input_dir * heavenstats.move_speed
		
	#hellstats.subtract_heart(10)
	#print_debug(hellstats.current_heart)
	#blend_position = input_dir
	blend_position = input_dir
	move_and_slide()
	$AnimationPlayer.play(current_animation)


func animate() -> void:
	state_machine.travel(animTree_state_keys[state])
	animationTree.set(blend_pos_path[state], blend_position)
func start(pos):
	
	
	position = pos
	show() # makes sure the player is visible when resetting the game
	#$CollisionShape2D.disabled = false # makes sure the collision shape is on when starting

#@warning_ignore("unused_parameter")


#func _on_animation_player_animation_finished(anim_name):
	#if anim_name == "takeoff_right":
		#$AnimationPlayer.play("run_right")
