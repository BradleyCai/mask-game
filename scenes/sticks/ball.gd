extends Node3D

@export var amplitude := 4.0
@export var speed := 1.0

var time := 0.0
var start_z := 0.0

func _ready():
	start_z = global_position.z

func _process(delta):
	time += delta
	var pos = global_position
	pos.z = start_z + sin(time * speed) * amplitude
	global_position = pos
