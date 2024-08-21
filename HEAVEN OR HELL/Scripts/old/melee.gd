extends Area2D

@export var attackCooldown: float
@export var actionTimer: float
@export var attackRange: float
@export var attackWindow: float




func _ready() -> void:
	hide()
	

func _physics_process(delta):
	#Handling Attack cooldown and subtracts it by the delta argument
	if actionTimer > 0:
		actionTimer -= delta
		
	#Sees if the melee input is pressed, and it sees if the attack timer is zero and if both of those are true then it runs the attack() function
	if Input.is_action_pressed("Melee_hell") and actionTimer <= 0:
		attack()


func _update_actionTimer(_value):
	actionTimer = _value
	

func attack():
	show()
	$MeleeHitbox.set_deferred("disabled", false)
	$MeleeHitbox/AnimatedSprite2D.play("meleeAttack")
	#gets the reference to the melee weapons hitbox
	var meleerange = $MeleeRange
	var hitbox = $MeleeHitbox
	
	#Gets the global position of the mouse, where it is on screen
	var mouse_position = get_global_mouse_position()
	
	#Calculates direction from the player character to the mouse cursor
	var attack_direction = (mouse_position - global_position).normalized()
	
	
	#print_debug(mouse_position, attack_direction)
	#Sets the melee range position and rotation based on the direction
	meleerange.position = attack_direction * attackRange
	meleerange.rotation = atan2(attack_direction.y, attack_direction.x)
	
	hitbox.position = attack_direction * attackRange

	hitbox.rotation = atan2(attack_direction.y, attack_direction.x)
	
	await get_tree().create_timer(attackWindow).timeout
	actionTimer = attackCooldown
	#print_debug(actionTimer)
	
	hide()
	$MeleeHitbox.set_deferred("disabled", true)
	$MeleeHitbox/AnimatedSprite2D.stop()


func _on_body_entered(body):
	if body.is_in_group("Mobs"):
		body.explode()
