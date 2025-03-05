extends AnimatedSprite2D


@onready var EnemyHitSpot = $"../../EnemySpot2/EnemyHitSpot"
@onready var EnemyEffectSpot = $"../../EnemySpot2/EnemyEffectSpot"
@onready var HeavenHitSpot = $"../../PlayerSpots/UISpots/HeavenHitSpot"
@onready var HellHitSpot = $"../../PlayerSpots/UISpots/HellHitSpot"
@onready var HeavenEffectSpot = $"../../PlayerSpots/UISpots/HeavenEffectSpot"
@onready var HellEffectSpot = $"../../PlayerSpots/UISpots/HellEffectSpot"
@onready var EnemyBattleEffect = $"../ClownBattleEffectManager"
@onready var HeavenBattleEffect = $"../HeavenBattleEffectManager"
@onready var HellBattleEffect = $"../HellBattleEffectManager3"

@export var VFX_buffer: float

func find_attack_spot_heaven():
	HeavenBattleEffect.position = HeavenHitSpot.position

func find_attack_spot_hell():
	HellBattleEffect.position = HellHitSpot.position

func find_attack_spot_enemy():
	EnemyBattleEffect.position = EnemyHitSpot.position

func find_hit_effect_spot_heaven():
	HeavenBattleEffect.position = HeavenEffectSpot.position

func find_hit_effect_spot_hell():
	HellBattleEffect.position = HellEffectSpot.position

func find_hit_effect_spot_enemy():
	EnemyEffectSpot = EnemyEffectSpot
