extends Area3D

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

func _on_body_exited(body: Node) -> void:
	if body is BowlBall:
		on = false
		light.visible = false
