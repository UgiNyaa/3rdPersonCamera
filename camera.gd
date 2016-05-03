
extends Camera

var distance = 20
var last = Vector2(0,0)

func _ready():
	last = get_viewport().get_mouse_pos()
	set_process(true)

func _process(delta):
	var player = get_parent()
	var transform = get_transform()
	var curr = get_viewport().get_mouse_pos()
	var mouse = Vector2(curr - last) / 100
	last = curr
	
	var rotMat = transform.basis * Matrix3().rotated(Vector3(0,1,0),mouse.x) * Matrix3().rotated(Vector3(1,0,0),mouse.y)
	
	var forward = rotMat.xform(Vector3(0,0,-1))
	
	transform.origin = player.get_transform().origin - (distance * forward)
	transform = transform.looking_at(forward, Vector3(0,1,0))
	
	set_transform(transform)


