extends CharacterBody2D
var current_animation = "idle"
var angle = 0
var is_dead

enum {WALK, RUN, TAKEOFF}
var state = WALK

@onready var BulletCollision = $PlayerArea/BulletHurtbox
@onready var animationTree = $AnimationTree
@export var BHbossNode: Node2D
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
	add_to_group("Player")
	meleeScript = $Melee
	#heavenstats.subtract_heart(10)
	print_debug(heavenstats.current_heart)
	#screen_size = get_viewport_rect().size
	#hide()
	check_relative_location_to_boss()
func _process(delta):
	_movement(delta)
	animate()
	check_death()
	debug_controls()
	check_relative_location_to_boss()
#func _physics_process(delta: float) -> void:
		#check_relative_location_to_boss()


func debug_controls():
	if Input.is_action_just_pressed("DEBUG_heaven_all_stats_up_(+10)"):
		heavenstats.add_all(10)
	if Input.is_action_just_pressed("DEBUG_heaven_all_stats_down_(-10)"):
		heavenstats.subtract_all(10)

func _movement(_delta):
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
func check_death():
	if heavenstats.current_heart <= 0:
		is_dead = true
		remove_from_group("Player")
		heavenstats.move_speed = 0
		heavenstats.run_speed = 0
		BulletCollision.disabled = true
		hide()
		


func check_relative_location_to_boss():
	var distance = 	global_position.x - BHbossNode.global_position.x 

	if BHbossNode:
		if distance == 0:
			scale.x = -abs(scale.x)
		#else:
			#scale.x = -abs(scale.x)
 

#func check_if_nodes_have_crossed():
		#check_relative_location_to_boss()
	#
#func _on_animation_player_animation_finished(anim_name):
	#if anim_name == "takeoff_right":
		#$AnimationPlayer.play("run_right")
