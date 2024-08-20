@tool
extends Path2D
class_name BulletPattern

@export_placeholder("ID") var id:String = ""
@export var props:PackedDataContainer


func _ready():
	randomize()
	add_to_group("BulletProps")
	if Engine.is_editor_hint():
		generate_bulletprops()
		return
	
	if props.get("a_curve_movement") and props.get("a_curve_movement") > 0:
		assert(curve.get_point_count() > 0, \
			"BulletProperties has no curve. Draw one like you'd draw a Path2D with the BulletPattern node")
		props.curve = curve
	
	Spawning.new_bullet(id, Spawning.sanitize_bulletprops(props, id, self))
	#print(dict)
	queue_free()

func generate_bulletprops():
	if not props: props = Spawning.generate_new_bulletprops()
