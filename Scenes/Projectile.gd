extends RigidBody2D


var direction: Vector2
var speed: int = 500


func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 16


func _physics_process(delta: float) -> void:
	move_and_collide(direction * speed * delta)


func on_collision():
	get_parent().remove_child(self)
	queue_free()
