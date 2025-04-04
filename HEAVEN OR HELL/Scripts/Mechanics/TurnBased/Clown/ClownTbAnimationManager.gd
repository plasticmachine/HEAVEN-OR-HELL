extends Node2D
signal action_committed
signal skill_4_animation_buffer_change


#STAT VARIABLES
@onready var hellstats = preload("res://Resources/Stats/HellStats.tres")
@onready var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var clownstats = preload("res://Resources/Stats/ClownStats.tres")
@onready var clown_switch_turn_animation_buffer: float


@onready var damagecalc = $"../../../../DamageCalculation"
@onready var turnbased_manager = $"../../../.."
@onready var clown_effect_animation = $"../../../../BattleEffectManagerPosition/ClownBattleEffectManager"
@onready var heaven_effect_animation = $"../../../../BattleEffectManagerPosition/HeavenBattleEffectManager"
@onready var hell_effect_animation = $"../../../../BattleEffectManagerPosition/HellBattleEffectManager"
@onready var clown_phase_2_path_follow = $".."
@onready var clownskill: int
@onready var clownTB_animation = $AnimationTree
@onready var HitHellBlockBox = $"../../../../EnemyHitBoxes/HitHellBlock/HitHellBlockCol"
@onready var HitHeavenBlockBox = $"../../../../EnemyHitBoxes/HitHeavenBlock/HitHeavenBlockCol"
@onready var HitHeavenParryBox = $"../../../../EnemyHitBoxes/HitHeavenParry/HitHeavenParryCol"
@onready var HitHellParryBox = $"../../../../EnemyHitBoxes/HitHellParry/HitHellParryCol"

#DEFENSIVE ACTION VARIABLES
@onready var DidHeavenParry := false
@onready var DidHellParry := false
@onready var DidHeavenBlock := false
@onready var DidHellBlock := false
@onready var SkipHeavenBlock := false
@onready var SkipHellBlock := false

#SYSTEM TEXT VARIABLES
@onready var current_stat_change: int

@onready var PHASE: int = 1
@onready var last_alive: int = 0 #0 is neither #1 is Heaven #2 is Hell

@export_group("Skill_1")
@export var skill_1_name: String
@export var skill_1_tempo: int
@export var skill_1_power: int
@export var skill_1_block_window: float
@export var skill_1_parry_window: float
@export var skill_1_animation_buffer: float


@export_group("Skill_2")
@export var skill_2_name: String
@export var skill_2_tempo: int
@export var skill_2_heal: int
@export var skill_2_malice_buff: int
@export var skill_2_deviltry_buff: int
@export var skill_2_animation_buffer: float

@export_group("Skill_3")
@export var skill_3_name: String
@export var skill_3_tempo: int
@export var skill_3_power: int
@export var skill_3_guts_debuff: int
@export var skill_3_deviltry_debuff: int
@export var skill_3_malice_debuff: int
@export var skill_3_malice_buff_multiplier: float
@export var skill_3_animation_buffer: float

@export_group("Skill_4")
@export var skill_4_name: String
@export var skill_4_tempo: int
@export var skill_4_power: int
@export var skill_4_animation_buffer: float
@export_group("Skill_5")
@export var skill_5_name: String
@export var skill_5_tempo: int
@export var skill_5_power: int
@export var skill_5_count: int
@export var skill_5_animation_buffer: float
@export_group("Skill_6")
@export var skill_6_name: String
@export var skill_6_tempo: int
@export var skill_6_power: int
@export var skill_6_animation_buffer: float
@export_group("Skill_7")
@export var skill_7_name: String
@export var skill_7_tempo: int
@export var skill_7_power: int
@export var skill_7_animation_buffer: float
@export_group("Skill_8")
@export var skill_8_name: String
@export var skill_8_tempo: int
@export var skill_8_power: int
@export var skill_8_animation_buffer: float
@export_group("Skill_9")
@export var skill_9_name: String
@export var skill_9_tempo: int
@export var skill_9_power: int
@export var skill_9_animation_buffer: float
@export_group("Skill_10")
@export var skill_10_name: String
@export var skill_10_tempo: int
@export var skill_10_power: int
@export var skill_10_animation_buffer: float

