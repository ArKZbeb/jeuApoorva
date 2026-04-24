extends Node

# Gère la caméra pour un seul joueur

class_name CameraManager

var player_camera: Camera3D

func _ready():
	pass

func register_player(player_controller: PlayerController, player_index: int):
	if player_index == 0:  # On n'accepte que le joueur 0
		if player_controller.get_camera():
			player_camera = player_controller.get_camera()
			player_camera.current = true
			print("[CameraManager] Player camera registered (single player)")

