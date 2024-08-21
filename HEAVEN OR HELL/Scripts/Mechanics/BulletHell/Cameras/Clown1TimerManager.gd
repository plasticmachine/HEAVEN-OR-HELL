extends Node

@onready var GroupCam = $"../Cameras/GroupCam"
@onready var BH_1_Cam = $"../Cameras/BH_1_Cam"
@onready var Phase_1_Timer = $clown_PHASE_1
@onready var Phase_1_Collision = $"../Phase_1_Walls"
@onready var Phase_1_Bar = $TimerResources/Phase1Hbox/Phase1TextureProgress


func _ready():
	Phase_1_Timer.wait_time = Phase_1_Bar.value

func _on_clown_phase_1_timeout():
	BH_1_Cam.set_priority(0)
	GroupCam.set_priority(1)
	Phase_1_Collision.collision_layer = 2
	Phase_1_Bar.hide()


func _process(_delta):
	Phase_1_Bar.value = Phase_1_Timer.time_left
