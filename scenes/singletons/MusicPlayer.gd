extends AudioStreamPlayer

func _init() -> void:
	self.bus = "Music"

func play_music(music_stream: AudioStream) -> void:
	self.stop()
	stream = music_stream
	self.play()
