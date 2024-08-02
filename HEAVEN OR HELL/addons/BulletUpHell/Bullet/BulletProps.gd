@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons15.png")
extends PackedDataContainer
class_name BulletProps

@export var damage:float = 1
@export var speed:float = 100
@export var scale:float = 1
@export_range(-PI,PI) var angle:float = 0
@export var groups:PackedStringArray

@export var custom_data:Dictionary = Spawning.custom_bullet_prop_data

## destruction
@export_group("Destruction", "death_")
@export_range(0, 999999, 0.001, "hide_slider") var death_after_time:float = 30
@export var death_outside_box:Rect2 = Rect2()
@export var death_from_collision:bool = true
@export_range(0, 999999, 0.1, "hide_slider") var death_speed_under:float = 0
enum CullingLevel {Anim, Move, Full, Inherit}
@export var death_culling_overwrite:CullingLevel = CullingLevel.Inherit

## animations
@export_group("Animation", "anim_")
@export_subgroup("Color", "spec_")
@export var spec_modulate:Gradient
@export var spec_modulate_loop:float = 0.0
@export var anim_idle:animState
@export var anim_spawn:animState
@export var anim_shoot:animState
@export var anim_waiting:animState
@export var anim_delete:animState
@export var anim_more:Array[animState] = []
@export_subgroup("Trail", "spec_trail_")
@export var spec_trail_length:float = 0.0
@export var spec_trail_width:float = 0.0
@export var spec_trail_modulate:Color = Color.WHITE

## movement
@export_group("Movement", "a_")
enum CURVE_TYPE{None,LoopFromStart,OnceThenDie,OnceThenStay,LoopFromEnd}
@export var a_direction_equation:String = ""
@export var a_angular_equation:String = ""
@export var a_curve_movement:CURVE_TYPE = CURVE_TYPE.None
var curve:Curve2D = null
@export_range(-1, 999999) var a_speed_multi_iterations:int = 0
@export var a_speed_multi_scale:float
@export var a_speed_multiplier:Curve = Curve.new()

## special props
@export_group("Physics", "spec_")
@export_range(-1, 999999) var spec_bounces:int = 0
@export var spec_no_collision:bool = false
@export var spec_rotating_speed:float = 0.0
@export var spec_only_spin_sprite:bool = true
@export var spec_weight:float = 1
#var spec_angle_no_colliding:float = 0.0
#var spec_angle_no_coll_offset:float = 0.0
## advanced scale
@export_subgroup("Scale", "scale_")
@export_range(-1, 999999) var scale_multi_iterations:int = 0
@export var scale_multiplier:Curve = Curve.new()
@export var scale_multi_scale:float = 1

## triggers
@export_group("Triggers", "trigger")
@export_placeholder("Container ID") var trigger_container:String
@export var trigger_wait_for_shot:bool = true

## homing
enum GROUP_SELECT{Nearest_on_homing,Nearest_on_spawn,Nearest_on_shoot,Nearest_anywhen,Random}
enum LIST_BEHAVIOUR{Stop, Loop, Reverse}
enum TARGET_TYPE{Nodepath, Position, SpecialNode, Group, Surface, ListPositions, ListNodes, MouseCursor}
var homing_type:int = TARGET_TYPE.Nodepath : set = set_homing_type
var homing_target:NodePath = NodePath()
var homing_special_target:String
var homing_group:String
var homing_select_in_group:int = GROUP_SELECT.Nearest_on_homing
var homing_surface:Array
var homing_list:Array
var homing_list_pos:Array[Vector2]
var homing_list_nodes:Array[NodePath]
var homing_list_ordered:bool = true
var homing_when_list_ends:int = LIST_BEHAVIOUR.Stop
var homing_position:Vector2
var homing_steer:float = 0
var homing_time_start:float = 0
var homing_duration:float = 999
var homing_mouse:bool
var homing_detection_dist:float = 0
var homing_start_signal:String = ""
var homing_range:Vector2 = Vector2(9999, 20)
var homing_imprecision:Vector2 = Vector2(0,0)

@export_subgroup("","")
## random
var r_randomisation_chances:float=1
# physics
var r_speed_multi_iter_variation:Vector3
var r_speed_multi_scale_variation:Vector3
var r_rotating_variation:Vector3
var r_steer_variation:Vector3
var r_homing_delay_variation:Vector3
var r_homing_dur_variation:Vector3
var r_scale_multi_iter_variation:Vector3
var r_scale_multi_scale_variation:Vector3
var r_trail_length_variation:Vector3
var r_trail_color_variation:Vector3
# setup
var r_speed_choice:PackedFloat32Array
var r_speed_variation:Vector3
var r_scale_variation:Vector3
var r_angle_variation:Vector3
var r_group_choice:Array
var r_scale_choice:PackedFloat32Array
var r_angle_choice:PackedFloat32Array
var r_dir_equation_choice:PackedStringArray
var r_curve_choice:Array
var r_speed_multi_curve_choice:Array
var r_homing_target_choice:Array
var r_special_target_choice:PackedStringArray
var r_group_target_choice:PackedStringArray
var r_pos_target_choice:PackedVector2Array
var r_steer_choice:PackedFloat32Array
var r_homing_delay_choice:PackedFloat32Array
var r_homing_dur_choice:PackedFloat32Array
var r_scale_multi_curve_choice:Array
var r_bounce_choice:PackedInt32Array
var r_death_after_choice:PackedFloat32Array
var r_death_after_variation:Vector3
var r_trigger_choice:PackedStringArray
var r_bounce_variation:Vector3
var r_death_outside_chances:float
var r_wait_for_shot_chances:float
# draw
# animations directly in
#todo
var r_no_coll_chances:float
var r_modulate_variation:Vector3


