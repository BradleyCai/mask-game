extends SubViewport

@export var camera : Camera3D

func set_render_layer(render_layer : int):
    camera.set_cull_mask(render_layer)

