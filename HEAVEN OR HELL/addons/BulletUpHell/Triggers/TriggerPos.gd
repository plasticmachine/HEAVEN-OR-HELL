@icon("res://addons/BulletUpHell/Sprites/NodeIcons12.png")
extends RichTextEffect
class_name TriggerPos

enum AXIS { X, Y, BOTH}
@export var on_axis:AXIS = AXIS.BOTH
@export var pos:Vector2
@export var target:NodePath
@export_range(1, 999999, 1, "suffix:px", "hide_slider") var distance:float = 10

var node_target:Node2D

func _init():
	resource_name = "TrigPos"
