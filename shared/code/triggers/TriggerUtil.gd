class_name TriggerUtil
extends Object

func _init() -> void:
	assert(false, "Util is a static library and should not be initialized")

static func trigger(trigger_node: Node) -> void:
	for child in trigger_node.get_children():
		var action := child as Action
		if action == null:
			continue

		action.run(child)
