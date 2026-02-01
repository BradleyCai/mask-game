class_name MouseRay
extends RayCast3D

@export var _computer_screen_mesh_visual : MeshInstance3D

func _ready() -> void:
	_computer_screen_mesh_visual.visible = true

func move_mask_to_world_point(world_point : Vector3):
	global_position = Vector3(world_point.x, global_position.y, world_point.z)

func set_render_layer(render_layer : int) -> void:
	print(name," Setting render layer ", render_layer)
	_computer_screen_mesh_visual.layers = render_layer
