@icon("res://addons/BulletUpHell/Sprites/NodeIcons23.png")
extends Resource
class_name PatternRandomizer

@export var randomisation_chances:float=1
@export var bullet_choice:PackedStringArray # main spawn
@export var nbr_choice:PackedInt32Array # main spawn
@export var nbr_variation:Vector3 # main spawn
@export var nbr_reroll:bool # main spawn
#@export var pattern_angle_choice:PackedFloat32Array
#@export var pattern_angle_variation:Vector3
#@export var pattern_angle_reroll:bool
#@export var infinite_iter_chances:float=0
@export var iterations_choice:PackedInt32Array # main spawn
@export var iterations_variation:Vector3 # main spawn
@export var forced_angle_choice:PackedFloat32Array
@export var forced_angle_variation:Vector3
@export var forced_angle_reroll:bool
@export var forced_target_choice:Array
@export var symmetry_chances:float=0
@export var center_choice:PackedInt32Array  # main spawn
@export var stasis_chances:float=0
# plan
@export_group("General : cooldowns")
@export var cooldown_spawn_choice:PackedFloat32Array
@export var cooldown_spawn_variation:Vector3
@export var cooldown_spawn_reroll:bool
@export var cooldown_shoot_choice:PackedFloat32Array
@export var cooldown_shoot_variation:Vector3
@export var cooldown_shoot_reroll:bool
@export var cooldown_next_spawn_choice:PackedFloat32Array
@export var cooldown_next_spawn_variation:Vector3
@export var cooldown_next_spawn_reroll:bool
@export var cooldown_next_shoot_choice:PackedFloat32Array
@export var cooldown_next_shoot_variation:Vector3
@export var cooldown_next_shoot_reroll:bool
# TODO wait momentum

@export_group("PatternLine & CustomPoints")
#@export var offset_choice:String
@export var offset_x_variation:Vector3
@export var offset_y_variation:Vector3
@export var offset_x_reroll:bool
@export var offset_y_reroll:bool

@export_group("PatternCircle & CustomShape")
@export var radius_choice:PackedFloat32Array
@export var radius_variation:Vector3
@export var radius_reroll:bool
@export var angle_total_choice:PackedFloat32Array
@export var angle_total_variation:Vector3
@export var angle_total_reroll:bool
@export var angle_decal_choice:PackedFloat32Array
@export var angle_decal_variation:Vector3
@export var angle_decal_reroll:bool

#@export_group("PatternCustomArea")
#@export var grid_choice:String
#@export var grid_x_variation:Vector3
#@export var grid_y_variation:Vector3

@export_group("PatternCustomPoints")
@export var reversed_chances:float=0
#@export var angles_choice:Array = []