@export_group("Phase_Thresholds")
@export var phase_1_threshold: float
@export var phase_1_1_threshold: float
@export var phase_1_2_threshold: float
@export var phase_2_threshold: float
@export var phase_3_threshold: float
@export var phase_4_threshold: float


func _ready():
	HitHeavenBlockBox.disabled = true
	HitHellBlockBox.disabled = true
	

func animation_phase_shift_check():
	var phase_1_HP_gate = clownstats.max_heart * phase_1_threshold
	var phase_1_1_HP_gate = clownstats.max_heart * phase_1_1_threshold
	var phase_1_2_HP_gate = clownstats.max_heart * phase_1_2_threshold
	var phase_2_HP_gate = clownstats.max_heart * phase_2_threshold
	var phase_3_HP_gate = clownstats.max_heart * phase_3_threshold
	var phase_4_HP_gate = clownstats.max_heart * phase_4_threshold
	
	
	if (clownstats.current_heart <= phase_1_HP_gate && clownstats.current_heart > phase_1_1_HP_gate ):
		clownTB_animation.set("parameters/conditions/PHASE1", true)
		PHASE = 1
		#print_debug("PHASE: 1")
	if (clownstats.current_heart <= phase_1_1_HP_gate && clownstats.current_heart > phase_1_2_HP_gate):
		clownTB_animation.set("parameters/conditions/IDLE2", true)
		PHASE = 1
	
	if (clownstats.current_heart <= phase_1_2_HP_gate && clownstats.current_heart > phase_2_HP_gate):
		clownTB_animation.set("parameters/conditions/IDLE3", true)
		PHASE = 1
	
	#if  phase_1_HP_gate >= clownstats.current_heart >= phase_2_HP_gate:
		#clownTB_animation.set("parameters/conditions/PHASE1", true)
		#PHASE = 1
		#print_debug("PHASE: 1")
	
	if (clownstats.current_heart <= phase_2_HP_gate && clownstats.current_heart > phase_3_HP_gate ):
		clownTB_animation.set("parameters/conditions/PHASE1", false)
		clownTB_animation.set("parameters/conditions/PHASE2", true)
		clown_phase_2_path_follow.active = true
		PHASE = 2
		#print_debug("PHASE: 2")

func check_last_alive():
	
	if heavenstats.current_heart <= 0:
		last_alive = 2
	
	if hellstats.current_heart <= 0:
		last_alive = 1
	
	

func _process(delta):
	animation_phase_shift_check()
	check_last_alive()

func _on_first_action_committed() -> void:
	if turnbased_manager.turn_queue_amount == 1 and heavenstats.current_heart > 0 and hellstats.current_heart > 0:
		match PHASE:
			1:
				var num = [1,2].pick_random()
				match num:
					1:
						clownskill = 1
						clownstats.convert_tempo(skill_1_tempo)
						print_debug("clown is preparing " + skill_1_name + " (ID: 01)")
					2:
						clownskill = 2
						clownstats.convert_tempo(skill_2_tempo)
						print_debug("clown is preparing " + skill_2_name + " (ID: 02)")
			2:
				var num = [3,4].pick_random()
				match num:
					3:
						clownskill = 3
						clownstats.convert_tempo(skill_3_tempo)
						print_debug("clown is preparing " + skill_3_name + " (ID: 03)")
					4: 
						clownskill = 4
						clownstats.convert_tempo(skill_4_tempo)
						print_debug(("clown is preparing skill 4"))
					5: 
						clownskill = 5
						print_debug(("clown is preparing skill 5"))
					6:
						clownskill = 6
						print_debug(("clown is preparing skill 6"))
		if clownstats.current_heart <= phase_3_threshold:
			var num = [5,6,7,8,9,10].pick_random()
			clownTB_animation.set("parameters/conditions/PHASE2", false)
			print_debug("switching to phase3, conditional := false")
			clownTB_animation.set("parameters/conditions/PHASE3", true)
			match num:
				5:
					clownskill = 3
				4: 
					clownskill = 4
				5: 
					clownskill = 5
				6:
					clownskill = 6
				7:
					clownskill = 7
				8: 
					clownskill = 8
			animation_phase_shift_check()
		if clownstats.current_heart <= phase_4_threshold:
			clownTB_animation.set("parameters/conditions/PHASE3", false)
			clownTB_animation.set("parameters/conditions/PHASE4", true)
			print_debug("switching to phase4, conditional := false")
			var num = [9,10].pick_random()
			match num:
				9:
					clownskill = 9
				10:
					clownskill = 10
			animation_phase_shift_check()
		action_committed.emit()



