extends Button


func _on_pressed():
	YASM.load_scene("res://Scenes/main.tscn")
	
func _on_exit_button_pressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()

