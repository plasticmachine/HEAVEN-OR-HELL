extends Node2D

@onready var HellTBAnimation = $"../HellTbAnimation"

@onready var BlockBox = $"../BlockArea/BlockBox"
@onready var ParryBox = $"../ParryArea/ParryBox"
@onready var hellinventory = preload("res://Resources/Inventories/HellInventory.tres")

@export var block_window: float
@export var block_timeout: float
@export var parry_window: float
@export var parry_timeout: float

#
#func _ready() -> void:
	##block_possible = true	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("block_hell") and hellinventory.can_block:
		BlockBox.disabled = false
		#HeavenTBAnimation.play("hit")
		hellinventory.can_block = false
		await get_tree().create_timer(block_window).timeout
		#HeavenTBAnimation.play("idle")
		BlockBox.disabled = true
		await get_tree().create_timer(block_timeout).timeout
		hellinventory.can_block = true
	
	if Input.is_action_just_pressed("parry_hell") and hellinventory.can_parry:
		ParryBox.disabled = false
		#HellTBAnimation.play("hit")
		hellinventory.can_block = false
		await get_tree().create_timer(parry_window).timeout
		#HellTBAnimation.play("idle")
		ParryBox.disabled = true
		await get_tree().create_timer(parry_timeout).timeout
		hellinventory.can_block = true
	
