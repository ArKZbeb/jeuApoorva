extends Node3D

# Gère les transitions entre les scènes/actes

class_name SceneTransition

var transition_active: bool = false

func _ready():
	pass

func transition_to_scene(scene_name: str, delay: float = 2.0):
	if transition_active:
		return
	
	transition_active = true
	
	# Créer un panel de transition (fondu au noir)
	var transition_panel = Panel.new()
	transition_panel.anchor_left = 0
	transition_panel.anchor_top = 0
	transition_panel.anchor_right = 1
	transition_panel.anchor_bottom = 1
	
	var color_rect = ColorRect.new()
	color_rect.anchor_left = 0
	color_rect.anchor_top = 0
	color_rect.anchor_right = 1
	color_rect.anchor_bottom = 1
	color_rect.color = Color.BLACK
	color_rect.modulate.a = 0
	
	get_tree().root.add_child(color_rect)
	
	# Animer le fondu
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 1.0, delay * 0.5)
	
	await tween.finished
	
	# Charger la nouvelle scène
	get_tree().change_scene_to_file("res://scenes/%s.tscn" % scene_name)
