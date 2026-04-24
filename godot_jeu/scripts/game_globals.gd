extends Node

# Autoload global pour faciliter l'accès aux gestionnaires

var input_manager: InputManager
var camera_manager: CameraManager
var game_manager: GameManager
var ui_manager: UIManager
var message_parser: MessageParser

func _ready():
	print("[GameGlobals] Initialized")
	
	# Ces références seront assignées par les scènes individuelles
	# ou on peut les chercher dynamiquement si besoin
