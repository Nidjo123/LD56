extends Control


@export_multiline var virus_message: String
@export var number_of_bugs = 20

var bug_scene = preload("res://Scenes/Bug.tscn")
var projectile_scene = preload("res://Scenes/Projectile.tscn")

var can_shoot = true
var started = false

func _ready() -> void:
	$Screen.set_virus_message(virus_message)


func _on_bug_arrived_at_point(bug):
	bug.set_next_point($Screen.get_random_location())


func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot") and can_shoot:
		var projectile = projectile_scene.instantiate()
		var spaceship = $Screen/SpaceShip
		projectile.position = spaceship.position
		projectile.rotation   = spaceship.rotation
		projectile.direction = Vector2.from_angle(spaceship.rotation + PI / 2)
		$Screen/Projectiles.add_child(projectile)
		can_shoot = false
		$ShootTimeout.start()
		
	if started and $Bugs.get_child_count() == 0:
		get_tree().change_scene_to_file("res://Scenes/Level3.tscn")


func _on_screen_message_accepted() -> void:
	for i in range(number_of_bugs):
		var bug = bug_scene.instantiate()
		bug.position = $Screen.get_random_location()
		bug.set_next_point($Screen.get_random_location())
		bug.connect("arrived_at_point", _on_bug_arrived_at_point)
		$Bugs.add_child(bug)
	started = true


func _on_shoot_timeout_timeout() -> void:
	can_shoot = true