#test skill that just randomly does damage to heaven or hell
func skill_1_effect():
	clown_switch_turn_animation_buffer = skill_1_animation_buffer
	
	var num = [1,2].pick_random()
	#clownstats.convert_tempo(skill_1_tempo)
	clownstats.convert_skill_power(skill_1_power)
	
	if last_alive == 1:
		num = last_alive
	if last_alive == 2:
		num = last_alive
	
	clownTB_animation.set("parameters/conditions/THROW", true)
	await get_tree().create_timer(1).timeout
	
	match num:
		1:
			heaven_effect_animation.find_hit_spot()
			heaven_effect_animation.play("basic_slash")
			ClownSounds.CLOWN_SLASH.play()
			check_for_heaven_defensive_action()

		2:
			hell_effect_animation.find_hit_spot()
			hell_effect_animation.play("basic_slash")
			ClownSounds.CLOWN_SLASH.play()
			check_for_hell_defensive_action()
	clownTB_animation.set("parameters/conditions/THROW", false)



func skill_2_effect():
	clown_switch_turn_animation_buffer = skill_2_animation_buffer
	#clownskill = 2
	var num = [1,1,2,2,3,3,4].pick_random()
	#clownstats.convert_tempo(skill_2_tempo)
	
	clownTB_animation.set("parameters/conditions/BUFF1", true)
	
	await get_tree().create_timer(1).timeout

	match num:
		1:
			clown_effect_animation.find_effect_spot()
			clown_effect_animation.play("basic_heal")
			ClownSounds.CLOWN_HEAL.play()
			clownstats.add_heart(skill_2_heal)
		2:
			clown_effect_animation.find_effect_spot()
			clown_effect_animation.play("basic_buff")
			ClownSounds.CLOWN_BUFF.play()
			clownstats.add_malice(skill_2_malice_buff)
			current_stat_change = skill_2_malice_buff
		3:
			clown_effect_animation.find_effect_spot()
			clown_effect_animation.play("basic_buff")
			ClownSounds.CLOWN_BUFF.play()
			clownstats.add_deviltry(skill_2_deviltry_buff)
			current_stat_change = skill_2_deviltry_buff
		4:
			clown_effect_animation.find_effect_spot()
			clown_effect_animation.play("basic_debuff")
			ClownSounds.CLOWN_DEBUFF.play()
			clownstats.subtract_deviltry(skill_2_deviltry_buff)
			current_stat_change = skill_2_deviltry_buff
	clownTB_animation.set("parameters/conditions/BUFF1", false)

