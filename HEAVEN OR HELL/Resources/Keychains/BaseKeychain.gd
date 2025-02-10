extends Resource
class_name KeychainResource
@export var keychain_id: int
@export var keychain_name: String
@export var keychain_description: String
@export var keychain_rarity: String
@export var keychain_texture: Texture2D
var heavenstats = preload("res://Resources/Stats/HeavenStats.tres")

func keychain_skill(target):
	heavenstats.add_all(10)
	print_debug("Using Keychain: ", keychain_name, " on ", target)
