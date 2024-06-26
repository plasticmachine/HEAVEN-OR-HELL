extends ProgressBar
@onready var hellstats = load("res://Resources/Stats/HellStats.tres")
@onready var hell_heart_progress_bar = $"."
@onready var hell_magia_progress_bar = $"../../../HellMagiaData/HellMagiaPanel/HellMagiaBar"
@export var speed: int




# Called when the node enters the scene tree for the first time.
func _ready():
	get_heart_values()
	get_magia_value()

func _process(delta):
	update_heart_bar()
	update_magia_value()
	#hellstats.rolling_health = hell_heart_progress_bar.value
func get_heart_values():
	
	hell_heart_progress_bar.max_value = hellstats.max_heart
	hell_heart_progress_bar.value = hellstats.current_heart
	
	
func update_heart_bar():
	#var tween = get_tree().create_tween()
	hell_heart_progress_bar.value = hellstats.current_heart
	#tween.interpolate_value(hell_heart_progress_bar.value, hellstats.rolling_health, hellstats.current_health, 3, tween.TRANS_LINEAR, tween.EASE_OUT )


func get_magia_value():
	hell_magia_progress_bar.max_value = hellstats.max_magia
	hell_magia_progress_bar.value = hellstats.current_magia
	
func update_magia_value():
	hell_magia_progress_bar.value = hellstats.current_magia
