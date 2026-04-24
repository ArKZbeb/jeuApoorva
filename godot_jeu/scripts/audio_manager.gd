extends AudioStreamPlayer

# Gère la musique d'ambiance du jeu

func _ready():
	# Charger la musique
	var music_path = "res://assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3"
	var audio_stream = load(music_path)
	
	if audio_stream:
		stream = audio_stream
		bus = "Master"
		volume_db = -15  # Volume plus discret pour l'ambiance (moins fort)
		# Configurer la boucle en continu
		bus_layout_changed.connect(_on_bus_layout_changed)
		play()
		print("[AudioManager] Music loaded and playing in loop")
	else:
		push_error("[AudioManager] Could not load music at: %s" % music_path)

# Assurer que la musique boucle en continu
func _process(_delta):
	if not playing:
		play()

func _on_bus_layout_changed():
	# Réinitialiser la musique si nécessaire
	if not playing:
		play()
