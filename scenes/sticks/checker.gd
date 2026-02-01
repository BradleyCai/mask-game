extends Area3D

@export var sliding_door: SlidingDoor
@export var light_path: NodePath
@onready var light := get_node(light_path)

var on := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node) -> void:
	if body is BowlBall:
		on = true
		light.visible = true
		sliding_door.animation_player.play("open_door")


func _on_body_exited(body: Node) -> void:
	if body is BowlBall:
		pass
		#on = false
		#light.visible = false
