extends Resource
class_name CharaStats


@export var character_name: String = ""
@export var move_speed: int
@export var max_heart : int
@export var current_heart: int
var rolling_health: int
@export var max_magia : int
@export var current_magia: int
@export var malice: int
@export var deviltry: int
@export var guts: int
@export var luck: int
@export var crit: int
@export var crit_level: int

### MOVESPEED FUNCTIONS
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
### HEART FUNCTIONS
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
### MAGIA FUNCTIONS
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
### MALICE FUNCTIONS
func add_malice(amount: int) -> void:
		malice += amount
		print_debug(character_name + " has " + str(malice) + " malice! (+" + str(amount) + ")")
func subtract_malice(amount: int) -> void:
	if malice >= 1:
		malice -= amount
		print_debug(character_name + " has " + str(malice) + " malice! (-" + str(amount) + ")")
	else:
		malice == 0
		print_debug(character_name + "'s violence has come to an end. ")
func multiply_malice(factor: float) -> void:
	malice = int(malice * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_malice(divisor: float) -> void:
	if divisor != 0:
		malice = int(malice / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
### DEVILTRY FUNCTIONS
func add_deviltry(amount: int) -> void:
		deviltry += amount
		print_debug(character_name + " has " + str(deviltry) + " deviltry! (+" + str(amount) + ")")
func subtract_deviltry(amount: int) -> void:
	
	if deviltry >= 1:
		deviltry -= amount
		print_debug(character_name + " has " + str(deviltry) + " deviltry! (-" + str(amount) + ")")
	else:
		deviltry == 0
		print_debug(character_name + "'s demons have gone quiet. ")
func multiply_deviltry(factor: float) -> void:
	deviltry = int(deviltry * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_deviltry(divisor: float) -> void:
	if divisor != 0:
		deviltry = int(deviltry / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
### GUTS FUNCTIONS
func add_guts(amount: int) -> void:
		guts += amount
		print_debug(character_name + " has " + str(guts) + " guts! (+" + str(amount) + ")")
func subtract_guts(amount: int) -> void:
	
	if guts >= 1:
		guts -= amount
		print_debug(character_name + "" + str(guts) + " guts! (-" + str(amount) + ")")
	else:
		guts == 0
		print_debug(character_name + "'can draw inspiration from the world no longer.")
func multiply_guts(factor: float) -> void:
	guts = int(guts * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_guts(divisor: float) -> void:
	if divisor != 0:
		guts = int(guts / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart
### LUCK FUNCTIONS  
func add_luck(amount: int) -> void:
		luck += amount
		print_debug(character_name + " has " + str(luck) + " luck! (+" + str(amount) + ")")
func subtract_luck(amount: int) -> void:
	
	if luck >= 1:
		luck -= amount
		print_debug(character_name + " has " + str(luck) + " luck! (-" + str(amount) + ")")
	else:
		luck == 0
		print_debug(character_name + " has seen too many black cats. ")
func multiply_luck(factor: float) -> void:
	luck = int(luck * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_luck(divisor: float) -> void:
	if divisor != 0:
		luck = int(luck / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
### CRIT FUNCTIONS
func add_crit(amount: int) -> void:
		crit += amount
		print_debug(character_name + " has " + str(crit) + " crit! (+" + str(amount) + ")")
		if crit == 1 || crit <= 99:
			crit_level = 1
		if crit >= 100 || crit <= 199:
			crit_level = 2
		if crit > 199 || crit >= 300:
			crit_level = 3	
		if crit_level == 1:
				print_debug("with a " + str(crit)+ "% chance " + character_name + " can hit single crits!!")
		if crit_level == 2:
			print_debug("with a " + str(crit)+ "% chance " + character_name + " can hit single crits!!")
			print_debug("with a " + str(crit-100) + "% chance " + character_name + " can hit double crits!!")
		if crit_level == 3:
			print_debug("with a " + str(crit)+ "% chance " + character_name + " can hit single crits!!")
			print_debug("with a " + str(crit-100) + "% chance " + character_name + " can hit double crits!!")
			print_debug("with a " + str(crit-200) + "% chance " + character_name + " can hit triple crits!!")
func subtract_crit(amount: int) -> void:
	
	if crit >= 1:
		crit -= amount
		print_debug(character_name + " has " + str(crit) + " luck! (-" + str(amount) + ")")
	else:
		crit == 0
		print_debug(character_name + " has been completely pacified.")
func multiply_crit(factor: float) -> void:
	crit = int(crit * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_crit(divisor: float) -> void:
	if divisor != 0:
		crit = int(crit / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart

### STAT FUNCTIONS
func reset_stats():
	move_speed = 300
	max_heart = 100
	current_heart = 10
	max_magia = 100
	current_magia = 10
	malice = 10
	deviltry = 10
	guts = 10
	luck = 0
	crit = 0
	crit_level = 0
	print_debug("reset all " + character_name + "'s stats to default")
	print_debug( str(move_speed) + str(max_heart) + str(current_heart) + str(max_magia) +  str(current_magia) +  str(malice) +  str(deviltry) + str(guts) + str(luck) + str(crit) + str(crit_level))