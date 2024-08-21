extends CollisionShape2D

func _on_clown_body_entered(body):
	if body.is_in_group("Player"):
		StatSaver.save_hellstats_to_file(StatSaver.Hellstats)
		StatSaver.save_heavenstats_to_file(StatSaver.Heavenstats)
		YASM.load_scene("res://Scenes/Levels/TurnBased/TBCLOWN.tscn")#,  [get_tree().create_timer(5.0).timeout])
		Spawning.reset()
