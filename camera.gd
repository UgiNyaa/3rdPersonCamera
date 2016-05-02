
extends Camera

var distance = 10
var time = 0

func _ready():
	set_process(true)

func _process(delta):
	var player = get_parent()
	var transform = get_transform()
	var rotMat = Matrix3()
	time += delta
	var mouse = Vector2(time, time)
	
	rotMat = rotMat.rotated(Vector3(0,1,0),mouse.x)
	
	var forward = rotMat.xform(Vector3(0,0,1))
	transform.origin = player.get_transform().origin - (distance * forward)
	transform = transform.looking_at(forward, Vector3(0,1,0))
	
	
	set_transform(transform)


