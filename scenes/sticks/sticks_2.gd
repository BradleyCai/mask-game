extends Node3D

@export var ball_path: NodePath
@export var max_distance := 5.0
@export var falloff: Curve

@export var smooth_speed := 8.0

@onready var mask_pos: Node3D = get_node(ball_path)
var bodies: Array[AnimatableBody3D] = []

func _ready():
	for c in get_children():
		if c is AnimatableBody3D:
			bodies.append(c)

func _process(delta):
	var ball_pos = mask_pos.global_position

	for body in bodies:
		var d = body.global_position.distance_to(ball_pos)

		var curve_value = falloff.sample(d) # 0–1
		var target_y = curve_value

		var pos = body.global_position
		pos.y = target_y
		body.global_position = pos
