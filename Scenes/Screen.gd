extends Control


var window_scene = preload("res://Scenes/Window.tscn")

@onready var master_bus_idx = AudioServer.get_bus_index("Master")


func _ready() -> void:
	var master_volume_db = AudioServer.get_bus_volume_db(master_bus_idx)
	$Taskbar/SoundVolume.value = db_to_linear(master_volume_db)


func _process(delta: float) -> void:
	pass


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
