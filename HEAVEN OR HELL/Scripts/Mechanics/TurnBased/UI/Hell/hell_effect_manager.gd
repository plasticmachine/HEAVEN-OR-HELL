extends AnimatedSprite2D
@export var hell_VFX_buffer: float
@onready var hell_effect_spot = $"../../PlayerSpots/UISpots/HellEffectSpot"
@onready var hell_hit_spot = $"../../PlayerSpots/UISpots/HellHitSpot"


func find_effect_spot():
	position = hell_effect_spot.position
	
func find_hit_spot():
	position = hell_hit_spot.position
