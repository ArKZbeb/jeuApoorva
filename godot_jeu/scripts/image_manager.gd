extends Node

# Gère l'affichage des images du dossier Images/ dans les cadres

class_name ImageManager

var images: Array[String] = []
var current_image_index: int = 0

func _ready():
	# Charger toutes les images disponibles
	load_images_from_folder()
	print("[ImageManager] Loaded %d images" % images.size())

# Charger toutes les images du dossier Images/
func load_images_from_folder() -> void:
	var dir = DirAccess.open("res://assets/images/")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			# Charger les images mais pas les fichiers .import
			if not file_name.ends_with(".import"):
				if file_name.ends_with(".jpg") or file_name.ends_with(".jpeg") or file_name.ends_with(".png") or file_name.ends_with(".JPG"):
					var full_path = "res://assets/images/" + file_name
					images.append(full_path)
					print("[ImageManager] Added image: %s" % file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		push_error("[ImageManager] Could not open res://assets/images/ folder")

# Obtenir une image aléatoire
func get_random_image() -> String:
	if images.size() == 0:
		return ""
	var random_index = randi() % images.size()
	return images[random_index]

# Obtenir la prochaine image (cycle)
func get_next_image() -> String:
	if images.size() == 0:
		return ""
	current_image_index = (current_image_index + 1) % images.size()
	return images[current_image_index]

# Obtenir toutes les images
func get_all_images() -> Array[String]:
	return images

# Obtenir le nombre d'images
func get_image_count() -> int:
	return images.size()

# Obtenir une image par index
func get_image_at_index(index: int) -> String:
	if index >= 0 and index < images.size():
		return images[index]
	return ""
