extends CollisionShape2D
@onready var BHCAM = $"../../Cameras/BH_1_Cam"
@onready var GROUPCAM = $"../../Cameras/GroupCam"


func _on_area_2d_area_shape_entered(_area_rid, _area, _area_shape_index, _local_shape_index):
	BHCAM.set_priority(0)
	GROUPCAM.set_priority(1)
