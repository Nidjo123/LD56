extends Control


@export_multiline var initial_message: String
@export var windows_to_close: int
@export var popup_textures: Array[Texture2D]
@export var popup_titles: Array[String]

var windows_spawned = 0
var windows_closed = 0


func _ready() -> void:
	assert(popup_textures.size() == popup_titles.size())
	AudioPlayer.get_music_player().play()
	$Screen.set_virus_message(initial_message)


func _process(delta: float) -> void:
	if windows_closed > windows_to_close:
		get_tree().change_scene_to_file("res://Scenes/Level2.tscn")


func _on_window_spawn_timer_timeout() -> void:
	if windows_spawned > windows_to_close:
		$WindowSpawnTimer.stop()
		return
	var screen = $Screen
	var window_location = screen.get_random_location()
	window_location = clamp(window_location, Vector2(0, 0), $Screen.size - Vector2(256, 256))
	var content = TextureRect.new()
	var idx = randi_range(0, popup_textures.size() - 1)
	content.texture = popup_textures[idx]
	screen.spawn_window(window_location, popup_titles[idx], content)
	windows_spawned += 1


func _on_screen_window_closed() -> void:
	windows_closed += 1
