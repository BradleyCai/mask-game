class_name ComputerAndCart
extends Node3D

@export var screen_mesh : MeshInstance3D
@export var viewport : SubViewport
@export var player_view_position : Node3D
@export var screen_area : Area3D
@export var shape : CollisionShape3D

var box_size : Vector2
var last_poll_pressed : bool = false

func _ready() -> void:
	var mat : StandardMaterial3D = screen_mesh.mesh.surface_get_material(0)
	var viewport_tex : ViewportTexture = mat.albedo_texture
	viewport_tex.viewport_path = viewport.get_path()
	var box : BoxShape3D = shape.shape
	box_size = Vector2(box.size.x, box.size.y)


func _on_screen_area_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if last_poll_pressed:
		var relative : Vector3  = event_position - screen_area.global_position
		var relative_2d : Vector2 = (Vector2(relative.x, relative.y) / box_size) + Vector2(.5, .5)
		relative_2d.y = 1 - relative_2d.y
		var viewport_cam : Camera3D = GameManager.get_viewport_camera()
		var viewport : SubViewport = viewport_cam.get_parent()
		var viewport_size := Vector2(viewport.size)
		var viewport_position : Vector2 = relative_2d * viewport_size
		var projected_camera_position : Vector3 = viewport_cam.project_position(viewport_position, viewport_cam.global_position.y)
		Signals.move_mask_to_world_point_requested.emit(projected_camera_position)
	
	if event.is_action("interact"):
		if event.is_pressed():
			last_poll_pressed = true	
		else:
			if last_poll_pressed:
				print("Relase!")	
			last_poll_pressed = false
		


func _on_interact_area_body_entered(body: Node3D) -> void:
	if body is Character:
		body.enter_computer_view_mode(self)
