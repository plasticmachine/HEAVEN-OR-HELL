extends AnimatedSprite2D
@export var heaven_VFX_buffer: float
@onready var heaven_effect_spot = $"../../PlayerSpots/UISpots/HeavenEffectSpot"
@onready var heaven_hit_spot = $"../../PlayerSpots/UISpots/HeavenHitSpot"


func find_effect_spot():
	position = heaven_effect_spot.position
	
func find_hit_spot():
	position = heaven_hit_spot.position
