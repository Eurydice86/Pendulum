extends KinematicBody2D

export var gravity = 1000.0
export var speed = Vector2(500.0, 1000.0)
var velocity = Vector2.ZERO
var spawnPoint = Vector2(16,992)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	var direction := get_direction()
	velocity = calculate_move_velocity(velocity, speed, direction)
	
	velocity = move_and_slide(velocity, Vector2.UP)

func get_direction() -> Vector2:
	var dirY
	if Input.is_action_just_pressed("jump") and is_on_floor():
		dirY = -1.0
	else:
		dirY = 1.0
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		dirY
	)

func calculate_move_velocity(
	linear_velocity: Vector2,
	linear_speed: Vector2,
	direction: Vector2
) -> Vector2:
	var new_velocity := linear_velocity
	new_velocity.x = linear_speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = linear_speed.y * direction.y
		$jumpSound.play(0.02)
	return new_velocity


func reset():
	$hitSound.play()
	global_position = spawnPoint
	velocity = Vector2(0,0)

func setSpawnPoint(checkpoint: Vector2):
	spawnPoint = checkpoint
