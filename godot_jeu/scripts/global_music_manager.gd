extends Node

# Gestionnaire de musique GLOBAL (Autoload/Singleton)
# Cette musique persiste même quand on change de scène!

var audio_player: AudioStreamPlayer
var music_path: String = "res://assets/audio/Sabrina Carpenter - Espresso (Official Video).mp3"
var is_playing: bool = false

func _ready():
	# S'assurer que ce nœud persiste entre les scènes
	set_process_mode(Node.PROCESS_MODE_ALWAYS)
	
	# Créer le lecteur audio
	audio_player = AudioStreamPlayer.new()
	audio_player.bus = "Master"
	add_child(audio_player)
	
	# Charger et jouer la musique
	var music = load(music_path)
	if music:
		audio_player.stream = music
		audio_player.volume_db = -15.0  # Volume discret
		audio_player.bus = "Master"
		play_music()
		is_playing = true
		print("[GlobalMusicManager] Music loaded and playing globally")
	else:
		push_error("[GlobalMusicManager] Could not load music: %s" % music_path)

func _process(_delta):
	# Assurer que la musique boucle en continu
	if audio_player and not audio_player.playing and is_playing:
		audio_player.play()

func play_music():
	if audio_player and not audio_player.playing:
		audio_player.play()
		is_playing = true
		print("[GlobalMusicManager] Music playing")

func stop_music():
	if audio_player and audio_player.playing:
		audio_player.stop()
		is_playing = false
		print("[GlobalMusicManager] Music stopped")

func set_volume(db: float):
	if audio_player:
		audio_player.volume_db = db
		print("[GlobalMusicManager] Volume set to %f dB" % db)

func pause_music():
	if audio_player and audio_player.playing:
		audio_player.stream_paused = true
		print("[GlobalMusicManager] Music paused")

func resume_music():
	if audio_player and not audio_player.stream_paused:
		audio_player.stream_paused = false
		print("[GlobalMusicManager] Music resumed")
