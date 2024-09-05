extends CanvasLayer

#func process():
	#unpause()
#
#func unpause():
	#if Input.is_action_pressed("pause_heaven"):
		#get_tree().paused = false
		#hide()

func ready():
	show()

func _on_unpause_button_pressed() -> void:
		get_tree().paused = false
		hide()
