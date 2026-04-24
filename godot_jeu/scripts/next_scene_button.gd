extends Area3D

# Interrupteur pour avancer à la scène suivante
# Avec condition: résoudre toutes les énigmes

@export var next_scene: String = "res://scenes/salle_aventures.tscn"
@export var require_all_enigmas: bool = true

var player_inside: bool = false
var game_manager: GameManager

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Trouver le GameManager
	game_manager = get_parent().get_node_or_null("GameManager")
	
	print("[NextSceneButton] Ready - require_all_enigmas: %s" % require_all_enigmas)

func _on_body_entered(body):
	if body.is_in_group("player") or body.name == "Player":
		player_inside = true
		_check_and_display_message()

func _on_body_exited(body):
	if body.is_in_group("player") or body.name == "Player":
		player_inside = false

func _check_and_display_message():
	if require_all_enigmas and game_manager:
		if game_manager.total_enigmas == 0:
			print("[NextSceneButton] No enigmas in this scene")
			return
		
		var all_solved = game_manager.get_solved_enigma_count() == game_manager.total_enigmas
		if all_solved:
			print("[NextSceneButton] ✅ All %d enigmas solved! - Press E to continue" % game_manager.total_enigmas)
		else:
			var remaining = game_manager.total_enigmas - game_manager.get_solved_enigma_count()
			print("[NextSceneButton] 🔒 Need to solve %d more enigmas" % remaining)
	else:
		print("[NextSceneButton] No enigma requirement - Press E to continue")

func _input(event: InputEvent):
	if player_inside and event is InputEventKey and event.pressed:
		if event.keycode == KEY_E:
			# Vérifier la condition
			if require_all_enigmas and game_manager:
				if game_manager.total_enigmas > 0:
					var all_solved = game_manager.get_solved_enigma_count() == game_manager.total_enigmas
					if not all_solved:
						var remaining = game_manager.total_enigmas - game_manager.get_solved_enigma_count()
						print("[NextSceneButton] ❌ Cannot proceed! %d enigmas left to solve" % remaining)
						return
			
			print("[NextSceneButton] ✅ Loading %s" % next_scene)
			get_tree().change_scene_to_file(next_scene)
