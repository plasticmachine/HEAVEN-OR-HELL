extends Node2D

@onready var HeavenTBAnimation = $"../HeavenTbAnimation"

@onready var BlockBox = $"../BlockArea/BlockBox"
@onready var ParryBox = $"../ParryArea/ParryBox"
@onready var heaveninventory = preload("res://Resources/Inventories/HeavenInventory.tres")
#@onready var block_possible: bool = false
#@onready var parry_possible: bool = false

@export var block_window: float
@export var block_timeout: float
@export var parry_window: float
@export var parry_timeout: float


#
#func _ready() -> void:
	##block_possible = true	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("block_heaven") and heaveninventory.can_block:
		BlockBox.disabled = false
		#HeavenTBAnimation.play("hit")
		heaveninventory.can_block = false
		await get_tree().create_timer(block_window).timeout
		#HeavenTBAnimation.play("idle")
		BlockBox.disabled = true
		await get_tree().create_timer(block_timeout).timeout
		heaveninventory.can_block = true
	
	if Input.is_action_just_pressed("parry_heaven") and heaveninventory.can_parry:
		ParryBox.disabled = false
		#HeavenTBAnimation.play("hit")
		heaveninventory.can_block = false
		await get_tree().create_timer(parry_window).timeout
		#HeavenTBAnimation.play("idle")
		ParryBox.disabled = true
		await get_tree().create_timer(parry_timeout).timeout
		heaveninventory.can_block = true
	
