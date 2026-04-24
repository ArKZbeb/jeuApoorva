extends Node

# Gère la progression du jeu, les énigmes et la narration

class_name GameManager

@export var enigmes_json_file: String = "res://assets/data/enigmes.json"
var enigma_list: Array = []
var solved_enigmas: Dictionary = {}
var current_scene: String = ""
var total_enigmas: int = 0

func _ready():
	load_enigmas()
	initialize_scene()

func load_enigmas():
	var file = FileAccess.open(enigmes_json_file, FileAccess.READ)
	if file == null:
		push_error("[GameManager] Enigmes JSON not found at: %s" % enigmes_json_file)
		return
	
	var content = file.get_as_text()
	var json = JSON.new()
	var error = json.parse(content)
	
	if error != OK:
		push_error("[GameManager] JSON parse error: %s" % json.get_error_message())
		return
	
	var data = json.data
	if data.has("enigmes"):
		enigma_list = data["enigmes"]
		total_enigmas = enigma_list.size()
		
		# Initialiser toutes les énigmes comme non-résolues
		for enigma in enigma_list:
			solved_enigmas[enigma["id"]] = false
		
		print("[GameManager] Loaded %d enigmas" % total_enigmas)
	else:
		push_error("[GameManager] No enigmes array in JSON")

func initialize_scene():
	current_scene = get_tree().current_scene.name
	print("[GameManager] Scene %s initialized" % current_scene)

func on_enigma_object_interacted(enigma_id: int, object_id: String):
	if enigma_id < 0:
		return
	
	# Chercher l'énigme
	var enigma = null
	for e in enigma_list:
		if e["id"] == enigma_id:
			enigma = e
			break
	
	if enigma != null:
		print("[GameManager] Enigma %d interacted: %s" % [enigma_id, enigma["question"]])
		var ui_manager = get_tree().root.get_node("UIManager")
		if ui_manager:
			ui_manager.show_enigma_prompt(enigma)

func submit_enigma_answer(enigma_id: int, answer: String):
	var enigma = null
	for e in enigma_list:
		if e["id"] == enigma_id:
			enigma = e
			break
	
	if enigma == null:
		return
	
	# Normaliser les réponses pour comparaison
	var normalized_answer = answer.to_lower().replace(" ", "")
	var normalized_correct = enigma["reponse"].to_lower().replace(" ", "")
	
	# Vérifier les easter eggs
	var is_easter_egg = false
	
	# Easter egg 1: "meme"
	if normalized_answer == "meme":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("👑 MEME QUEEN FOR LIFE! Merci d'avoir joué! 👑", true)
			trigger_easter_egg_image("res://assets/images/unnamed.jpg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'meme' triggered!")
		return
	
	# Easter egg 2: "apoorva"
	if normalized_answer == "apoorva":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🌟 C'est elle! Apoorva est une REINE! 🌟", true)
			trigger_easter_egg_image("res://assets/images/photoMariage.png")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'apoorva' triggered!")
		return
	
	# Easter egg 3: "merci"
	if normalized_answer == "merci":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("💙 De rien! Merci à toi aussi Apoorva! 💙", true)
			trigger_easter_egg_image("res://assets/images/IMG_0343.jpeg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'merci' triggered!")
		return
	
	# Easter egg 4: "team"
	if normalized_answer == "team":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("👥 C'est ça! L'équipe c'est super avec toi! 👥", true)
			trigger_easter_egg_image("res://assets/images/IMG_0348.jpeg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'team' triggered!")
		return
	
	# Easter egg 5: "help"
	if normalized_answer == "help":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("📖 L'indice est là! Regarde bien! 📖", true)
			trigger_easter_egg_image("res://assets/images/IMG_0557.jpeg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'help' triggered!")
		return
	
	# Easter egg 6: "godot"
	if normalized_answer == "godot":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎮 Oui! Ce jeu est créé en Godot 4.6! 🎮", true)
			trigger_easter_egg_image("res://assets/images/IMG_6271.jpeg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'godot' triggered!")
		return
	
	# Easter egg 7: "amour"
	if normalized_answer == "amour":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("💕 Amour et aventure! Le jeu parfait! 💕", true)
			trigger_easter_egg_image("res://assets/images/20250925_134343.jpg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'amour' triggered!")
		return
	
	# Easter egg 8: "jeu"
	if normalized_answer == "jeu":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🎮 Merci de jouer à ce jeu spécial! 🎮", true)
			trigger_easter_egg_image("res://assets/images/IMG_7089.jpeg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'jeu' triggered!")
		return
	
	# Easter egg 9: "photo"
	if normalized_answer == "photo":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("📸 Des souvenirs magnifiques! 📸", true)
			trigger_easter_egg_image("res://assets/images/IMG_7093.jpeg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'photo' triggered!")
		return
	
	# Easter egg 10: "souvenir"
	if normalized_answer == "souvenir":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("✨ Un beau souvenir! ✨", true)
			trigger_easter_egg_image("res://assets/images/IMG_7194.JPG")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'souvenir' triggered!")
		return
	
	# Easter egg 11: "aventure"
	if normalized_answer == "aventure":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("🗺️ L'aventure commence! 🗺️", true)
			trigger_easter_egg_image("res://assets/images/20250925_134412.jpg")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'aventure' triggered!")
		return
	
	# Easter egg 12: "mariage"
	if normalized_answer == "mariage":
		is_easter_egg = true
		solved_enigmas[enigma_id] = true
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("💍 Un jour spécial! 💍", true)
			trigger_easter_egg_image("res://assets/images/photoMariage.png")
		check_all_enigmas_solved()
		print("[GameManager] Easter egg 'mariage' triggered!")
		return
	
	var is_correct = normalized_answer == normalized_correct
	
	if is_correct:
		solved_enigmas[enigma_id] = true
		# Chercher UIManager dans la scène actuelle
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("✅ " + enigma["feedback"], true)
		check_all_enigmas_solved()
		print("[GameManager] Enigma %d solved! (%d/%d)" % [enigma_id, get_solved_enigma_count(), total_enigmas])
	else:
		var ui_manager = get_parent().get_node_or_null("UIManager")
		if ui_manager:
			ui_manager.show_feedback("❌ Incorrect! Indice: %s" % enigma["indice"], false)
		print("[GameManager] Enigma %d wrong answer" % enigma_id)

