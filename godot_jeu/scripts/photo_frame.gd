extends Node3D

# Gère l'affichage des photos en cadres

class_name PhotoFrame

@export var photo_path: String = ""
@export var frame_size: Vector2 = Vector2(2, 1.5)

var texture: Texture2D
var mesh_instance: MeshInstance3D

func _ready():
	load_photo()
	if texture:
		setup_frame()

func load_photo():
	if photo_path.is_empty():
		push_warning("[PhotoFrame] No photo path specified")
		return
	
	texture = load(photo_path)
	if texture == null:
		push_error("[PhotoFrame] Failed to load photo at: %s" % photo_path)

func setup_frame():
	# Créer un plan avec la texture de la photo
	var plane_mesh = PlaneMesh.new()
	plane_mesh.size = frame_size
	
	mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = plane_mesh
	add_child(mesh_instance)
	
	# Créer un matériau avec la texture
	var material = StandardMaterial3D.new()
	material.albedo_texture = texture
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	
	mesh_instance.set_surface_override_material(0, material)
	print("[PhotoFrame] Photo loaded: %s" % photo_path)
