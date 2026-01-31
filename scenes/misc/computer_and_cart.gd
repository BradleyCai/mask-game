extends Node3D

@export var screen_mesh : MeshInstance3D
@export var viewport : SubViewport

func _ready() -> void:
	var mat : StandardMaterial3D = screen_mesh.get_surface_override_material(0)
	var viewport_tex: ViewportTexture = mat.albedo_texture
	viewport_tex.viewport_path = viewport.get_path()
