extends Control


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_window_spawn_timer_timeout() -> void:
	var screen = $Screen
	screen.spawn_window(screen.get_random_location())
