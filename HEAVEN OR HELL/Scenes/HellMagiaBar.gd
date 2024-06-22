extends ProgressBar
@onready var hellstats = load("res://Resources/Stats/HellStats.tres")
@onready var hell_progress_bar = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	hell_progress_bar.max_value = hellstats.max_magia
	hell_progress_bar.value = hellstats.current_magia


func _process(delta):
	hell_progress_bar.value = hellstats.current_magia
