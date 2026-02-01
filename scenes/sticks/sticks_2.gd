extends Node3D

@export var ball_path: NodePath
@export var max_distance := 5.0
@export var falloff: Curve

@export var smooth_speed := 8.0

@onready var actual_pos: Vector3 = get_node(ball_path).global_position
@onready var mask_pos: Node3D = get_node(ball_path)
var bodies: Array[AnimatableBody3D] = []

func _ready():
	for c in get_children():
		if c is AnimatableBody3D:
			bodies.append(c)

func _physics_process(delta):
	var target_pos = mask_pos.global_position
	actual_pos = actual_pos.move_toward(target_pos, 5 * delta)

	for body in bodies:
		var p1 = body.global_position
		var p2 = actual_pos
		p1.y = 0
		p2.y = 0
		var d = p1.distance_to(p2)

		var curve_value = falloff.sample(d) # 0–1

		var pos = body.global_position
		pos.y = curve_value
		body.global_position = pos
