@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons6.png")
extends Pattern
class_name PatternCircle


@export_range(0, 999999, 0.001, "hide_slider", "suffix:px") var radius:float = 0
@export_range(0, 360, 0.001, "suffix:°", "radians_as_degrees") var angle_total:float = 2*PI
@export_range(0, 360, 0.001, "suffix:°", "radians_as_degrees") var angle_decal:float = 0
@export_range(0, 9999, 1, "suffix:th bullet") var center:int = 0

@export_subgroup("Shooting")
@export var symmetric:bool = false
var symmetry_type = Spawning.SYMTYPE.ClosedShape

func _init():
	resource_name = "PatternCircle"
