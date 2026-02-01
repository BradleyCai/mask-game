class_name MouseRay
extends RayCast3D


func _ready() -> void:
	pass

func move_mask_to_world_point(world_point : Vector3):
	global_position = Vector3(world_point.x, global_position.y, world_point.z)
