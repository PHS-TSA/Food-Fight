extends AudioStreamPlayer

const level_music := preload("res://Assets/Audio/Avner Kelmer - Lunch Time.mp3")


# Best volume is -15.22
func _play_music(music: AudioStream):
	if stream == music:
		return
	stream = music
	volume_db = -80

	play()


func play_music_level():
	_play_music(level_music)  #change this to be random or something
