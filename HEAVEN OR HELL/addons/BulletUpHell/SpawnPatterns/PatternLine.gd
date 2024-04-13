@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons7.png")
extends Pattern
class_name PatternLine



@export var offset:Vector2
@export_range(-1, 9999, 1, "suffix:th bullet") var center:int = 0

@export_subgroup("Shooting")
@export var symmetric:bool = true
var symmetry_type = Spawning.SYMTYPE.Line


func _init():
	resource_name = "PatternLine"
