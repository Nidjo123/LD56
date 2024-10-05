extends Control


var window_scene = preload("res://Scenes/Window.tscn")


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func get_random_location() -> Vector2:
	return Vector2(randf_range(0, size.x), randf_range(0, size.y))


func spawn_window(window_position: Vector2):
	var window = window_scene.instantiate()
	window.position = window_position
	$Windows.add_child(window)