func skill_3_effect():
	clown_switch_turn_animation_buffer = skill_3_animation_buffer
	#PHASE-2 KICK-RANDBUFF
	#clownskill = 3
	var rand_target = [1,2].pick_random()
	var rand_target_2 = [1,2].pick_random()
	var rand_target_3 = [1,2].pick_random()
	var rand_effect = [1,2].pick_random()
	var crit_chance = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2].pick_random() #1/20 chance
	
	clownTB_animation.set("parameters/conditions/KICKS", true)
	#clownstats.convert_tempo(skill_3_tempo)
	clownstats.convert_skill_power(skill_3_power)
	
	await get_tree().create_timer(1).timeout
	#is this too messy?? i dont know?
	match skill_5_count:
		0:
			match rand_target:
				1:
					match rand_effect:
						
						1:
							damagecalc.clown_to_heaven_malice_damagecalc()
							heaven_effect_animation.find_hit_spot()
							heaven_effect_animation.play("basic_slash")
							heavenstats.subtract_guts(skill_3_guts_debuff)
							await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
							heaven_effect_animation.find_effect_spot()
							heaven_effect_animation.play("basic_debuff")
						2:
							damagecalc.clown_to_heaven_deviltry_damagecalc()
							heaven_effect_animation.find_hit_spot()
							heaven_effect_animation.play("basic_slash")
							await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
							match crit_chance:
								1:
									# keep this between 1.05 and 1.10 (max 5% -> 10% increase) % increase to maintain scaling
									clownstats.multiply_deviltry(skill_3_malice_buff_multiplier)
									clown_effect_animation.find_effect_spot()
									clown_effect_animation.play("basic_buff")
								2:
									clownstats.multiply_deviltry(skill_3_malice_buff_multiplier + .10 ) #1/20 chance to turn buff into double buff)
									clown_effect_animation.find_effect_spot()
									clown_effect_animation.play("basic_buff")
							await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
							heaven_effect_animation.find_effect_spot()
							heaven_effect_animation.play("basic_debuff")
				2:
					match rand_effect:
						
						1:
							damagecalc.clown_to_hell_deviltry_damagecalc()
							hell_effect_animation.find_hit_spot()
							hell_effect_animation.play("basic_slash")
							hellstats.subtract_guts(skill_3_guts_debuff)
							await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
							hell_effect_animation.find_effect_spot()
							hell_effect_animation.play("basic_debuff")
						2:
							damagecalc.clown_to_hell_deviltry_damagecalc()
							hell_effect_animation.find_hit_spot()
							hell_effect_animation.play("basic_slash")
							await get_tree().create_timer(.5).timeout
							match crit_chance:
								1:
									# keep this between 1.05 and 1.10 (max 5% -> 10% increase) % increase to maintain scaling
									clownstats.multiply_deviltry(skill_3_malice_buff_multiplier)
									clown_effect_animation.find_effect_spot()
									clown_effect_animation.play("basic_buff")
								2:
									clownstats.multiply_deviltry(skill_3_malice_buff_multiplier + .10 ) #1/20 chance to turn buff into double buff)
									clown_effect_animation.find_effect_spot()
									clown_effect_animation.play("basic_buff")
							await get_tree().create_timer(.5).timeout
							hell_effect_animation.play("basic_debuff")
							
			clownTB_animation.set("parameters/conditions/KICKS", false)
			skill_5_count = 0
		1:
			## DOUBLE-KICK (CAN TARGET SAME TARGET TWICE, OR TWO DIFFERENT TARGETS)
			match rand_target:
				1:
					damagecalc.clown_to_heaven_deviltry_damagecalc()
					heaven_effect_animation.find_hit_spot()
					heaven_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
				2:
					damagecalc.clown_to_hell_deviltry_damagecalc()
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
			match rand_target_2:
				1:
					damagecalc.clown_to_heaven_deviltry_damagecalc()
					heaven_effect_animation.find_hit_spot()
					heaven_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
				2:
					damagecalc.clown_to_hell_deviltry_damagecalc()
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
			clownTB_animation.set("parameters/conditions/KICKS", false)
			skill_5_count = 0
		2:
			match rand_target:
				1:
					damagecalc.clown_to_heaven_deviltry_damagecalc()
					heaven_effect_animation.find_hit_spot()
					heaven_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
				2:
					damagecalc.clown_to_hell_deviltry_damagecalc()
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
			match rand_target_2:
				1:
					damagecalc.clown_to_heaven_deviltry_damagecalc()
					heaven_effect_animation.find_hit_spot()
					heaven_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
				2:
					damagecalc.clown_to_hell_deviltry_damagecalc()
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
			match rand_target_3:
				1:
					damagecalc.clown_to_heaven_deviltry_damagecalc()
					heaven_effect_animation.find_hit_spot()
					heaven_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
				2:
					damagecalc.clown_to_hell_deviltry_damagecalc()
					hell_effect_animation.find_hit_spot()
					hell_effect_animation.play("basic_slash")
					await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
			clownTB_animation.set("parameters/conditionds/KICKS", false)
			skill_5_count = 0
