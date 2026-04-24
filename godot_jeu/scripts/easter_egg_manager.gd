extends Node

# Gère les easter eggs du jeu

class_name EasterEggManager

var jump_count: int = 0
var jump_threshold: int = 10
var secret_unlocked: bool = false
var image_manager: ImageManager
var displayed_images: Array[String] = []  # Tracker les images déjà affichées

func _ready():
	print("[EasterEggManager] Easter eggs system active")
	
	# Obtenir ou créer l'ImageManager
	image_manager = get_tree().root.get_child(0).find_child("ImageManager", true, false)
	if not image_manager:
		image_manager = ImageManager.new()
		add_child(image_manager)

func _input(event: InputEvent):
	# Sauter avec ESPACE
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		check_jump_sequence()

func check_jump_sequence():
	jump_count += 1
	if jump_count == 1:
		print("[EasterEgg] Jump 1/%d" % jump_threshold)
	elif jump_count % 5 == 0:
		print("[EasterEgg] Jump %d/%d - Continue!" % [jump_count, jump_threshold])
	
	if jump_count >= jump_threshold:
		unlock_secret()
		jump_count = 0

func unlock_secret():
	if not secret_unlocked:
		secret_unlocked = true
		print("[EasterEgg] 🎉 SECRET UNLOCKED! Type 'meme' for surprise!")
		# Afficher une notification
		var ui_managers = get_tree().get_nodes_in_group("ui_manager")
		for ui in ui_managers:
			if ui.has_method("show_notification"):
				ui.show_notification("🎉 EASTER EGG UNLOCKED! Tape 'meme' sur une énigme!")

func trigger_meme_egg() -> String:
	print("[EasterEgg] MEME EGG TRIGGERED! 😂")
	# Afficher une image aléatoire comme easter egg
	show_easter_egg_image()
	return "MEME QUEEN FOR LIFE! 👑"

# Afficher une image comme easter egg dans les cadres
func show_easter_egg_image() -> void:
	if image_manager and image_manager.get_image_count() > 0:
		var random_image = image_manager.get_random_image()
		
		# Éviter de montrer la même image plusieurs fois
		if random_image in displayed_images and image_manager.get_image_count() > 1:
			random_image = image_manager.get_next_image()
		
		displayed_images.append(random_image)
		
		# Trouver tous les cadres photo et les mettre à jour
		var photo_frames = get_tree().get_nodes_in_group("photo_frames")
		if photo_frames.size() > 0:
			print("[EasterEgg] Showing image in %d frames: %s" % [photo_frames.size(), random_image])
			for frame in photo_frames:
				if frame.has_method("next_image"):
					frame.next_image()
		else:
			print("[EasterEgg] No photo frames found, creating display")
			show_image_popup(random_image)

# Afficher une popup avec l'image
func show_image_popup(image_path: String) -> void:
	if not image_path:
		return
	
	var image_texture = load(image_path)
	if image_texture:
		print("[EasterEgg] Showing image popup: %s" % image_path)
		# Signal aux UI managers
		var ui_managers = get_tree().get_nodes_in_group("ui_manager")
		for ui in ui_managers:
			if ui.has_method("show_image_popup"):
				ui.show_image_popup(image_texture)

# Obtenir toutes les images pour les easter eggs
func get_all_easter_egg_images() -> Array[String]:
	if image_manager:
		return image_manager.get_all_images()
	return []

