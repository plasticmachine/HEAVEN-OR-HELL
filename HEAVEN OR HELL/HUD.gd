extends CanvasLayer

signal start_game #creates the signal to send to the main node

func show_message(text):
	$TitleScreen.text = text
	$TitleScreen.show()
	$MessageTimer.start()

func show_game_over():
	show_message("GAME OVER!")
	await $MessageTimer.timeout #It's waitingd for the message timer to count down
	
	#Message.text = ("Reimu's no good very bad day")
	$TitleScreen.show()
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func update_difficulty(difficulty):
	$DifficultyLabel.text = str(difficulty)

func _on_start_button_pressed():
	$TitleScreen.hide()
	$StartButton.hide()
	
#	start_game.emit()
	
	
func _on_message_timer_timeout():
	$TitleScreen.hide()



