extends TextureButton
var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")
var clownstats = ResourceLoader.load("res://Resources/Stats/Clown.tres")
@onready var effect_animation = $"../../../../EnemySpot/BattleEffectManager"


func _on_pressed():
	#hellstats.subtract_heart(35)
	#hellstats.subtract_magia(10)
	#hellstats.subtract_malice(10)
	#hellstats.subtract_deviltry(10)
	#hellstats.subtract_guts(10)
	#hellstats.subtract_luck(10)
	#hellstats.subtract_crit(100)
	
	clownstats.subtract_heart(35)
	effect_animation.find_attack_spot_enemy()
	effect_animation.play("basic_slash")
	
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
