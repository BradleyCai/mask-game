class_name ComputerAndCart
extends Node3D

@export var screen_mesh : MeshInstance3D
@export var viewport : SubViewport
@export var player_view_position : Node3D
@export var screen_area : Area3D
@export var shape : CollisionShape3D
@export var mouse_ray : MouseRay
@export_flags_3d_render var render_layer : int = 0

var box_size : Vector2
var last_poll_pressed : bool = false

func _ready() -> void:
	await RenderingServer.frame_post_draw
	var mat : StandardMaterial3D = screen_mesh.mesh.surface_get_material(0)
	mouse_ray.set_render_layer(render_layer)
	viewport.set_render_layer(render_layer)
	var viewport_tex : ViewportTexture = viewport.get_texture()
	mat.albedo_texture = viewport_tex
	var box : BoxShape3D = shape.shape
	box_size = Vector2(box.size.x, box.size.y)



func _on_screen_area_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if last_poll_pressed:
		# old
		#var relative : Vector3  = event_position - screen_area.global_position

		# new
		var relative : Vector3 = screen_area.to_local(event_position)

		var relative_2d : Vector2 = (Vector2(relative.x, relative.y) / box_size) + Vector2(.5, .5)
		relative_2d.y = 1 - relative_2d.y
		var viewport_cam : Camera3D = viewport.camera
		var viewport_size := Vector2(viewport.size)
		var viewport_position : Vector2 = relative_2d * viewport_size
		var projected_camera_position : Vector3 = viewport_cam.project_position(viewport_position, viewport_cam.global_position.y)
		mouse_ray.move_mask_to_world_point(projected_camera_position)
	
	if event.is_action("interact"):
		if event.is_pressed():
			last_poll_pressed = true	
		else:
			last_poll_pressed = false
		


func _on_interact_area_body_entered(body: Node3D) -> void:
	if body is Character:
		body.enter_computer_view_mode(self)
