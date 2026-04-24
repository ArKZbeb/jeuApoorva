extends Control

# Affiche une image en popup 3D pour les easter eggs

class_name EasterEggImagePopup

@export var auto_hide_duration: float = 3.0
var image_texture: Texture2D
var texture_rect: TextureRect

func _ready():
	# Créer le conteneur
	var panel = PanelContainer.new()
	panel.size = Vector2(400, 300)
	panel.position = Vector2(get_viewport_rect().size.x / 2 - 200, get_viewport_rect().size.y / 2 - 150)
	add_child(panel)
	
	# Ajouter une image
	texture_rect = TextureRect.new()
	texture_rect.size = Vector2(400, 300)
	texture_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	texture_rect.stretch_mode = TextureRect.STRETCH_SCALE
	panel.add_child(texture_rect)
	
	# Positionner et afficher
	show()
	
	# Auto-hide après la durée
	if auto_hide_duration > 0:
		await get_tree().create_timer(auto_hide_duration).timeout
		queue_free()

func set_image(texture: Texture2D) -> void:
	if texture_rect:
		texture_rect.texture = texture

func show_image(texture: Texture2D) -> void:
	set_image(texture)
