extends Node3D

# Système global d'interaction avec raycast depuis les caméras

class_name InteractionRaycaster

@export var interaction_range: float = 10.0
var input_manager: InputManager
var camera_manager: CameraManager

func _ready():
	input_manager = get_parent().get_node("InputManager")
	camera_manager = get_parent().get_node("CameraManager")

func _process(_delta):
	check_interactions()

func check_interactions():
	if input_manager == null:
		return
	
	var active_count = input_manager.get_active_player_count()
	
	for i in range(active_count):
		var player_input = input_manager.get_player_input(i)
		if player_input.get("interact_pressed", false):
			perform_raycast(i)

func perform_raycast(player_index: int):
	var player_controller = get_player_controller(player_index)
	if player_controller == null:
		return
	
	var camera = player_controller.get_camera()
	if camera == null:
		return
	
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(
		camera.global_position,
		camera.global_position + camera.global_transform.basis.z * -interaction_range
	)
	
	var result = space_state.intersect_ray(query)
	if result:
		var collider = result.get("collider")
		if collider:
			print("[InteractionRaycaster] Hit: %s" % collider.name)

func get_player_controller(player_index: int) -> PlayerController:
	var players = get_parent().get_node("Players").get_children()
	if player_index >= 0 and player_index < players.size():
		return players[player_index] as PlayerController
	return null
