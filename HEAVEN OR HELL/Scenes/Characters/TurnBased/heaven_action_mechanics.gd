extends Node2D

@onready var HeavenTBAnimation = $"../HeavenTbAnimation"

@onready var BlockBox = $"../BlockArea/BlockBox"
@onready var ParryBox = $"../ParryArea/ParryBox"
@onready var block_possible := true

@export var block_window: float
@export var block_timeout: float

func _ready() -> void:
	block_possible = true	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("block_heaven") and block_possible:
		BlockBox.disabled = false
		block_possible = false
		await get_tree().create_timer(block_window).timeout
		BlockBox.disabled = true
		await get_tree().create_timer(block_timeout).timeout
		block_possible = true
	
