extends Node3D

# Affiche les messages sur le mur 3D

class_name MessageWallDisplay

func _ready():
	await get_tree().process_frame
	setup_player()
	display_messages_on_wall()
	print("[MessageWallDisplay] Scene loaded")

func setup_player():
	if has_node("Player"):
		var player = $Player
		if player.has_method("initialize"):
			player.initialize(0)
			
			var camera_manager = $CameraManager if has_node("CameraManager") else null
			if camera_manager and camera_manager.has_method("register_player"):
				camera_manager.register_player(player, 0)

func display_messages_on_wall():
	var message_parser = $MessageParser
	if message_parser == null:
		push_error("[MessageWallDisplay] MessageParser not found!")
		return
	
	var messages = message_parser.get_all_messages()
	var message_text = "👑 MEME QUEEN 👑\n\n"
	
	for msg in messages:
		message_text += "[%s]\n%s\n\n" % [msg.get("auteur", "?"), msg.get("texte", "")]
	
	message_text += "\n👑 MEME QUEEN 👑"
	
	# Afficher sur le mur 3D
	var wall_label = $FinalDecor/MessageWall/Label3D if has_node("FinalDecor/MessageWall/Label3D") else null
	if wall_label:
		wall_label.text = message_text
		wall_label.font_size = 32
		wall_label.autowrap_mode = TextServer.AUTOWRAP_WORD
		wall_label.width = 100  # Largeur pour forcer le word wrap
		print("[MessageWallDisplay] Messages displayed on wall")
	else:
		push_error("[MessageWallDisplay] Label3D on wall not found!")
	
	# Aussi afficher sur l'écran UI comme backup
	var messages_display = $UIManager/MessagesDisplay if has_node("UIManager/MessagesDisplay") else null
	if messages_display:
		messages_display.text = message_text
