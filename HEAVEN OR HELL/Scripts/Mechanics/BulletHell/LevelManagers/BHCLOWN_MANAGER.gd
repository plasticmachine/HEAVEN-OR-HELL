extends Node

#@export var mob_scene: PackedScene
#@export var mobTimer_scene: PackedScene
var score
#var difficulty = 0.60

@onready var BHCam = $Cameras/BH_1_Cam
@onready var GroupCam = $Cameras/GroupCam
@onready var Heaven = $Players/Heaven
@onready var Hell = $Players/Hell

func _ready():
	Engine.max_fps = 60


#func _on_score_timer_timeout():
	#score += 1
	#BHCam.set_priority(0)
	#GroupCam.set_priority(1)
	
	#difficulty -= 0.01 #increases the score by one every time the score timer times out
	#$HUD.update_score(score)
	#$HUD.update_difficulty(difficulty)
	

func new_game():
	$HUD.show_message("Ready or Not!")
	$Player.start($StartPosition.position) #resets the player position when new_game function is called
	$StartTimer.start() #resets the start timer when new_game function is called
	$Music.play()
	get_tree().call_group("mobs", "queue_free")
	score = 0
	#difficulty = .60
	$HUD.update_score(score)
	#$HUD.update_difficulty(difficulty)

func game_over(): #Connected to the "hit" signal
	$Music.stop()
	$DeathSound.play()
	$HUD.show_game_over()
	$ScoreTimer.stop() #stops the scoretimer when game_over function is called
#	$MobTimer.stop() #stops tijawldijawlidjawlijdalkdjaldijaldjalidjalidjalidjawlijdalijdhe mobtimer when game_over function is called

func _on_start_timer_timeout():
#	$MobTimer.start() #starts the mob timer when the start timer times out
	$ScoreTimer.start() #starts the score timer when the start timer times out

#func _on_mob_timer_timeout():
#	#Creates a new instance of the Mob scene
#	var mob = mob_scene.instantiate()
#
#	#Chooses a random location on the Path2D to spawn the instantiated Mob
#	var mob_spawn_location = get_node("MobPath/MobSpawnerLocations")
#	mob_spawn_location.progress_ratio = randf() 
#
#	#Sets the mobs direction perpendicular to the path's direction
#	var direction = mob_spawn_location.rotation + PI / 2
#
#	#Set the mobswdasdawd position to a random location on the mobspawnerlocations path2D node
#	mob.position = mob_spawn_location.position
#
#	#Adds some randomness to the direction the mob being spawned is facing
#	direction += randf_range(-PI / 4, PI / 4)dwa
#	#Chooses the Velocity for the mob being spawned
#	var velocity = Vector2(randf_range(150.0, 250.0), 0.0) #sets that random range for the speed to 150 - 250
#	mob.linear_velocity = velocity.rotated(direction) #uses the subclass for mob's rigidbody2D, not exactly sure what its doing 
#
#	#Spawns the mob by adding it to the main scene
#	add_child(mob)
	
func _process(_delta):
	check_game_over()

func check_game_over():
	if !Hell.is_in_group("Player") and !Heaven.is_in_group("Player"):
		YASM.load_scene("res://Scenes/Screens/Main_Menu.tscn")

func _on_hud_start_game():
	$Player.start($StartPosition.position) #resets the player position when new_game function is called
	$StartTimer.start() #resets the start timer when new_game function is called
	$Music.play()
	get_tree().call_group("mobs", "queue_free")
	score = 0
	#difficulty = .60
	$HUD.update_score(score)
	$ScoreTimer.start()
	#$HUD.update_difficulty(difficulty)
