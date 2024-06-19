extends CollisionShape2D




#func _on_clown_area_entered(area):
	#if area.is_in_group("Player"):
		#SceneManager.change_scene(scene, fade_out_options, fade_in_options, general_options)





func _on_clown_body_entered(body):
	if body.is_in_group("Player"):
		YASM.load_scene("res://Scenes/TurnBased.tscn",  [get_tree().create_timer(5.0).timeout])
