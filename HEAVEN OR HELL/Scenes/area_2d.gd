extends CharacterBody2D

signal hit
var current_animation = "down"
var angle = 0
@export var speed = 10 #speed of player
#var screen_size #size of game window
var meleeScript


func _ready():
	meleeScript = $Melee
	#screen_size = get_viewport_rect().size
	#hide()


func _process(delta):
	current_animation = "down"
	var input_dir = Input.get_vector("move_left_hell", "move_right_hell", "move_up_hell","move_down_hell")
	if input_dir.length() != 0:
		angle = input_dir.angle() / (PI/4)
		angle = wrapi(int(angle), 0, 8)
		
		if angle == 7:
			current_animation = "up_right"
		if angle == 6:
			current_animation = "up"
		if angle == 5:
			current_animation = "up_left"
		if angle == 4:
			current_animation = "left"
		if angle == 3:
			current_animation = "down_left"
		if angle == 2:
			current_animation = "down"
		if angle == 1:
			current_animation = "down_right"
		if angle == 0:
			current_animation = "right"
		
		
	velocity = input_dir * speed
	move_and_slide()
	$AnimatedSprite2D.play(current_animation)


func start(pos):
	position = pos
	show() # makes sure the player is visible when resetting the game
	#$CollisionShape2D.disabled = false # makes sure the collision shape is on when starting

#@warning_ignore("unused_parameter")
func _on_body_entered(body):
	#hide() #player disappears after being hit
#	hit.emit() #emits hit signal
#	$CollisionShape2D.set_deferred("disabled", true) # disables the shape until its safe to bring it back, but it needs to be deffered because you cant call physics properties on a physics callback apparently idk
	pass