func click_enigma_answer(enigma_id: int):
	solved_enigmas[enigma_id] = true
	
	var enigma = null
	for e in enigma_list:
		if e["id"] == enigma_id:
			enigma = e
			break
	
	if enigma != null:
		var ui_manager = get_tree().root.get_node("UIManager")
		if ui_manager:
			ui_manager.show_feedback(enigma["feedback"], true)
	
	check_all_enigmas_solved()
	print("[GameManager] Enigma %d clicked/solved!" % enigma_id)

func check_all_enigmas_solved():
	for solved in solved_enigmas.values():
		if not solved:
			return
	
	print("[GameManager] All enigmas solved!")
	var ui_manager = get_tree().root.get_node("UIManager")
	if ui_manager:
		ui_manager.show_notification("Toutes les énigmes résolues! Progression...")

func is_enigma_solved(enigma_id: int) -> bool:
	return solved_enigmas.get(enigma_id, false)

func get_solved_enigma_count() -> int:
	var count = 0
	for solved in solved_enigmas.values():
		if solved:
			count += 1
	return count

func load_scene(scene_name: String):
	get_tree().change_scene_to_file("res://scenes/%s.tscn" % scene_name)

func trigger_easter_egg_image(image_path: String):
	# Créer une popup pour afficher l'image de l'easter egg
	var popup = Control.new()
	popup.name = "EasterEggImagePopup"
	popup.custom_minimum_size = Vector2(400, 300)
	
	# Conteneur avec background semi-transparent
	var bg = Panel.new()
	bg.custom_minimum_size = Vector2(400, 300)
	var style_box = StyleBox.new()
	bg.add_theme_stylebox_override("panel", style_box)
	popup.add_child(bg)
	
	# TextureRect pour afficher l'image
	var texture_rect = TextureRect.new()
	texture_rect.texture = load(image_path)
	texture_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture_rect.custom_minimum_size = Vector2(400, 300)
	popup.add_child(texture_rect)
	
	# Centrer la popup
	popup.anchor_left = 0.5
	popup.anchor_top = 0.5
	popup.anchor_right = 0.5
	popup.anchor_bottom = 0.5
	popup.offset_left = -200
	popup.offset_top = -150
	popup.z_index = 1000
	
	# Ajouter à la scène
	get_tree().root.add_child(popup)
	
	# Attendre 3 secondes puis supprimer
	await get_tree().create_timer(3.0).timeout
	popup.queue_free()
