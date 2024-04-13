@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons9.png")
extends Pattern
class_name PatternCustomShape

var shape:Curve2D
var angles:Array = []
var pos:Array = []

@export var closed_shape = false
@export var center_pos:Vector2
@export_range(0, 9999, 1, "suffix:th bullet") var center:int = 0

@export_subgroup("Shooting")
@export var symmetric:bool = false
@export var symmetry_type = Spawning.SYMTYPE.Line


func _init():
	resource_name = "PatternCustomShape"
