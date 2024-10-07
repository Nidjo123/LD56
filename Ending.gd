extends Control


@export_multiline var end_text: String


func _ready() -> void:
	$VirusMessage.set_message(end_text)


func _process(delta: float) -> void:
	pass


func _on_virus_message_message_accepted() -> void:
	get_tree().quit()
