extends Node
#@onready var SwanCardSpawn = $"../Path2D/PathFollow2D/Clown2/SCardSpawn"
#@onready var FlipCardSpawn = $"../Path2D/PathFollow2D/Clown2/FCardSpawner"
@onready var BowlingSpawn = $"../BowlSpawningPoint"
@onready var Heaven = $"../Players/Heaven"
@onready var Hell = $"../Players/Hell"


@onready var ClownBH = $"../Path2D/Phase_1_Movement/Clown2"
@onready var GroupCam = $"../Cameras/GroupCam"
@onready var BH_1_Cam = $"../Cameras/BH_1_Cam"
@onready var BH_1_PathFollow2D = $"../Path2D/Phase_1_Movement"
@onready var Phase_1_Timer = $clown_PHASE_1
@onready var Phase_1_Collision = $"../Phase_1_Walls"
@onready var Phase_1_Bar = $TimerResources/Phase1Hbox/Phase1TextureProgress
@onready var BH_2_Cam = $"../Cameras/BH_2_Cam"
@onready var Phase_2_Travel_PathFollow2D = $"../Path2D/Phase_2_Travel/PathFollow2D"
@onready var Phase_2_Timer = $clown_PHASE_2
@onready var Phase_2_Collision = $"../Phase_2_Walls"
@onready var Phase_2_Trigger_Collision = $"../Phase_2_Trigger/CollisionShape2D"
@onready var Phase_2_Bar = $TimerResources/Phase2Hbox/Phase2TextureProgress
@onready var BH_3_Cam = $"../Cameras/BH_3_Cam"
@onready var Phase_3_Travel_PathFollow2D = $"../Path2D/Phase_3_Travel/PathFollow2D"
@onready var Phase_3_Timer = $clown_PHASE_3
@onready var Phase_3_Collision = $"../Phase_3_Walls"
@onready var Phase_3_Trigger_Collision = $"../Phase_3_Trigger/CollisionShape2D"
@onready var Phase_3_Bar = $TimerResources/Phase3Hbox/Phase3TextureProgress
@onready var Phase_4_Travel_PathFollow2D = $"../Path2D/Phase_4_Travel/PathFollow2D"
@onready var Phase_4_Timer = $clown_PHASE_4
@onready var Phase_4_Collision = $"../Phase_4_Walls"
@onready var Phase_4_Trigger_Collision = $"../Phase_4_Trigger"
@onready var Phase_4_Bar = $TimerResources/Phase4Hbox/Phase4TextureProgress
@onready var BH_4_Cam = $"../Cameras/BH_4_Cam"

#a bunch of variables for use in various functions
@onready var BH_2_triggerable := false
@onready var BH_3_triggerable := false
@onready var BH_4_triggerable := false

func _ready():
	BH_1_PathFollow2D.active = true

func _process(_delta):
	Phase_1_Bar.value = Phase_1_Timer.time_left
	Phase_2_Bar.value = Phase_2_Timer.time_left
	Phase_3_Bar.value = Phase_3_Timer.time_left
	
	if Phase_2_Travel_PathFollow2D.progress_ratio < .99:
		Phase_2_Trigger_Collision.set_deferred("disabled", false)
		BH_2_triggerable = false
	else: 
		BH_2_triggerable = true
	if Phase_3_Travel_PathFollow2D.progress_ratio < .99:
		Phase_3_Trigger_Collision.set_deferred("disabled", false)
	else:
		BH_3_triggerable = true
	
	#print_debug(Phase_2_Timer.time_left)
	#
	#
	#print_debug(BH_2_triggerable)

func _on_clown_phase_1_timeout():
	BH_1_Cam.set_priority(0)
	GroupCam.set_priority(1)
	Phase_1_Collision.collision_layer = 2
	Phase_1_Bar.hide()
	_clown_phase_2_travel()
	Spawning.process_kill(1)
	Spawning.process_kill(2)

func _clown_phase_2_travel():
	BH_1_PathFollow2D.remove_child(ClownBH)
	BH_1_PathFollow2D.active = false
	Phase_2_Travel_PathFollow2D.add_child(ClownBH)
	Phase_2_Travel_PathFollow2D.active = true

func _on_BH_phase_2_area_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if "PlayerArea" in area.name and BH_2_triggerable == true:
		_clown_phase_2_BH()

func _clown_phase_2_BH():
	
	Phase_2_Trigger_Collision.set_deferred("disabled", true)
	Phase_2_Collision.collision_layer = 1
	GroupCam.set_priority(0)
	#GroupCam.inactive_update_mode = true
	BH_2_Cam.set_priority(1)
	Phase_2_Bar.show()
	Phase_2_Timer.start()
	#BowlingSpawn.spawn()

func _on_clown_phase_2_timeout():
	BH_2_Cam.set_priority(0)
	GroupCam.set_priority(1)
	Phase_2_Collision.collision_layer = 2
	Phase_2_Bar.hide()
	_clown_phase_3_travel()

func _clown_phase_3_travel():
	Phase_2_Travel_PathFollow2D.remove_child(ClownBH)
	Phase_2_Travel_PathFollow2D.active = false
	Phase_3_Travel_PathFollow2D.add_child(ClownBH)
	Phase_3_Travel_PathFollow2D.active = true

func _on_phase_3_trigger_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if "PlayerArea" in area.name and BH_3_triggerable == true:
		_clown_phase_3_BH()

func _clown_phase_3_BH():
	Phase_3_Trigger_Collision.set_deferred("disabled", true)
	Phase_3_Collision.collision_layer = 2
	GroupCam.set_priority(0)
	BH_3_Cam.set_priority(1)
	Phase_3_Bar.show()
	Phase_3_Timer.start()
