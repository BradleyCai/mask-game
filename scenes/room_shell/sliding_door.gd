class_name SlidingDoor
extends Node3D

@export var animation_player: AnimationPlayer

func _ready() -> void:
	animation_player.play(&"RESET")
