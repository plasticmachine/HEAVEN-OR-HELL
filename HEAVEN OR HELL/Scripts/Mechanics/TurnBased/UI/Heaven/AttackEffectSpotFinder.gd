extends AnimatedSprite2D
@onready var EnemyHitSpot = $"../../EnemySpot2/EnemyHitSpot"
@onready var EnemyEffectSpot = $"../../EnemySpot2/EnemyEffectSpot"
@onready var HeavenHitSpot = $"../../PlayerSpots/UISpots/HeavenHitSpot"
@onready var HellHitSpot = $"../../PlayerSpots/UISpots/HellHitSpot"
@onready var HeavenEffectSpot = $"../../PlayerSpots/UISpots/HeavenEffectSpot"
@onready var HellEffectSpot = $"../../PlayerSpots/UISpots/HellEffectSpot"
@onready var EffectAnimationManager = $"."

@export var VFX_buffer: float

func find_attack_spot_heaven():
	EffectAnimationManager.position = HeavenHitSpot.position

func find_attack_spot_hell():
	EffectAnimationManager.position = HellHitSpot.position

func find_attack_spot_enemy():
	EffectAnimationManager.position = EnemyHitSpot.position

func find_effect_spot_heaven():
	EffectAnimationManager.position = HeavenEffectSpot.position

func find_effect_spot_hell():
	EffectAnimationManager.position = HellEffectSpot.position

func find_effect_spot_enemy():
	EffectAnimationManager.position = EnemyEffectSpot.position
