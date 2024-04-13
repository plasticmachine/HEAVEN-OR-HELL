@tool
extends Node2D

###############################################################
## BulletUpHell BLAST, by Dark Peace
## purchasing the plugin through Dark Peace's Itch.io page grants you the right to use this plugin in your projects
## you cannot share this plugin's code with anyone else
## you can use this plugin to make and distribute any game, even commercially
###############################################################

# base
@export var active:bool = true
@export_placeholder("Pattern ID") var auto_pattern_id:String = ""
@export var shared_area_name:String = "0"
var shared_area
@export var process_id:int = -1
@export var rotating_speed:float = 0.0
@export_range(0, 9999, 1, "suffix:bullets") var pool_amount:int = 50

@export_group("Multi-Pattern", "patterns_")
@export var patterns_multi:PackedStringArray
@export_range(0, 999999, 1, "suffix:times") var patterns_loops:int = 0
@export var patterns_all_in_1:bool = false

# triggering
@export_group("Autostart", "auto_")
@export var auto_start_on_cam:bool = true : set = _set_start_on_cam
@export_range(0, 999999, 0.001, "suffix:s", "hide_slider") var auto_start_after_time:float = 0.0
@export_range(0, 999999, 0.1, "suffix:px", "hide_slider") var auto_start_at_distance:float = 5 : set = _set_start_at_dist
@export var auto_distance_from:NodePath
@export var auto_trigger_container:NodePath

# random
var r_active_chances:float = 1
var r_rotating_variation:Vector3
var r_pattern_choice:String
#var r_switch_pattern:bool
var r_start_time_choice:String
var r_start_time_variation:Vector3
#var r_switch_time:bool
var r_start_distance_choice:String
var r_start_distance_variation:Vector3

var trig_container:TriggerContainer
var trigger_counter = 0
var trig_iter:Dictionary
var trigger_timeout:bool = false
var trigger_time:float = 0
var trig_collider
var trig_signal

var auto_call:bool = false
var can_respawn:bool = true
var has_pattern:bool
var vis:VisibleOnScreenNotifier2D

func _ready():
	if Engine.is_editor_hint(): return
	
	has_pattern = (auto_pattern_id != "" or !patterns_multi.is_empty())
	
	if shared_area_name != "":
		shared_area = Spawning.get_shared_area(shared_area_name)
	else: push_error("Spawnpoint doesn't have any shared_area")
	
	randomize()
	if int(r_active_chances) < 1 and randf_range(0,1) > r_active_chances:
		active = false
		set_physics_process(false)
		return
	
	apply_randomness()
	
	assert(has_pattern, "Spawner has no pattern to spawn.")
	if auto_start_on_cam: _set_start_on_cam(true)
	elif auto_distance_from != NodePath(): set_physics_process(true)
	#else:
		#if auto_start_after_time > float(0.0):
			#await get_tree().create_timer(auto_start_after_time).timeout
		#auto_call = true
		#set_physics_process(active)
		
	if active:
		if auto_start_after_time > float(0.0):
			await get_tree().create_timer(auto_start_after_time).timeout
		auto_call = true
		set_physics_process(active)
		
	if rotating_speed > 0: set_physics_process(active)
		
	if auto_trigger_container:
		trig_container = get_node(auto_trigger_container)
#		set_physics_process(false)
	
	call_deferred("set_pool")


var _delta:float
func _physics_process(delta):
	if Engine.is_editor_hint(): return
	_delta = delta
	if rotating_speed > 0:
		rotate(rotating_speed)
	if trig_container:
		checkTrigger()
		return
	
	if auto_distance_from != NodePath() and \
			global_position.distance_to(get_node(auto_distance_from).global_position) <= auto_start_at_distance:
		active = true
	
	if can_respawn and auto_call and active:
		call_deferred("spawn")
		can_respawn = false
		if not rotating_speed > 0: set_physics_process(false)
		#apply_randomness(false)

func spawn():
	if patterns_multi.is_empty():
		assert(auto_pattern_id != "", "You must input a pattern in auto_pattern_id")
		Spawning.spawn(self, auto_pattern_id, shared_area_name, process_id)
	elif patterns_all_in_1:
		for p in patterns_multi:
			Spawning.spawn(self, p, shared_area_name, process_id)
	else: Spawning.spawn_list([self], patterns_multi, patterns_loops, [shared_area_name], process_id)

