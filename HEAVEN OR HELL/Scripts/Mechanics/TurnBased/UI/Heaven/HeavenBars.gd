extends ProgressBar
@onready var heavenstats = load("res://Resources/Stats/HeavenStats.tres")
@onready var heaven_heart_progress_bar = $"."
@onready var heaven_magia_progress_bar = $"../../../HeavenMagiaData/HeavenMagiaPanel/HeavenMagiaBar"
@export var duration: float
#@onready var magia_tween = get_tree().create_tween()


# Called when the node enters the scene tree for the first time.
func _ready():
	heavenstats.calc_pain_tolerance()
	get_heart_values()
	get_magia_value()
func _process(delta):
	update_heart_bar()
	update_magia_value()
	#hellstats.rolling_health = hell_heart_progress_bar.value
func get_heart_values():
	heaven_heart_progress_bar.min_value = 0
	heaven_heart_progress_bar.max_value = heavenstats.max_heart
	heaven_heart_progress_bar.value = heavenstats.current_heart
func update_heart_bar():
	var heart_tween = get_tree().create_tween()
	heart_tween.set_trans(Tween.TRANS_LINEAR)
	heart_tween.set_ease(Tween.EASE_IN_OUT)
	heart_tween.tween_property(self, "value", heavenstats.current_heart, heavenstats.pain_tolerance)
	#hell_heart_progress_bar.value = hellstats.current_heart
	
	
func get_magia_value():
	heaven_magia_progress_bar.max_value = heavenstats.max_magia
	heaven_magia_progress_bar.value = heavenstats.current_magia
	
func update_magia_value():
	heaven_magia_progress_bar.value = heavenstats.current_magia
