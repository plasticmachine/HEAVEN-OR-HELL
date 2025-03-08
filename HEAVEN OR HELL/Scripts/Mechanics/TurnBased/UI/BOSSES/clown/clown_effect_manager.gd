extends AnimatedSprite2D
@export var clown_VFX_buffer: float
@onready var clown_effect_spot = $"../../EnemySpot2/EnemyEffectSpot"
@onready var clown_hit_spot = $"../../EnemySpot2/EnemyHitSpot"


func find_effect_spot():
	position = clown_effect_spot.position
	
func find_hit_spot():
	position = clown_hit_spot.position
