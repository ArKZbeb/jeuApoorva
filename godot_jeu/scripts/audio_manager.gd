extends AudioStreamPlayer

# Gère la musique d'ambiance du jeu

func _ready():
	# Charger la musique
	var music_path = "res://assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3"
	var audio_stream = load(music_path)
	
	if audio_stream:
		stream = audio_stream
		bus = "Master"
		volume_db = -10  # Un peu moins fort pour ne pas surcharger
		play()
		print("[AudioManager] Music loaded and playing")
	else:
		push_error("[AudioManager] Could not load music at: %s" % music_path)
