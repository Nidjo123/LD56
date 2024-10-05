extends Control

@export var title: String

var drag_possible = false
var dragging = false
var mouse_rel_pos: Vector2 = Vector2.ZERO

func _ready() -> void:
	$Titlebar/Title.text = title


func _process(delta: float) -> void:
	if dragging and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		dragging = false
	
	if drag_possible and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if not dragging:
			mouse_rel_pos = get_viewport().get_mouse_position() - position
			dragging = true
		
	if dragging:
		position = get_viewport().get_mouse_position() - mouse_rel_pos
		


func _on_close_button_pressed() -> void:
	get_parent().remove_child(self)
	queue_free()


func _on_titlebar_mouse_entered() -> void:
	drag_possible = true


func _on_titlebar_mouse_exited() -> void:
	drag_possible = false
