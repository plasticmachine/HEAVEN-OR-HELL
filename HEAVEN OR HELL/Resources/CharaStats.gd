extends Resource
class_name CharaStats

@export var character_name: String = ""
@export var move_speed: int
@export var max_heart : int
@export var current_heart: int
@export var max_magia : int
@export var current_magia: int
@export var malice: int
@export var deviltry: int
@export var guts: int
@export var luck: int
@export var crit: int

func add_heart(amount: int) -> void:
	if max_heart > current_heart:
		current_heart += amount
		if max_heart < current_heart:
			current_heart = max_heart
			print_debug(character_name + "'s max health is " + str(max_heart))
		print_debug(character_name + " has " + str(current_heart) + " heart!")
	else:
		current_heart = max_heart
		print_debug(character_name + "'s max health is " + str(max_heart))
	
	#emit_signal("stat_changed", "current_heart", current_heart)
func subtract_heart(amount: int) -> void:
	current_heart -= amount
	#emit_signal("stat_changed", "current_heart", current_heart)
func multiply_heart(factor: float) -> void:
	current_heart = int(current_heart * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_heart(divisor: float) -> void:
	if divisor != 0:
		current_heart = int(current_heart / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
