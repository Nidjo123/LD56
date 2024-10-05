extends Node2D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	var progress = 1 - $BootTimer.time_left / $BootTimer.wait_time
	$Control/ProgressBar.value = progress


func _on_boot_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
