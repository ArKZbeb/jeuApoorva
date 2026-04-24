extends Node

# Gère l'entrée de 1 joueur (clavier ou gamepad)

class_name InputManager

var player_inputs: Array = []
var max_players: int = 4
var active_player_count: int = 0

func _ready():
	initialize_controllers()

func initialize_controllers():
	for i in range(max_players):
		player_inputs.append({
			"player_index": i,
			"movement_input": Vector2.ZERO,
			"look_input": Vector2.ZERO,
			"interact_pressed": false,
			"connected": false
		})
	
	print("[InputManager] Initialized for %d players" % max_players)

func _process(_delta):
	update_inputs()
	# Debug: afficher l'input du joueur 0
	if active_player_count > 0:
		var input = player_inputs[0]
		if input["movement_input"] != Vector2.ZERO:
			print("[InputManager] Movement: %s" % input["movement_input"])

func update_inputs():
	# Récupérer les gamepads connectés
	var gamepads = Input.get_connected_joypads()
	
	# Si pas de gamepad, utiliser le clavier
	if gamepads.is_empty():
		active_player_count = 1
		# Clavier pour le joueur 0
		var move_x = 0.0
		var move_y = 0.0
		
		# Flèches OU ZQSD
		if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
			move_x += 1.0
		if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_Q):
			move_x -= 1.0
		if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
			move_y += 1.0
		if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_Z):
			move_y -= 1.0
		
		player_inputs[0]["connected"] = true
		player_inputs[0]["movement_input"] = Vector2(move_x, move_y).normalized()
		player_inputs[0]["interact_pressed"] = Input.is_action_pressed("ui_accept")
	else:
		# Gamepad inputs
		active_player_count = min(gamepads.size(), max_players)
		for i in range(active_player_count):
			var gamepad = gamepads[i]
			player_inputs[i]["connected"] = true
			
			# Movement (joystick gauche)
			var move_x = Input.get_joy_axis(gamepad, JOY_AXIS_LEFT_X)
			var move_y = Input.get_joy_axis(gamepad, JOY_AXIS_LEFT_Y)
			
			# Appliquer deadzone
			var move_vec = Vector2(move_x, move_y)
			if move_vec.length() < 0.2:
				move_vec = Vector2.ZERO
			
			player_inputs[i]["movement_input"] = move_vec.normalized()
			
			# Look (joystick droit)
			var look_x = Input.get_joy_axis(gamepad, JOY_AXIS_RIGHT_X)
			var look_y = Input.get_joy_axis(gamepad, JOY_AXIS_RIGHT_Y)
			
			# Appliquer deadzone
			var look_vec = Vector2(look_x, look_y)
			if look_vec.length() < 0.2:
				look_vec = Vector2.ZERO
			
			player_inputs[i]["look_input"] = look_vec
			
			# Interact (bouton X / Carré)
			var interact = Input.is_joy_button_pressed(gamepad, JOY_BUTTON_X) or \
						   Input.is_joy_button_pressed(gamepad, JOY_BUTTON_Y)
			player_inputs[i]["interact_pressed"] = interact

func get_player_input(player_index: int) -> Dictionary:
	if player_index >= 0 and player_index < player_inputs.size():
		return player_inputs[player_index]
	return {}

func get_active_player_count() -> int:
	return active_player_count

func is_player_connected(player_index: int) -> bool:
	if player_index >= 0 and player_index < active_player_count:
		return player_inputs[player_index]["connected"]
	return false
