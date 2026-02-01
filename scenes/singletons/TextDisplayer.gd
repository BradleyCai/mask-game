extends Control

@export var text: String

@export_group("nodes")
@export var _text_label: RichTextLabel

func _ready() -> void:
	pass

func display_text(text_to_display: String) -> void:
	_text_label.text = text_to_display

func reset() -> void:
	_text_label.text = ""
