extends ProgressBar
@onready var heavenstats = load("res://Resources/Stats/HeavenStats.tres")
@onready var heaven_heart_progress_bar = $"."
@onready var heaven_magia_progress_bar = $"../../../HeavenMagiaData/HeavenMagiaPanel/HeavenMagiaBar"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_heart_values()
	get_magia_value()

func _process(delta):
	update_heart_bar()
	update_magia_value()


func get_heart_values():
	heaven_heart_progress_bar.max_value = heavenstats.max_heart
	heaven_heart_progress_bar.value = heavenstats.current_heart
	
func update_heart_bar():
	heaven_heart_progress_bar.value = heavenstats.current_heart

func get_magia_value():
	heaven_magia_progress_bar.max_value = heavenstats.max_magia
	heaven_magia_progress_bar.value = heavenstats.current_magia
	
func update_magia_value():
	heaven_magia_progress_bar.value = heavenstats.current_magia