func apply_randomness():
	if r_rotating_variation != Vector3():
		rotating_speed = Spawning.random_get_variation(rotating_speed, r_rotating_variation.x, r_rotating_variation.y, r_rotating_variation.z)
	
	if r_start_distance_choice != "":
		auto_start_at_distance = Spawning.random_get_choice(r_start_distance_choice.split(";", false))
	if r_start_distance_variation != Vector3():
		auto_start_at_distance = Spawning.random_get_variation(auto_start_at_distance, r_start_distance_variation.x, r_start_distance_variation.y, r_start_distance_variation.z)
	
	#if not init: return
	
	if r_pattern_choice != "":
		auto_pattern_id = Spawning.random_get_choice(r_pattern_choice.split(";", false))
	
	#if r_switch_time:
	if r_start_time_choice != "":
		auto_start_after_time = Spawning.random_get_choice(r_start_time_choice.split(";", false))
	if r_start_time_variation != Vector3():
		auto_start_after_time = Spawning.random_get_variation(auto_start_after_time, r_start_time_variation.x, r_start_time_variation.y, r_start_time_variation.z)

func set_pool():
	assert(has_pattern)
	if not (active and pool_amount > 0): return
	var props
	if not patterns_multi.is_empty():
		for p in patterns_multi:
			props = Spawning.pattern(p)["bullet"]
			Spawning.create_pool(props, shared_area_name, pool_amount, Spawning.bullet(props).has("instance_id"))
	else:
		var pattern:Pattern = Spawning.pattern(auto_pattern_id)
		props = pattern["bullet"]
		Spawning.create_pool(props, shared_area_name, pool_amount, Spawning.bullet(props).has("instance_id"))
		if not pattern["bullet_list"].is_empty():
			for b in pattern["bullet_list"]:
				Spawning.create_pool(b, shared_area_name, pool_amount, Spawning.bullet(b).has("instance_id"))
		

func on_screen(is_on):
	if is_on and auto_start_after_time > float(0.0):
		await get_tree().create_timer(auto_start_after_time).timeout
	active = is_on
	set_physics_process(active)

func triggerSignal(sig):
	trig_signal = sig
	checkTrigger()

func trig_timeout(time:float=0):
	trigger_time += _delta
	if trigger_time >= time:
		trigger_timeout = true
		trigger_time = 0
		return true
	return false
#	checkTrigger()

func checkTrigger():
	if not (active and auto_pattern_id != "" and trig_container): return
	trig_container.checkTriggers(self, self)
#		Spawning.spawn(self, auto_pattern_id, shared_area_name)

func callAction():
	spawn()
	#Spawning.spawn(self, auto_pattern_id, shared_area_name)


func _set_start_on_cam(value):
	auto_start_on_cam = value
	if Engine.is_editor_hint(): return
	if not auto_start_on_cam or vis != null: return
	vis = VisibleOnScreenNotifier2D.new()
	vis.connect("screen_entered",Callable(self,"on_screen").bind(true))
	vis.connect("screen_exited",Callable(self,"on_screen").bind(false))
	
func _set_start_at_dist(value):
	auto_start_at_distance = value
	if Engine.is_editor_hint(): return
	set_physics_process(value)



func _get_property_list() -> Array:
	return [
		{
			name = "Random",
			type = TYPE_NIL,
			hint_string = "r_",
			usage = PROPERTY_USAGE_GROUP
		},
		{ name = "r_active_chances", type = TYPE_FLOAT,
			hint = PROPERTY_HINT_RANGE, hint_string = "0, 1", usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_rotating_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_pattern_choice", type = TYPE_ARRAY, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_start_time_choice", type = TYPE_STRING, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_start_time_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_start_distance_choice", type = TYPE_STRING, usage = PROPERTY_USAGE_DEFAULT },
		{ name = "r_start_distance_variation", type = TYPE_VECTOR3, usage = PROPERTY_USAGE_DEFAULT }
	]
