extends TextureButton
var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var effect_animation = $"../../../../EnemySpot/BattleEffectManager"


func _on_pressed():
	heavenstats.subtract_heart(50)
	heavenstats.subtract_magia(50)
	effect_animation.find_attack_spot_heaven()
	effect_animation.play("basic_slash")
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
