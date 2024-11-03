extends ProgressBar
@onready var hellstats = load("res://Resources/Stats/HellStats.tres")
@onready var hell_heart_progress_bar = $"."
@onready var hell_magia_progress_bar = $"../../../HellMagiaData/HellMagiaPanel/HellMagiaBar"
@export var duration: float

#@onready var magia_tween = get_tree().create_tween()


# Called when the node enters the scene tree for the first time.
func _ready():
	hellstats.calc_pain_tolerance()
	get_heart_values()
	get_magia_value()
func _process(delta):
	update_heart_bar()
	update_magia_value()
	#hellstats.rolling_health = hell_heart_progress_bar.value
func get_heart_values():
	hell_heart_progress_bar.min_value = 0
	hell_heart_progress_bar.max_value = hellstats.max_heart
	hell_heart_progress_bar.value = hellstats.current_heart
func update_heart_bar():
	
	hell_heart_progress_bar.max_value = hellstats.max_heart
	
	var heart_tween = get_tree().create_tween()
	heart_tween.set_trans(Tween.TRANS_LINEAR)
	heart_tween.set_ease(Tween.EASE_IN_OUT)
	heart_tween.tween_property(self, "value", hellstats.current_heart, hellstats.pain_tolerance)
	#hell_heart_progress_bar.value = hellstats.current_heart
	
	
func get_magia_value():
	hell_magia_progress_bar.max_value = hellstats.max_magia
	hell_magia_progress_bar.value = hellstats.current_magia
	
func update_magia_value():
	hell_magia_progress_bar.max_value = hellstats.max_magia
	hell_magia_progress_bar.value = hellstats.current_magia
