extends ProgressBar
var hellstats = preload("res://Resources/HellStats.tres")
@onready var hell_progress_bar = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	hell_progress_bar.max_value = hellstats.max_heart
	hell_progress_bar.value = hellstats.current_heart


func _on_value_changed(value):
	pass