func skill_4_effect():
	clown_switch_turn_animation_buffer = skill_4_animation_buffer
	#PHASE-2 SPIN-BUFF
	clownskill = 4
	clownTB_animation.set("parameters/conditions/SPINS2", true)
	clown_phase_2_path_follow.speed += 1200
	await get_tree().create_timer(2).timeout
	clownTB_animation.set("parameters/conditions/SPINS2", false)
	#skill_5_count caps at 5
	skill_5_count += 1
	print_debug(skill_4_animation_buffer)
	if skill_5_count >= 3:
		skill_5_count = 3


#func skill_5_effect():
	##PHASE-2 DOUBLE-KICK (CAN TARGET SAME TARGET TWICE)
	#clownskill = 5





func _on_damage_calculation_clown_damage_taken() -> void:
	match PHASE:
		1:
			clownTB_animation.set('parameters/conditions/DAMAGE1', true)
			await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
			clownTB_animation.set('parameters/conditions/DAMAGE1', false)
		2:
			clownTB_animation.set('parameters/conditions/DAMAGE2', true)
			await get_tree().create_timer(clown_effect_animation.clown_VFX_buffer).timeout
			clownTB_animation.set('parameters/conditions/DAMAGE2', false)


func skill_1_block_box_enable_heaven():
	HitHeavenBlockBox.disabled = false
	
	await get_tree().create_timer(skill_1_block_window).timeout
	
	HitHeavenBlockBox.disabled = true
func skill_1_parry_box_enable_heaven():
	HitHeavenParryBox.disabled = false
	
	await get_tree().create_timer(skill_1_parry_window).timeout
	
	HitHeavenParryBox.disabled = true
func skill_1_block_box_enable_hell():
	HitHellBlockBox.disabled = false
	
	await get_tree().create_timer(skill_1_block_window).timeout
	
	HitHellBlockBox.disabled = true
func skill_1_parry_box_enable_hell():
	HitHellParryBox.disabled = false
	
	await get_tree().create_timer(skill_1_parry_window).timeout
	
	HitHellParryBox.disabled = true


#checks if heaven is going to parry OR block, deals full damage if no action is succsessful
func check_for_heaven_defensive_action():
	skill_1_block_box_enable_heaven()
	skill_1_parry_box_enable_heaven()
	await get_tree().create_timer(1).timeout
	if DidHeavenParry == false:
		#damagecalc.clown_to_heaven_deviltry_damagecalc()
		SkipHeavenBlock = false
	if DidHeavenParry == true:
		damagecalc.heaven_to_clown_deviltry_PARRY_damagecalc()
		DidHeavenParry = false
		SkipHeavenBlock = true
	match SkipHeavenBlock:
		false:
			if DidHeavenBlock == false:
				damagecalc.clown_to_heaven_deviltry_damagecalc()
			if DidHeavenBlock == true:
				print_debug("HEAVEN BLOCKED!")
				DidHeavenBlock = false
		true: 
			print_debug("already parried!")

#checks if hell is going to parry OR block, deals full damage if no action is succsessful
func check_for_hell_defensive_action():
	skill_1_block_box_enable_hell()
	skill_1_parry_box_enable_hell()
	await get_tree().create_timer(1).timeout
	if DidHellParry == false:
		#damagecalc.clown_to_hell_deviltry_damagecalc()
		SkipHellBlock = false
	if DidHellParry == true:
		damagecalc.hell_to_clown_deviltry_PARRY_damagecalc()
		DidHellParry = false
		SkipHellBlock = true
	match SkipHellBlock:
		false:
			if DidHellBlock == false:
				damagecalc.clown_to_hell_deviltry_damagecalc()
			if DidHellBlock == true:
				print_debug("hell BLOCKED!")
				DidHellBlock = false
		true: 
			print_debug("already parried!")

func _on_heaven_blocked():
	DidHeavenBlock = true
func _on_hell_blocked():
	DidHellBlock = true

func _on_heaven_parried():
	DidHeavenParry = true
func _on_hell_parried():
	DidHellParry = true
