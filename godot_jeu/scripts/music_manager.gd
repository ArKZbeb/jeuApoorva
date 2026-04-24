extends Node

# Gère la musique d'ambiance du jeu

class_name MusicManager

var audio_player: AudioStreamPlayer
var music_path: String = "res://assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3"

func _ready():
	# Créer un AudioStreamPlayer
	audio_player = AudioStreamPlayer.new()
	audio_player.bus = "Master"
	add_child(audio_player)
	
	# Charger et jouer la musique
	var music = load(music_path)
	if music:
		audio_player.stream = music
		audio_player.volume_db = -15.0  # Volume plus bas (ambiance discrète)
		audio_player.bus = "Master"
		# La boucle est gérée automatiquement via le process
		play_music()
		print("[MusicManager] Music loaded and playing: %s" % music_path)
	else:
		push_error("[MusicManager] Could not load music: %s" % music_path)

func _process(_delta):
	# Assurer que la musique boucle en continu
	if audio_player and not audio_player.playing:
		audio_player.play()

func play_music():
	if audio_player and not audio_player.playing:
		audio_player.play()

func stop_music():
	if audio_player and audio_player.playing:
		audio_player.stop()

func set_volume(db: float):
	if audio_player:
		audio_player.volume_db = db
