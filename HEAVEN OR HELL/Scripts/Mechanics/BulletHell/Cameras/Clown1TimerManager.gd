extends Node
#@onready var SwanCardSpawn = $"../Path2D/PathFollow2D/Clown2/SCardSpawn"
#@onready var FlipCardSpawn = $"../Path2D/PathFollow2D/Clown2/FCardSpawner"
#@onready var BowlingSpawn = $"../Path2D/PathFollow2D/Clown2/BowlSpawningPoint"
@onready var Heaven = $"../Players/Heaven"
@onready var Hell = $"../Players/Hell"


@onready var ClownBH = $"../Path2D/PathFollow2D/Clown2"
@onready var GroupCam = $"../Cameras/GroupCam"
@onready var BH_1_Cam = $"../Cameras/BH_1_Cam"
@onready var BH_1_PathFollow2D = $"../Path2D/PathFollow2D"
@onready var Phase_1_Timer = $clown_PHASE_1
@onready var Phase_1_Collision = $"../Phase_1_Walls"
@onready var Phase_1_Bar = $TimerResources/Phase1Hbox/Phase1TextureProgress
@onready var BH_2_Cam = $"../Cameras/BH_2_Cam"
@onready var Phase_2_Travel_PathFollow2D = $"../Path2D/Path2D/PathFollow2D"
@onready var Phase_2_Collision = $"../Phase_2_Walls"
@onready var Phase_2_Trigger = $"../Phase_2_Trigger"



#a bunch of variables for use in various functions
@onready var BH_2_triggerable := false

func _ready():
	Phase_1_Timer.wait_time = Phase_1_Bar.value
	BH_1_PathFollow2D.active = true

func _process(_delta):
	Phase_1_Bar.value = Phase_1_Timer.time_left
	
	if Phase_2_Travel_PathFollow2D.progress_ratio > .99:
		BH_2_triggerable = true

func _on_clown_phase_1_timeout():
	BH_1_Cam.set_priority(0)
	GroupCam.set_priority(1)
	Phase_1_Collision.collision_layer = 2
	Phase_1_Bar.hide()
	_clown_phase_2_travel()
	
	
func _clown_phase_2_travel():
	
	BH_1_PathFollow2D.remove_child(ClownBH)
	BH_1_PathFollow2D.active = false
	Phase_2_Travel_PathFollow2D.add_child(ClownBH)
	Phase_2_Travel_PathFollow2D.active = true

func _clown_phase_2_BH():
	Phase_2_Trigger.set_deferred("monitoring", false)
	Phase_2_Collision.collision_layer = 1
	GroupCam.set_priority(0)
	GroupCam.inactive_update_mode = true
	BH_2_Cam.set_priority(2)


func _on_BH_phase_2_area_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Player") and BH_2_triggerable == true:
		_clown_phase_2_BH()
