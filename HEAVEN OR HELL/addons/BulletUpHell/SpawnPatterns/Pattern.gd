@tool
@icon("res://addons/BulletUpHell/Sprites/NodeIcons4.png")
extends NavigationPolygon
class_name Pattern

@export_placeholder("BulletProps ID") var bullet:String = ""
@export_range(0, 9999, 1, "suffix:bullets") var nbr:int = 1
@export_range(-1, 9999, 1) var iterations:int = 1

@export_group("Cooldowns", "cooldown_")
@export_range(0, 999999, 0.02, "hide_slider", "suffix:s") var cooldown_spawn:float = 1
@export_range(0, 999999, 0.02, "hide_slider", "suffix:s") var cooldown_shoot:float = 0
@export_range(0, 999999, 0.02, "hide_slider", "suffix:s") var cooldown_next_spawn:float = 0
@export_range(0, 999999, 0.02, "hide_slider", "suffix:s") var cooldown_next_shoot:float = 0
@export_subgroup("Advanced", "cooldown_")
@export var cooldown_layers:PackedVector2Array
var max_layer:int = 0
@export var cooldown_stasis:bool = false

@export_group("Spawning")
enum INTERRUPT {Continue, Destroy, Shoot}
@export var on_interruption:INTERRUPT = INTERRUPT.Continue
@export_subgroup("Forced Spawning Angle", "pattern_")
@export_range(-999999, 999999, 0.001, "hide_slider", "suffix:°", "radians_as_degrees") var pattern_angle:float = 0.0
@export var pattern_angle_target:NodePath
@export var pattern_angle_mouse:bool = false
@export_subgroup("Wait", "wait_")
enum LATENCE {No, PositionOnly, Rotation, Spin, Aim}
@export var wait_behavior:LATENCE = LATENCE.No
enum MOMENTUM{None,TRANS_LINEAR,TRANS_SINE,TRANS_QUINT,TRANS_QUART,TRANS_QUAD,TRANS_EXPO,TRANS_ELASTIC,TRANS_CUBIC, \
				TRANS_CIRC,TRANS_BOUNCE,TRANS_BACK}
@export var wait_tween_momentum:MOMENTUM = MOMENTUM.None
@export var wait_tween_length:float = 0
@export var wait_tween_time:float = 0

@export_group("Shooting")
#@export_group("Forced Angle", "forced_")
@export_range(-999999, 999999, 0.001, "hide_slider", "suffix:°", "radians_as_degrees") var forced_angle:float = 0.0
@export var forced_target:NodePath
@export var forced_lookat_mouse:bool = false
@export var forced_pattern_lookat:bool = true
@export_range(0, 999999, 1) var impulse:int = 0

@export_group("Advanced")
@export var bullet_list:Array[String]
@export_subgroup("Skipping", "skip_")
@export_range(0, 999999) var skip_step:int
@export var skip_list:Array[PackedInt32Array]
var skip_array:Array[PackedInt32Array]
@export var skip_in_list:bool = true

@export_group("Random", "random_")
@export var random:PatternRandomizer

var has_random
var node_target:Node2D


