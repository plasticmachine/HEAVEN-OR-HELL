@tool
extends Resource
class_name CharaStats

@export var character_name: String = "ANGEL/DEVIL"
@export var move_speed: int = 3500
@export var run_speed: int = 8000
@export var max_heart : int = 100
@export var current_heart: int = 100
@export var max_magia : int = 100
@export var current_magia: int = 100
@export var malice: int = 10
@export var deviltry: int = 10
@export var guts: float = 10
var BH_defense: float
@export var pain_tolerance: float 
@export var luck: int = 0
@export var crit: int = 0
@export var crit_level: int = 0
#@export var stat_resetter: bool

@export_category("skill stuff (dont change)")
@export var current_tempo: int = 5
@export var current_skill_power: int
@export_category("status effects (dont change)")
@export var status_effect_1: int
@export var status_effect_2: int
@export var status_effect_3: int
@export_category("special status effects (dont change/non-public)")
@export var special_status_effect_1: int
@export var special_status_effect_2: int
@export var special_status_effect_3: int

#SYSTEM TEXT VARIABLES
@export_category("system text variables (dont change)")
@export var current_stat_change := 0
@export var current_skill_used: String
@export var current_crit_level: int
### MOVESPEED FUNCTIONS
func add_move_speed(amount: int) -> void:
		move_speed += amount
		print_debug(character_name + " has " + str(move_speed) + " movement speed! (+ " + str(amount) + ")")
		current_stat_change = amount
	#emit_signal("stat_changed", "current_heart", current_heart)
func subtract_move_speed(amount: int) -> void:
	if move_speed >= 1:
		move_speed -= amount
		print_debug(character_name + " has " + str(move_speed) + " heart! (-" + str(amount) + ")")
	else:
		move_speed = 0
		print_debug(character_name + " is as slow as a snail!!! ")
	current_stat_change = amount
	#emit_signal("stat_changed", "current_heart", current_heart)
