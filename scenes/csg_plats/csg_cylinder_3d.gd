extends CSGCylinder3D

@export var amplitude := 4.0
@export var speed := 1.0

var time := 0.0
var start_z := 0.0
var start_x := 0.0

func _ready():
	start_z = global_position.z
	start_x = global_position.x


func _process(delta):
	time += delta
	var pos = global_position
	pos.z = start_z + sin(time * speed) * amplitude
	pos.x = start_x + cos(time * speed * 2) * amplitude

	global_position = pos
