extends Node2D


export var l : float = 400
export var m : float = 1
export var theta : float = PI/2
export var g : float = 50

var velTheta : float
var accelTheta : float

# Called when the node enters the scene tree for the first time.
func _ready():
	if theta == 0:
		randomize()
		theta = rand_range(-PI/2, PI/2)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	update()
	accelTheta = -g/l * sin(theta)
	velTheta += accelTheta * delta
	theta += velTheta

	$mass.global_position = $pivot.global_position + l * Vector2(sin(theta), cos(theta))


func _on_Area2D_body_entered(body):
	body.reset()
	
func _draw():
	draw_line($pivot.position, $mass.position, Color(1,1,1), 2)
