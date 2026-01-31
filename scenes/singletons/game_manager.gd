extends Node

var _character : Character
var _computer_and_cart : ComputerAndCart
var _viewport_camera : Camera3D

func get_viewport_camera() -> Camera3D:
    if _viewport_camera == null:
        _viewport_camera = get_tree().current_scene.get_node("SubViewport/ViewportCamera")
    return _viewport_camera

func get_character() -> Character:
    if _character == null:
        _character = get_tree().current_scene.get_node("Character")
    return _character

func get_computer_and_cart() -> ComputerAndCart:
    if _computer_and_cart == null:
        _computer_and_cart = get_tree().current_scene.get_node("ComputerAndCart")
    return _computer_and_cart

func _ready() -> void:
    pass