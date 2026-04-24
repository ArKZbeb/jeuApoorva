extends Node3D

# Scène Salle Aventures - Acte 2 (Single Player)

func _ready():
	await get_tree().process_frame
	setup_player()
	print("[SalleAventures] Scene loaded")

func setup_player():
	if has_node("Player"):
		var player = $Player
		if player.has_method("initialize"):
			player.initialize(0)
			print("[SalleAventures] Player initialized")
			
			var camera_manager = $CameraManager if has_node("CameraManager") else null
			if camera_manager and camera_manager.has_method("register_player"):
				camera_manager.register_player(player, 0)
	else:
		push_error("[SalleAventures] Player node not found!")
