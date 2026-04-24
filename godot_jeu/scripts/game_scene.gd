extends Node3D

# Script principal pour gérer les interactions et le flux du jeu

func _ready():
	print("[GameScene] Scene ready")
	
	# Initialiser tous les gestionnaires
	var input_manager = $InputManager
	var camera_manager = $CameraManager
	var game_manager = $GameManager
	var ui_manager = $UIManager
	
	print("[GameScene] Managers initialized")
	
	# Chercher et initialiser les joueurs
	if has_node("Players"):
		var player_nodes = $Players.get_children()
		for i in range(min(4, player_nodes.size())):
			var player = player_nodes[i]
			if player.has_method("initialize"):
				player.initialize(i)
				if camera_manager:
					camera_manager.register_player(player, i)
				print("[GameScene] Player %d registered" % i)
