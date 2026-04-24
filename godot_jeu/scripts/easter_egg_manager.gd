extends Node

# Gère les easter eggs du jeu

class_name EasterEggManager

var jump_count: int = 0
var jump_threshold: int = 10
var secret_unlocked: bool = false

func _ready():
	print("[EasterEggManager] Easter eggs system active")

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

func trigger_meme_egg():
	print("[EasterEgg] MEME EGG TRIGGERED! 😂")
	return "MEME QUEEN FOR LIFE! 👑"
