extends CharacterBody3D

# Contrôle le mouvement et la caméra d'un joueur FPS

class_name PlayerController

@export var move_speed: float = 5.0
@export var mouse_sensitivity: float = 2.0
@export var max_look_angle: float = 90.0
@export var gravity: float = 9.8

var player_index: int = 0
var x_rotation: float = 0.0
var camera_3d: Camera3D

func _ready():
	add_to_group("player")
	
	camera_3d = $Camera3D
	if camera_3d == null:
		push_error("[PlayerController] Camera3D not found!")
		return
	
	print("[PlayerController] Player ready")

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
	velocity.y -= gravity * delta
	
	move_and_slide()

func _input(event: InputEvent):
	# Gestion de la souris pour regarder
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		var motion = event as InputEventMouseMotion
		var look_x = motion.relative.x * mouse_sensitivity * 0.01
		var look_y = motion.relative.y * mouse_sensitivity * 0.01
		
		rotate_y(-look_x)
		x_rotation -= look_y
		x_rotation = clamp(x_rotation, -max_look_angle, max_look_angle)
		camera_3d.rotation.x = deg_to_rad(x_rotation)

func initialize(index: int):
	player_index = index
	print("[PlayerController] Initialized with index %d" % index)

func get_player_index() -> int:
	return player_index

func get_camera() -> Camera3D:
	return camera_3d
