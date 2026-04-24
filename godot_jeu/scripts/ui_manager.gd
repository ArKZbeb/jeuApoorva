extends CanvasLayer

# Gère tous les éléments UI: popups, notifications, feedback

class_name UIManager

@onready var notification_label: Label = $NotificationLabel
@onready var feedback_label: Label = $FeedbackLabel
@onready var enigma_panel: PanelContainer = $EnigmaPanel
@onready var enigma_question_label: Label = $EnigmaPanel/VBoxContainer/QuestionLabel
@onready var enigma_answer_input: LineEdit = $EnigmaPanel/VBoxContainer/AnswerInput
@onready var submit_button: Button = $EnigmaPanel/VBoxContainer/SubmitButton

var current_enigma: Dictionary = {}
var feedback_duration: float = 3.0

func _ready():
	if notification_label == null:
		push_warning("[UIManager] Notification label not assigned")
	
	hide_all_panels()
	
	# Connecter le bouton Submit
	if submit_button:
		submit_button.pressed.connect(_on_submit_button_pressed)

func show_notification(message: String):
	if notification_label != null:
		notification_label.text = message
		notification_label.show()
		await get_tree().create_timer(2.0).timeout
		notification_label.hide()

func show_enigma_prompt(enigma: Dictionary):
	current_enigma = enigma
	if enigma_panel != null and enigma_question_label != null:
		enigma_question_label.text = enigma.get("question", "Question?")
		enigma_panel.show()
		if enigma_answer_input:
			enigma_answer_input.grab_focus()

func _on_submit_button_pressed():
	if current_enigma.is_empty():
		return
	
	var answer = enigma_answer_input.text if enigma_answer_input else ""
	
	# Chercher GameManager dans la scène parente
	var game_manager = get_parent().get_node_or_null("GameManager")
	if game_manager == null:
		game_manager = get_tree().root.get_node_or_null("SalleAventures/GameManager")
	if game_manager == null:
		game_manager = get_tree().root.get_node_or_null("Bureau/GameManager")
	
	if game_manager:
		game_manager.submit_enigma_answer(current_enigma["id"], answer)
		print("[UIManager] Answer submitted for enigma %d" % current_enigma["id"])
	else:
		push_error("[UIManager] GameManager not found!")
	
	hide_enigma_panel()

func click_enigma_answer(enigma_id: int):
	var game_manager = get_parent().get_node_or_null("GameManager")
	if game_manager == null:
		game_manager = get_tree().root.get_node_or_null("SalleAventures/GameManager")
	
	if game_manager:
		game_manager.click_enigma_answer(enigma_id)
	hide_enigma_panel()

func show_feedback(message: String, is_correct: bool):
	if feedback_label != null:
		feedback_label.text = message
		feedback_label.add_theme_color_override("font_color", Color.GREEN if is_correct else Color.RED)
		feedback_label.show()
		await get_tree().create_timer(feedback_duration).timeout
		feedback_label.hide()

func hide_enigma_panel():
	if enigma_panel != null:
		enigma_panel.hide()
		if enigma_answer_input != null:
			enigma_answer_input.text = ""

func hide_all_panels():
	if enigma_panel != null:
		enigma_panel.hide()
	if feedback_label != null:
		feedback_label.hide()
	if notification_label != null:
		notification_label.hide()
