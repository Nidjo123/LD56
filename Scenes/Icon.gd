extends Control

@export var text: String
@export var normal_texture: Texture2D
@export var focused_texture: Texture2D


func _ready() -> void:
	$Image/Label.text = text
	if normal_texture:
		$Image.texture_normal = normal_texture
	if focused_texture:
		$Image.texture_focused = focused_texture


func _process(delta: float) -> void:
	pass


func _on_image_focus_entered() -> void:
	$FocusedBackground.visible = true


func _on_image_focus_exited() -> void:
	$FocusedBackground.visible = false
