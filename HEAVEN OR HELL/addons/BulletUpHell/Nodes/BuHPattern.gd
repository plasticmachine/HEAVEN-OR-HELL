@tool
extends Path2D
class_name SpawnPattern

@export_placeholder("ID") var id:String = ""
@export var pattern:NavigationPolygon
@export var preview_spawn:bool = false
@export var preview_shoot:bool = false : set = set_pre_shoot

var preview_bullet:BulletProps


func _ready():
	if not (!Engine.is_editor_hint() and pattern): return
	if pattern.resource_name in ["PatternCustomShape","PatternCustomPoints"]:
		pattern.shape = curve
	if pattern.resource_name == "PatternCustomShape":
		var follow:PathFollow2D = PathFollow2D.new()
		add_child(follow)
		Spawning.shape_distribute(pattern, curve, follow)
	elif pattern.resource_name == "PatternCustomPoints":
		Spawning.points_distribute(pattern, curve)
	elif pattern.resource_name == "PatternCustomArea":
		Spawning.curve_to_polygon(pattern, curve)
		if pattern.grid_spawning == Vector2(0,0): Spawning.area_distribute(pattern)
		else: Spawning.grid_distribute(pattern)
	
	Spawning.new_pattern(id, Spawning.sanitize_pattern(pattern, self))
	queue_free()

func _process(delta):
	if preview_spawn and Engine.is_editor_hint():
		queue_redraw()
#	if pattern != null and pattern.resource_name == "PatternCustomPoints" and pattern.calculate_angles == pattern.ANGLE_TYPE.Custom:
#		print(pattern.angles)
#		while curve.get_point_count() > pattern.angles.size():
#			pattern.angles.append(0.0)

func set_pre_shoot(value):
	preview_shoot = value

func _draw():
	if not preview_spawn or pattern == null: return
	if pattern.resource_name in ["PatternCustomShape"]:
		var length = curve.get_baked_length()
		var follow
		if preview_shoot:
			follow = PathFollow2D.new()
			add_child(follow)
			
		draw_circle(pattern.center_pos, 10, Color.YELLOW)
		for b in pattern.nbr:
			var pos_on_curve
			if pattern.closed_shape: pos_on_curve = length/pattern.nbr*b
			else: pos_on_curve = length/(pattern.nbr-1)*b
			var pos = curve.sample_baked(pos_on_curve)
			draw_circle(pos, 10, Color.RED)
			
			if preview_shoot:
				follow.h_offset = pos_on_curve
				draw_line(pos, pos+Vector2(32,0).rotated(follow.rotation-PI/2),Color.YELLOW,3)
	#			var points = curve.get_baked_points()
	#			for p in points.size():
	#				points.set(p, points[p])
	#			draw_polyline(points, Color.RED, 2.0)
		if preview_shoot:
			remove_child(follow)
	elif pattern.resource_name in ["PatternCustomPoints"]:
		draw_circle(pattern.center_pos, 10, Color.YELLOW)
#		for p in curve.get_point_count(): #TODO PORT GODOT 4
#			draw_string(Label.new().get_font(""), curve.get_point_position(p), str(p), color=Color.RED)
#			draw_string()
