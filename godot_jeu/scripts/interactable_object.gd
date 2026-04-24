extends Node3D

# Objet interactif dans le monde (drapeaux, micro, photos, etc.)

class_name InteractableObject

@export var object_id: String = "object_default"
@export var interaction_text: String = "Interact"
@export var is_enigma_object: bool = false
@export var enigma_id: int = -1

func _ready():
	# Ajouter un Area3D pour détecter les raycast
	pass

func interact(player_index: int):
	print("[InteractableObject] %s interacted by player %d" % [object_id, player_index])
	
	if is_enigma_object:
		# Notifier GameManager pour traiter l'énigme
		var game_manager = get_tree().root.get_node("GameManager")
		if game_manager:
			game_manager.on_enigma_object_interacted(enigma_id, object_id)
	else:
		# Afficher du texte ou déclencher une action simple
		var ui_manager = get_tree().root.get_node("UIManager")
		if ui_manager:
			ui_manager.show_notification(interaction_text)

func get_object_id() -> String:
	return object_id

func get_enigma_id() -> int:
	return enigma_id
