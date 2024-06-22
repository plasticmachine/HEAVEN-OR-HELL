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
func add_move_speed(amount: int) -> void:
		move_speed += amount
		print_debug(character_name + " has " + str(move_speed) + " movement speed! (+ " + str(amount) + ")")
	#emit_signal("stat_changed", "current_heart", current_heart)
func subtract_move_speed(amount: int) -> void:
	if move_speed >= 1:
		move_speed -= amount
		print_debug(character_name + " has " + str(move_speed) + " heart! (-" + str(amount) + ")")
	else:
		move_speed == 0
		print_debug(character_name + " is as slow as a snail!!! ")
	#emit_signal("stat_changed", "current_heart", current_heart)
func multiply_move_speed(factor: float) -> void:
	move_speed = int(move_speed * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_move_speed(divisor: float) -> void:
	if divisor != 0:
		move_speed = int(move_speed / divisor)
func add_heart(amount: int) -> void:
	if max_heart > current_heart:
		current_heart += amount
		if max_heart < current_heart:
			current_heart = max_heart
			print_debug(character_name + "'s max health is " + str(max_heart))
		print_debug(character_name + " has " + str(current_heart) + " heart! (+" + str(amount) + ")")
	else:
		current_heart = max_heart
		print_debug(character_name + "'s max health is " + str(max_heart))
	
	#emit_signal("stat_changed", "current_heart", current_heart)
func subtract_heart(amount: int) -> void:
	if current_heart >= 1:
		current_heart -= amount
		print_debug(character_name + " has " + str(current_heart) + " heart! (-" + str(amount) + ")")
	else:
		current_heart == 0
		print_debug(character_name + " is already fucking dead!!! ")
	#emit_signal("stat_changed", "current_heart", current_heart)
func multiply_heart(factor: float) -> void:
	current_heart = int(current_heart * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_heart(divisor: float) -> void:
	if divisor != 0:
		current_heart = int(current_heart / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func add_magia(amount: int) -> void:
	if max_magia > current_magia:
		current_magia += amount
		if max_magia < current_magia:
			current_magia = max_magia
			print_debug(character_name + "'s max magia is " + str(max_magia))
		print_debug(character_name + " has " + str(current_magia) + " magia! (+" + str(amount) + ")")
	else:
		current_magia = max_magia
		print_debug(character_name + "'s max magia is " + str(max_magia))
func subtract_magia(amount: int) -> void:
	
	if current_magia >= 1:
		current_magia -= amount
		print_debug(character_name + " has " + str(current_magia) + " magia! (-" + str(amount) + ")")
	else:
		current_magia == 0
		print_debug(character_name + " is all out of juice!!! ")
func multiply_magia(factor: float) -> void:
	current_magia = int(current_magia * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_magia(divisor: float) -> void:
	if divisor != 0:
		current_magia = int(current_magia / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
