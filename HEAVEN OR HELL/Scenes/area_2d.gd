extends Area2D

signal hit
@export var speed = 450 #speed of player
var screen_size #size of game window
var meleeScript

func _ready():
	meleeScript = $Melee
	screen_size = get_viewport_rect().size
	hide()


func _process(delta):
	var velocity = Vector2.ZERO #the players movement vector, currently set to (0,0)
	var direction_left
	var direction_right
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		direction_right = true
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		direction_left = true
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed #normalizes the velocity variable so it cant go above 1
		$AnimatedSprite2D.play()
	if direction_left:
		$AnimatedSprite2D.animation = "left"
	elif direction_right:
		$AnimatedSprite2D.animation = "right"
	if Input.is_action_pressed("move_up"):
		if Input.is_action_pressed("move_left"): 
			$AnimatedSprite2D.animation = "up_left"
		elif Input.is_action_pressed("move_right"):
			$AnimatedSprite2D.animation = "up_right"
		elif Input.is_action_pressed("move_up"):
			$AnimatedSprite2D.animation = "up"

	if Input.is_action_pressed("move_down"):
		if Input.is_action_pressed("move_left"):
			$AnimatedSprite2D.animation = "down_left"
		elif Input.is_action_pressed("move_right"):
			$AnimatedSprite2D.animation = "down_right"
		elif Input.is_action_pressed("move_down"):
			$AnimatedSprite2D.animation = "down"
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta #updates the position to the direction of the key pressed, velocity is updated thru keypresses and then is used in this simple formula to get the new position
	position = position.clamp(Vector2.ZERO, screen_size) #clamps the player to the screensize so they cant go out of the window
	
	
	print_debug(velocity)


#func _physics_process(delta):
#	if Input.is_action_pressed("Melee") and meleeScript.attack:
#		meleeScript.attack()
##	else:
##		$Melee/MeleeHitbox.hide()
##		#$Melee/MeleeHitbox.set_deferred("disabled", true)

func start(pos):
	position = pos
	show() # makes sure the player is visible when resetting the game
	$CollisionShape2D.disabled = false # makes sure the collision shape is on when starting

@warning_ignore("unused_parameter")
func _on_body_entered(body):
	hide() #player disappears after being hit
	hit.emit() #emits hit signal
	$CollisionShape2D.set_deferred("disabled", true) # disables the shape until its safe to bring it back, but it needs to be deffered because you cant call physics properties on a physics callback apparently idk
