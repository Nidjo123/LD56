extends Control


@export var popup_textures: Array[Texture2D]
@export var popup_titles: Array[String]


func _ready() -> void:
	assert(popup_textures.size() == popup_titles.size())


func _process(delta: float) -> void:
	pass


func _on_window_spawn_timer_timeout() -> void:
	var screen = $Screen
	var window_location = screen.get_random_location()
	window_location = clamp(window_location, Vector2(0, 0), $Screen.size - Vector2(64, 64))
	var content = TextureRect.new()
	var idx = randi_range(0, popup_textures.size() - 1)
	content.texture = popup_textures[idx]
	screen.spawn_window(window_location, popup_titles[idx], content)
