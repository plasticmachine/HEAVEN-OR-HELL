extends TextureButton
var hellstats = ResourceLoader.load("res://Resources/Stats/HellStats.tres")
var heavenstats= ResourceLoader.load("res://Resources/Stats/HeavenStats.tres")
@onready var effect_animation = $"../../../../EnemySpot/BattleEffectManager"


func _on_pressed():
	heavenstats.add_heart(50)
	effect_animation.find_effect_spot_heaven()
	effect_animation.play("basic_heal")
	
	StatSaver.save_hellstats_to_file("res://Resources/Stats/HellStats.tres")
	StatSaver.save_heavenstats_to_file("res://Resources/Stats/HeavenStats.tres")
	#YASM.load_scene("res://Scenes/main.tscn",  [get_tree().create_timer(5.0).timeout
