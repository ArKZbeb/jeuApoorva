extends Control

# Menu principal du jeu

func _ready():
	$VBoxContainer/StartButton.pressed.connect(_on_start_button_pressed)
	$VBoxContainer/ExitButton.pressed.connect(_on_exit_button_pressed)

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/bureau.tscn")

func _on_exit_button_pressed():
	get_tree().quit()
