extends AudioStreamPlayer2D
func _ready():
	stream = load("res://Main/song1.wav")
	autoplay = true

func _on_music_finished():
	play()
