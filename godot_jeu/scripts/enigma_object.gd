extends Area3D

# Objet énigme interactif - le joueur approche et appuie sur E

class_name EnigmaObject

@export var enigma_id: int = 1

var game_manager: GameManager
var ui_manager: Node
var player_inside: bool = false

func _ready():
	game_manager = get_tree().root.get_node_or_null("SalleAventures/GameManager")
	ui_manager = get_tree().root.get_node_or_null("SalleAventures/UIManager")
	
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	print("[EnigmaObject] Enigma %d ready" % enigma_id)

func _on_body_entered(body):
	if body.is_in_group("player") or body.name == "Player":
		player_inside = true
		print("[EnigmaObject] Player near enigma %d - Press E" % enigma_id)

func _on_body_exited(body):
	if body.is_in_group("player") or body.name == "Player":
		player_inside = false

func _input(event: InputEvent):
	if player_inside and event is InputEventKey and event.pressed:
		if event.keycode == KEY_E:
			interact()

func interact():
	if game_manager == null or ui_manager == null:
		return
	
	var enigma = null
	for e in game_manager.enigma_list:
		if e.get("id") == enigma_id:
			enigma = e
			break
	
	if enigma == null:
		push_error("[EnigmaObject] Enigma %d not found!" % enigma_id)
		return
	
	# Afficher le prompt
	if ui_manager.has_method("show_enigma_prompt"):
		ui_manager.show_enigma_prompt(enigma)
		print("[EnigmaObject] Showing enigma %d: %s" % [enigma_id, enigma.get("question", "")])
