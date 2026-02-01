extends Node

var global_audio_player: AudioStreamPlayer

func _ready() -> void:
	reset()

## reparents and plays the given AudioStreamPlayer as a child of this node
## this prevents issues where the AudioStreamPlayer might cut off audio if its original parent is removed from the scene tree
func reparent_play(audio_stream_player: AudioStreamPlayer) -> void:
	if audio_stream_player.get_parent() != self:
		audio_stream_player.reparent(self)
	
	audio_stream_player.play()

func play_from_player(audio_stream_player: AudioStreamPlayer) -> void:
	reset()

	global_audio_player = audio_stream_player
	global_audio_player.play()

func reset() -> void:
	if global_audio_player != null:
		global_audio_player.queue_free()

	global_audio_player = AudioStreamPlayer.new()
	add_child(global_audio_player)
