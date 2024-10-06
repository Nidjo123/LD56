extends Control


signal message_accepted


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func set_message(text: String):
	$Panel/MarginContainer/VBoxContainer/Message.text = text


func _on_button_pressed() -> void:
	message_accepted.emit()
