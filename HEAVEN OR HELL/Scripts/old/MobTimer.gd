extends Timer

var totalTimer = .40
var decreaseAmount = .02



func _on_timeout():
	totalTimer -= decreaseAmount
	
	if totalTimer <= .10:
		totalTimer <= .5
		
		totalTimer = .25
	
	set_wait_time(totalTimer)
#
	



func _on_player_hit():
	if totalTimer < .50:
		totalTimer = .50
