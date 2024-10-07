extends Control


var window_scene = preload("res://Scenes/Window.tscn")

@onready var master_bus_idx = AudioServer.get_bus_index("Master")

signal window_closed
signal message_accepted


var begin_menu_enabled = false


func _ready() -> void:
	var initial_volume_db = linear_to_db($Taskbar/SoundVolume.value)
	AudioServer.set_bus_volume_db(master_bus_idx, initial_volume_db)


func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$AudioStreamPlayer.play()


func get_random_location() -> Vector2:
	return Vector2(randf_range(0, size.x), randf_range(0, size.y - $Taskbar.size.y))


func spawn_window(window_position: Vector2, title: String, content: Control = null):
	var window = window_scene.instantiate()
	window.set_title(title)
	if content:
		window.set_content(content)
	window.position = window_position
	$Windows.add_child(window)


func get_number_of_windows():
	return $Windows.size
	

func get_dragging_window():
	for window in $Windows.get_children():
		if window.dragging:
			return window


func _on_sound_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(master_bus_idx, linear_to_db(value))
	
	
func set_virus_message(text: String):
	$VirusMessage.set_message(text)
	$VirusMessage.show()
	$VirusMessage.grab_click_focus()


func _on_virus_message_message_accepted() -> void:
	$VirusMessage.hide()
	message_accepted.emit()


func _on_windows_child_exiting_tree(node: Node) -> void:
	window_closed.emit()


func _on_start_button_pressed() -> void:
	if begin_menu_enabled:
		$BeginPanel.show()
		$BeginPanel.grab_focus()


func _on_shutdown_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Ending.tscn")