func multiply_move_speed(factor: float) -> void:
	move_speed = int(move_speed * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = factor
func divide_move_speed(divisor: float) -> void:
	if divisor != 0:
		move_speed = int(move_speed / divisor)
	current_stat_change = divisor
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
	current_stat_change = amount
	#emit_signal("stat_changed", "current_heart", current_heart)
func subtract_heart(amount: int) -> void:
	if current_heart >= 1:
		current_heart -= amount
		print_debug(character_name + " has " + str(current_heart) + " heart! (-" + str(amount) + ")")
	else:
		current_heart = 0
		print_debug(character_name + " is already fucking dead!!! ")
	current_stat_change = amount
	#emit_signal("stat_changed", "current_heart", current_heart)
func multiply_heart(factor: float) -> void:
	current_heart = int(current_heart * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
func divide_heart(divisor: float) -> void:

	if divisor != 0:
		current_heart = int(current_heart / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = divisor
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
	current_stat_change = amount
func subtract_magia(amount: int) -> void:
	
	if current_magia >= 1:
		current_magia -= amount
		print_debug(character_name + " has " + str(current_magia) + " magia! (-" + str(amount) + ")")
	else:
		current_magia = 0
		print_debug(character_name + " is all out of juice!!! ")
	current_stat_change = amount
func multiply_magia(factor: float) -> void:
	current_magia = int(current_magia * factor)
	print_debug(character_name + " has " + str(current_magia) + " magia! (*" + str(factor) + ")")
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = factor
func divide_magia(divisor: float) -> void:

	if divisor != 0:
		current_magia = int(current_magia / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = divisor
### MALICE FUNCTIONS
func add_malice(amount: int) -> void:
		malice += amount
		print_debug(character_name + " has " + str(malice) + " malice! (+" + str(amount) + ")")
		current_stat_change = amount
func subtract_malice(amount: int) -> void:
	if malice >= 1:
		malice -= amount
		print_debug(character_name + " has " + str(malice) + " malice! (-" + str(amount) + ")")
	else:
		malice = 0
		print_debug(character_name + "'s violence has come to an end. ")
	current_stat_change = amount
func multiply_malice(factor: float) -> void:

	malice = int(malice * factor)
	print_debug(character_name + " has " + str(malice) + " malice! (*" + str(factor) + ")")
	#move_speed = int(malice * factor)
	current_stat_change = factor
func divide_malice(divisor: float) -> void:
	if divisor != 0:
		malice = int(malice / divisor)
	print_debug(character_name + " has " + str(malice) + " malice! (/" + str(divisor) + ")")
	current_stat_change = divisor
### DEVILTRY FUNCTIONS
func add_deviltry(amount: int) -> void:
		deviltry += amount
		print_debug(character_name + " has " + str(deviltry) + " deviltry! (+" + str(amount) + ")")
		current_stat_change = amount
func subtract_deviltry(amount: int) -> void:
	if deviltry >= 1:
		deviltry -= amount
		print_debug(character_name + " has " + str(deviltry) + " deviltry! (-" + str(amount) + ")")
	else:
		deviltry = 0
		print_debug(character_name + "'s demons have gone quiet. ")
	current_stat_change = amount
func multiply_deviltry(factor: float) -> void:
	deviltry = int(deviltry * factor)
	print_debug(character_name + " has " + str(deviltry) + " deviltry! (*" + str(factor) + ")")
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = factor
func divide_deviltry(divisor: float) -> void:
	if divisor != 0:
		deviltry = int(deviltry / divisor)
	print_debug(character_name + " has " + str(deviltry) + " deviltry! (/" + str(divisor) + ")")
	current_stat_change = divisor
	#emit_signal("stat_changed", "current_heart", current_heart)
### GUTS FUNCTIONS
func add_guts(amount: int) -> void:
	if guts < 50:
		guts += amount
		print_debug(character_name + " has " + str(guts) + " guts! (+" + str(amount) + ")")
	else: 
		guts = 50
		print_debug(character_name + "'s max guts is 50")
	current_stat_change = amount
func subtract_guts(amount: int) -> void:
	
	if guts >= 1:
		guts -= amount
		print_debug(character_name + "" + str(guts) + " guts! (-" + str(amount) + ")")
	else:
		guts = 0
		print_debug(character_name + "'can draw inspiration from the world no longer.")
	current_stat_change = amount
func multiply_guts(factor: float) -> void:
	guts = int(guts * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = factor
func divide_guts(divisor: float) -> void:
	if divisor != 0:
		guts = int(guts / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart
	current_stat_change = divisor
### LUCK FUNCTIONS
func add_luck(amount: int) -> void:
		luck += amount
		print_debug(character_name + " has " + str(luck) + " luck! (+" + str(amount) + ")")
		current_stat_change = amount
func subtract_luck(amount: int) -> void:
	
	if luck >= 1:
		luck -= amount
		print_debug(character_name + " has " + str(luck) + " luck! (-" + str(amount) + ")")
	else:
		luck = 0
		print_debug(character_name + " has seen too many black cats. ")
	current_stat_change = amount
func multiply_luck(factor: float) -> void:
	luck = int(luck * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = factor
func divide_luck(divisor: float) -> void:
	if divisor != 0:
		luck = int(luck / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = divisor
### CRIT FUNCTIONS
func add_crit(amount: int) -> void:
		crit += amount
		print_debug(character_name + " has " + str(crit) + " crit! (+" + str(amount) + ")")
		current_stat_change = amount
func subtract_crit(amount: int) -> void:
	
	if crit >= 1:
		crit -= amount
		print_debug(character_name + " has " + str(crit) + " crit! (-" + str(amount) + ")")
	else:
		crit = 0
		print_debug(character_name + " has been completely pacified.")
	current_stat_change = amount
func multiply_crit(factor: float) -> void:
	crit = int(crit * factor)
	#emit_signal("stat_changed", "current_heart", current_heart)
	current_stat_change = factor
func divide_crit(divisor: float) -> void:
	if divisor != 0:
		crit = int(crit / divisor)
	#emit_signal("stat_changed", "current_heart", current_heart
	current_stat_change = divisor


### SKILL FUNCTIONS

func convert_skill_power(amount: int) -> void:
	current_skill_power = amount
	print_debug(character_name + " used a move that had  " + str(current_skill_power) + " power!")

func convert_tempo(amount: int) -> void:
	current_tempo = amount
	print_debug(character_name + " locked in a move with " + str(current_tempo) + " tempo!" )

### DEBUG FUNCTIONS
func add_all(amount: int) -> void:
	move_speed += amount
	run_speed += amount
	max_heart += amount
	current_heart += amount
	max_magia += amount
	current_magia += amount
	malice += amount
	deviltry += amount
	guts += amount
	luck += amount
	crit += amount
	print_debug(character_name + "increased all stats by " + str(amount) + ")" )
	print_debug(character_name + " has " + str(move_speed) + " movement speed! (+ " + str(amount) + ")")
	print_debug(character_name + " has " + str(max_heart) + " max heart! (+" + str(amount) + ")")
	print_debug(character_name + " has " + str(current_heart) + " heart! (+" + str(amount) + ")")
	print_debug(character_name + " has " + str(max_magia) + " max magia! (+" + str(amount) + ")")
	print_debug(character_name + " has " + str(current_magia) + " magia! (+" + str(amount) + ")")
	print_debug(character_name + " has " + str(malice) + " malice! (+ " + str(amount) + ")")
	print_debug(character_name + " has " + str(deviltry) + " deviltry! (+ " + str(amount) + ")")
	print_debug(character_name + " has " + str(guts) + " guts! (+ " + str(amount) + ")")
	print_debug(character_name + " has " + str(luck) + " luck! (+ " + str(amount) + ")")
	print_debug(character_name + " has " + str(crit) + " crit! (+ " + str(amount) + ")")
func subtract_all(amount: int) -> void:
	move_speed -= amount
	run_speed -= amount
	max_heart -= amount
	current_heart -= amount
	max_magia -= amount
	current_magia -= amount
	malice -= amount
	deviltry -= amount
	guts -= amount
	luck -= amount
	crit -= amount
	print_debug(character_name + " decreased all stats by " + str(amount) + ")" )
	print_debug(character_name + " has " + str(move_speed) + " movement speed! (- " + str(amount) + ")")
	print_debug(character_name + " has " + str(max_heart) + " max heart! (-" + str(amount) + ")")
	print_debug(character_name + " has " + str(current_heart) + " heart! (-" + str(amount) + ")")
	print_debug(character_name + " has " + str(max_magia) + " max magia! (-" + str(amount) + ")")
	print_debug(character_name + " has " + str(current_magia) + " magia! (-" + str(amount) + ")")
	print_debug(character_name + " has " + str(malice) + " malice! (- " + str(amount) + ")")
	print_debug(character_name + " has " + str(deviltry) + " deviltry! (- " + str(amount) + ")")
	print_debug(character_name + " has " + str(guts) + " guts! (- " + str(amount) + ")")
	print_debug(character_name + " has " + str(luck) + " luck! (- " + str(amount) + ")")
	print_debug(character_name + " has " + str(crit) + " crit! (- " + str(amount) + ")")

### STAT FUNCTIONS
func calc_pain_tolerance():
	pain_tolerance = (guts / 50) * 8
	#print_debug(pain_tolerance)

func calc_BH_defense():
	#listing each case to allow individual tweaking per guts stage
	
	match guts:
		50.0: 
			BH_defense = guts / 25
			##PUT LOGIC FOR GUTS MAX BUFF PASSIVE: (null a hit every 30 seconds (in combat) / every 10 turns [TB/BH])
		45.0: 
			BH_defense = guts / 25
		40.0: 
			BH_defense = guts / 25
		35.0: 
			BH_defense = guts / 25
		30.0: 
			BH_defense = guts / 25
		25.0: 
			BH_defense = guts / 25
		20.0: 
			BH_defense = (guts / 25)  #120% damage taken
		15.0: 
			BH_defense = (guts / 25) + 0.1  #140% damage taken (.7 BHD)
			print_debug(BH_defense)
		10.0:
			BH_defense = (guts / 25) + 0.2 #160% damage taken (.6 BHD)
			print_debug(BH_defense)
		5.0: 
			BH_defense = (guts / 25) + 0.3 #180% damage taken (.5 BHD)
			print_debug(BH_defense)
		0.0: 
			BH_defense = (guts / 25) + 0.5 #200% damage taken
			print_debug(BH_defense)
			##PUT LOGIC FOR GUTS MIN DEBUFF PASSIVE: (1/4th of all incoming damage is dealt to your partner as well [TB/BH])

func calc_crit_level():
		if crit > 1 && crit < 100:
			crit_level = 1
		if crit > 101 && crit < 200:
			crit_level = 2
		if crit > 201 && crit < 300:
			crit_level = 3
			
		match crit:
			101:
				crit_level = 2
			201:
				crit_level = 3
		
		match crit_level:
			1:
				print_debug("with a " + str(crit)+ "% chance " + character_name + " can hit single crits!!")
				current_crit_level = 1
			2:
				print_debug("with a " + str(crit-100) + "% chance " + character_name + " can hit double crits!!")
				current_crit_level = 2
			3:
				print_debug("with a " + str(crit-200) + "% chance " + character_name + " can hit triple crits!!")
				current_crit_level = 3

func reset_boss_stats():
			move_speed = 3500
			max_heart = 10000
			max_magia = 10000
			current_heart = 10000
			current_magia = 10000
			malice = 30
			deviltry = 30
			guts = 10
			luck = 0
			crit = 50

func reset_stats():
			move_speed = 3500
			max_heart = 300
			max_magia = 300
			current_heart = 300
			current_magia = 300
			malice = 10
			deviltry = 10
			guts = 10
			luck = 0
			crit = 50
			#crit_level = 0
			print_debug("reset all " + character_name + "'s stats to default")
			print_debug( str(move_speed,"/", max_heart,"/", current_heart,"/",max_magia,"/",current_magia,"/",malice,"/",deviltry,"/",guts,"/",luck,"/",crit,"/",crit_level))
