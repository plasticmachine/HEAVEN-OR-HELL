extends Node2D

@onready var HellTBAnimation = $"../HellTbAnimation"

@onready var BlockBox = $"../BlockArea/BlockBox"
@onready var ParryBox = $"../ParryArea/ParryBox"
@onready var block_possible := true
@onready var parry_possible := true

@export var block_window: float
@export var block_timeout: float
@export var parry_window: float
@export var parry_timeout: float

#
#func _ready() -> void:
	##block_possible = true	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("block_hell") and block_possible:
		BlockBox.disabled = false
		#HeavenTBAnimation.play("hit")
		block_possible = false
		await get_tree().create_timer(block_window).timeout
		#HeavenTBAnimation.play("idle")
		BlockBox.disabled = true
		await get_tree().create_timer(block_timeout).timeout
		block_possible = true
	
	if Input.is_action_just_pressed("parry_hell") and parry_possible:
		ParryBox.disabled = false
		#HellTBAnimation.play("hit")
		parry_possible = false
		await get_tree().create_timer(parry_window).timeout
		#HellTBAnimation.play("idle")
		ParryBox.disabled = true
		await get_tree().create_timer(parry_timeout).timeout
		parry_possible = true
	
