extends Node

# Gestionnaire de cheat codes pour tester rapidement
# Raccourcis:
# F1 = Aller à Bureau
# F2 = Aller à Salle d'Aventures
# F3 = Aller à Mur des Messages
# F4 = Menu Principal
# CTRL+N = Passer à la scène suivante

class_name CheatManager

@export var enable_cheats: bool = true

func _ready():
	if enable_cheats:
		print("[CheatManager] Cheats activés!")
		print("  F1 = Bureau")
		print("  F2 = Salle d'Aventures")
		print("  F3 = Mur des Messages")
		print("  F4 = Menu Principal")
		print("  CTRL+N = Passer à la prochaine scène")

func _input(event: InputEvent):
	if not enable_cheats:
		return
	
	if event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_F1:
				print("[CheatManager] Téléportation vers Bureau...")
				get_tree().change_scene_to_file("res://scenes/bureau.tscn")
				get_tree().root.get_child(0).queue_free()
			
			KEY_F2:
				print("[CheatManager] Téléportation vers Salle d'Aventures...")
				get_tree().change_scene_to_file("res://scenes/salle_aventures.tscn")
				get_tree().root.get_child(0).queue_free()
			
			KEY_F3:
				print("[CheatManager] Téléportation vers Mur des Messages...")
				get_tree().change_scene_to_file("res://scenes/mur_messages.tscn")
				get_tree().root.get_child(0).queue_free()
			
			KEY_F4:
				print("[CheatManager] Retour au Menu...")
				get_tree().change_scene_to_file("res://scenes/menu.tscn")
				get_tree().root.get_child(0).queue_free()
		
		# CTRL+N pour passer à la scène suivante
		if event.keycode == KEY_N and event.ctrl_pressed:
			print("[CheatManager] Passage à la scène suivante...")
			var current_scene = get_tree().current_scene.name
			match current_scene:
				"Bureau":
					get_tree().change_scene_to_file("res://scenes/salle_aventures.tscn")
				"SalleAventures":
					get_tree().change_scene_to_file("res://scenes/mur_messages.tscn")
				"MurMessages":
					get_tree().change_scene_to_file("res://scenes/menu.tscn")
				_:
					print("[CheatManager] Scène inconnue: %s" % current_scene)
