extends RigidBody2D


@export var rotation_speed = 3000
@export var motion_speed = 300


func _ready() -> void:
	pass


func forward_vector() -> Vector2:
	return Vector2.from_angle(rotation + PI / 2)


func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction += forward_vector()
	if Input.is_action_pressed("down"):
		direction -= forward_vector()
	
	constant_force = direction * motion_speed * delta
	constant_torque = Input.get_axis("left", "right") * rotation_speed * delta
