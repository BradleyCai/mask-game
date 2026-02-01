extends RayCast3D


func _ready() -> void:
    Signals.move_mask_to_world_point_requested.connect(_on_move_mask_to_world_point_requested)


func _on_move_mask_to_world_point_requested(world_point : Vector3):
    global_position = Vector3(world_point.x, global_position.y, world_point.z)