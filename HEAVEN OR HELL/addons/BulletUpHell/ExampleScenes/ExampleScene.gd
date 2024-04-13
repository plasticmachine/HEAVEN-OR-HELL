extends Node2D



func _process(delta):
	$FPS.text = str(Engine.get_frames_per_second())+" FPS\n"+str(Spawning.poolBullets.size())
#
#	$PlayerTest.position.x += 1



func _on_PlayerTest_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	print("ok")
	pass



func _on_player_test_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print($PlayerTest.position)
	pass # Replace with function body.


func _input(event):
	if event.is_action("ui_accept"):
		Spawning.reset()
		get_tree().change_scene_to_file("res://addons/BulletUpHell/ExampleScenes/Example2_Pattern_Properties.tscn")


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("area detects bullet")
