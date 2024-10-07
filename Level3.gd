extends Control


@export_multiline var virus_message: String


func _ready() -> void:
	$Screen.set_virus_message(virus_message)


func _process(delta: float) -> void:
	pass


func _on_screen_message_accepted() -> void:
	$Screen.begin_menu_enabled = true
