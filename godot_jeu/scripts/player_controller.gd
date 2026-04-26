extends CharacterBody3D

# Contrôle le mouvement et la caméra d'un joueur FPS

class_name PlayerController

@export var move_speed: float = 5.0
@export var mouse_sensitivity: float = 2.0
@export var max_look_angle: float = 90.0
@export var gravity: float = 9.8
@export var jump_force: float = 5.0

var player_index: int = 0
var x_rotation: float = 0.0
var camera_3d: Camera3D
var is_jumping: bool = false

func _ready():
	add_to_group("player")
	
	camera_3d = $Camera3D
	if camera_3d == null:
		push_error("[PlayerController] Camera3D not found!")
		return
	
	# Capture la souris pour un contrôle FPS fluide
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	print("[PlayerController] Player ready - mouse captured for FPS controls")

func _physics_process(delta):
	# Clavier directement
	var move_x = 0.0
	var move_y = 0.0
	
	if Input.is_key_pressed(KEY_Z) or Input.is_action_pressed("ui_up"):
		move_y -= 1.0
	if Input.is_key_pressed(KEY_S) or Input.is_action_pressed("ui_down"):
		move_y += 1.0
	if Input.is_key_pressed(KEY_Q) or Input.is_action_pressed("ui_left"):
		move_x -= 1.0
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		move_x += 1.0
	
	var input_direction = Vector2(move_x, move_y).normalized()
	
	# Convertir en direction du monde
	var move_dir = Vector3.ZERO
	if input_direction.length() > 0.1:
		move_dir = (transform.basis * Vector3(input_direction.x, 0, input_direction.y)).normalized()
	
	velocity.x = move_dir.x * move_speed
	velocity.z = move_dir.z * move_speed
	
	# Gestion du saut
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = jump_force
		is_jumping = true
	
	# Appliquer la gravité
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		is_jumping = false
	
	move_and_slide()

func _input(event: InputEvent):
	# Gestion de la souris pour regarder (toujours actif en mode FPS)
	if event is InputEventMouseMotion:
		var motion = event as InputEventMouseMotion
		var look_x = motion.relative.x * mouse_sensitivity * 0.01
		var look_y = motion.relative.y * mouse_sensitivity * 0.01
		
		# Rotation horizontale (Y axis)
		rotate_y(-look_x)
		
		# Rotation verticale (X axis) - limitée pour regarder up/down
		x_rotation -= look_y
		x_rotation = clamp(x_rotation, -max_look_angle, max_look_angle)
		camera_3d.rotation.x = deg_to_rad(x_rotation)
	
	# Appuyer sur Échap pour relâcher la souris
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func initialize(index: int):
	player_index = index
	print("[PlayerController] Initialized with index %d" % index)

func get_player_index() -> int:
	return player_index

func get_camera() -> Camera3D:
	return camera_3d
