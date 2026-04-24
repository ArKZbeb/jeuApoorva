extends Node3D

# Gère l'affichage des photos en cadres

class_name PhotoFrame

@export var photo_path: String = ""
@export var frame_size: Vector2 = Vector2(2, 1.5)
@export var use_random_image: bool = true  # Afficher une image aléatoire du dossier Images/

var texture: Texture2D
var mesh_instance: MeshInstance3D
var image_manager: ImageManager

func _ready():
	# Obtenir ou créer l'ImageManager
	image_manager = get_tree().root.get_child(0).find_child("ImageManager", true, false)
	if not image_manager:
		image_manager = ImageManager.new()
		add_child(image_manager)
	
	# Si use_random_image est activé, charger une image aléatoire
	if use_random_image:
		var random_image = image_manager.get_random_image()
		if random_image:
			photo_path = random_image
	
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

# Cycler vers l'image suivante (pour interaction)
func next_image() -> void:
	if image_manager:
		var next_photo = image_manager.get_next_image()
		if next_photo:
			photo_path = next_photo
			load_photo()
			if mesh_instance and texture:
				var material = mesh_instance.get_active_material(0).duplicate()
				if material is StandardMaterial3D:
					material.albedo_texture = texture
					mesh_instance.set_surface_override_material(0, material)
				print("[PhotoFrame] Showing next image: %s" % photo_path)
