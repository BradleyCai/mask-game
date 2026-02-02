extends Control

@export_group("nodes")
@export var _text_label: RichTextLabel

var _timer: Timer = Timer.new()

func _ready() -> void:
	self.add_child(_timer)
	_timer.timeout.connect(reset)

func display_text(text: String, timeout: float) -> void:
	reset()
	_text_label.text = text

	if timeout == 0.0:
		_timer.start(text.length() * 0.3 + 1.0) # TODO this is temporary convenience code
	else:
		_timer.start(timeout)

func reset() -> void:
	_text_label.text = ""
