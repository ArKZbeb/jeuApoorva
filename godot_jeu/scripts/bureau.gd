extends Node3D

# Scène Bureau - Acte 1 (Single Player)

func _ready():
	await get_tree().process_frame
	setup_player()
	print("[Bureau] Scene loaded")

func setup_player():
	# Pour single player, on récupère juste le nœud "Player"
	if has_node("Player"):
		var player = $Player
		if player.has_method("initialize"):
			player.initialize(0)
			print("[Bureau] Player initialized")
			
			# Enregistrer auprès du CameraManager
			var camera_manager = $CameraManager if has_node("CameraManager") else null
			if camera_manager and camera_manager.has_method("register_player"):
				camera_manager.register_player(player, 0)
	else:
		push_error("[Bureau] Player node not found!")
