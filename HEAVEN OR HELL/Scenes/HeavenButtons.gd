extends TextureButton
var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")
@onready var effect_animation = $"../../../../EnemySpot/BattleEffectManager"


func _on_pressed():
	heavenstats.add_heart(50)
	heavenstats.add_magia(50)
	effect_animation.find_effect_spot_heaven()
	effect_animation.play("basic_heal")
	
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
