extends RigidBody2D

signal arrived_at_point

@export var speed = 100

@export var next_point: Vector2


func _ready() -> void:
	# to update rotation
	set_next_point(next_point)
	contact_monitor = true
	max_contacts_reported = 16


func _process(delta: float) -> void:
	if (position - next_point).length() <= 1:
		arrived_at_point.emit(self)


func _physics_process(delta: float) -> void:
	var direction = (next_point - position).normalized()
	move_and_collide(direction * speed * delta)


func set_next_point(point: Vector2):
	next_point = point
	rotation = position.angle_to_point(next_point) + PI / 2


func _on_death():
	get_parent().remove_child(self)
	queue_free()


func _on_body_entered(body: Node) -> void:
	$AnimatedSprite2D.play("death")
	var death_timer = get_tree().create_timer(1)
	death_timer.connect("timeout", _on_death)
	body.on_collision()
