extends CollisionShape2D


var main = "res://Scenes/main.tscn"

func _on_clown_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/TurnBased.tscn")