var node_homing:Node2D
var node_container:Node2D


var anim_idle_texture:String = "0"
var anim_spawn_texture:String
var anim_waiting_texture:String
var anim_delete_texture:String
var anim_idle_collision:String = "0"
var anim_spawn_collision:String
var anim_waiting_collision:String
var anim_delete_collision:String
var anim_idle_sfx:int = -1 #TODO change to string
var anim_spawn_sfx:int = -1
var anim_waiting_sfx:int = -1
var anim_delete_sfx:int = -1

func set_homing_type(value):
	homing_type = value
	_get_property_list()
	notify_property_list_changed()

func _get_property_list() -> Array:
	var PL1 = [
		{
			name = "Homing",
			type = TYPE_NIL,
			hint_string = "homing_",
			usage = PROPERTY_USAGE_GROUP
		},{
			name = "homing_type",
			type = TYPE_INT,
			hint = PROPERTY_HINT_ENUM,
			hint_string = TARGET_TYPE,
			usage = PROPERTY_USAGE_DEFAULT
		}]
	var PL_homing = [{
			name = "homing_target",
			type = TYPE_NODE_PATH,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_position",
			type = TYPE_VECTOR2,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_special_target",
			type = TYPE_STRING,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_group",
			type = TYPE_STRING,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_surface",
			type = TYPE_ARRAY,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_list_pos",
			type = TYPE_ARRAY,
			hint = PROPERTY_HINT_ARRAY_TYPE,
			hint_string = "Vector2",
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_list_nodes",
			type = TYPE_ARRAY,
			hint = PROPERTY_HINT_ARRAY_TYPE,
			hint_string = "NodePath",
			usage = PROPERTY_USAGE_DEFAULT
		}]
	var PL_homing_group = [{
			name = "homing_select_in_group",
			type = TYPE_INT,
			hint = PROPERTY_HINT_ENUM,
			hint_string = GROUP_SELECT,
			usage = PROPERTY_USAGE_DEFAULT
		}]
	var PL_homing_list = [{
			name = "homing_list_ordered",
			type = TYPE_BOOL,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_when_list_ends",
			type = TYPE_INT,
			hint = PROPERTY_HINT_ENUM,
			hint_string = LIST_BEHAVIOUR,
			usage = PROPERTY_USAGE_DEFAULT
		}]

	if homing_type != 7: PL_homing = [PL_homing[homing_type]]
	else: PL_homing = []
	if homing_type in [TARGET_TYPE.Group, TARGET_TYPE.Surface, TARGET_TYPE.MouseCursor]: PL_homing += PL_homing_group
	elif homing_type in [TARGET_TYPE.ListNodes,TARGET_TYPE.ListPositions]: PL_homing += PL_homing_list

	var PL2 = [{
			name = "homing_steer",
			type = TYPE_FLOAT,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_time_start",
			type = TYPE_FLOAT,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_duration",
			type = TYPE_FLOAT,
			hint = PROPERTY_HINT_RANGE,
			hint_string = "0, 999999",
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_detection_dist",
			type = TYPE_FLOAT,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_start_signal",
			type = TYPE_STRING,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_range",
			type = TYPE_VECTOR2,
			usage = PROPERTY_USAGE_DEFAULT
		},{
			name = "homing_imprecision",
			type = TYPE_VECTOR2,
			usage = PROPERTY_USAGE_DEFAULT
		},
		{
			name = "Random",
			type = TYPE_NIL,
			hint_string = "r_",
			usage = PROPERTY_USAGE_GROUP
		},
		{ name = "r_randomisation_chances", type = TYPE_FLOAT,
			hint = PROPERTY_HINT_RANGE, hint_string = "0, 1", usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_speed_choice", type = TYPE_PACKED_FLOAT32_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_speed_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_scale_choice", type = TYPE_PACKED_FLOAT32_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_scale_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_angle_choice", type = TYPE_PACKED_FLOAT32_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_angle_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_group_choice", type = TYPE_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_bounce_choice", type = TYPE_PACKED_INT32_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_bounce_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_no_coll_chances", type = TYPE_FLOAT,
			hint = PROPERTY_HINT_RANGE, hint_string = "0, 1", usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_modulate_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_trail_length_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_trail_color_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_rotating_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_death_after_choice", type = TYPE_PACKED_FLOAT32_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_death_after_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_death_outside_chances", type = TYPE_FLOAT,
			hint = PROPERTY_HINT_RANGE, hint_string = "0, 1", usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_dir_equation_choice", type = TYPE_PACKED_STRING_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_curve_choice", type = TYPE_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_speed_multi_curve_choice", type = TYPE_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_speed_multi_iter_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_speed_multi_scale_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_trigger_choice", type = TYPE_PACKED_STRING_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_wait_for_shot_chances", type = TYPE_FLOAT,
			hint = PROPERTY_HINT_RANGE, hint_string = "0, 1", usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_homing_target_choice", type = TYPE_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_special_target_choice", type = TYPE_PACKED_STRING_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_group_target_choice", type = TYPE_PACKED_STRING_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_pos_target_choice", type = TYPE_PACKED_VECTOR2_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_steer_choice", type = TYPE_PACKED_FLOAT32_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_steer_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_homing_delay_choice", type = TYPE_PACKED_FLOAT32_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_homing_delay_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_homing_dur_choice", type = TYPE_PACKED_FLOAT32_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_homing_dur_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_scale_multi_curve_choice", type = TYPE_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_scale_multi_iter_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_scale_multi_scale_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT }
		]
	return PL1+PL_homing+PL2
