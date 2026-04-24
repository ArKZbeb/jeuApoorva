extends Node

# Parse le fichier JSON des messages et les rend disponibles

class_name MessageParser

@export var messages_json_file: String = "res://assets/data/message.json"
var message_list: Array = []

func _ready():
	load_messages()

func load_messages():
	var file = FileAccess.open(messages_json_file, FileAccess.READ)
	if file == null:
		push_error("[MessageParser] Messages JSON not found at: %s" % messages_json_file)
		return
	
	var content = file.get_as_text()
	var json = JSON.new()
	var error = json.parse(content)
	
	if error != OK:
		push_error("[MessageParser] JSON parse error: %s" % json.get_error_message())
		return
	
	var data = json.data
	if data.has("messages"):
		message_list = data["messages"]
		print("[MessageParser] Loaded %d messages" % message_list.size())
	else:
		push_error("[MessageParser] No messages array in JSON")

func get_all_messages() -> Array:
	return message_list

func display_messages_on_wall():
	if message_list.is_empty():
		return
	
	print("[MessageParser] Displaying messages on wall:")
	for msg in message_list:
		print("  [%s] %s" % [msg.get("auteur", "Unknown"), msg.get("texte", "")])

func get_formatted_messages() -> String:
	var formatted = ""
	for msg in message_list:
		formatted += "[%s]\n%s\n\n" % [msg.get("auteur", "Unknown"), msg.get("texte", "")]
	return formatted
