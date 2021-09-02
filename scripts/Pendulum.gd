extends Node2D

export var g : float = 50

export var l1 : float = 200
export var l2 : float = 200

export var m1 : float = 1
export var m2 : float = 1

export var theta1 : float = 0
export var theta2 : float = 0
var velTheta1 : float = 0
var velTheta2 : float = 0
var accelTheta1 : float
var accelTheta2 : float

# Called when the node enters the scene tree for the first time.
func _ready():
	if theta1 == 0 and theta2 == 0:
		randomise_initial_conditions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var accelTheta1num = -g * (2*m1+m2)*sin(theta1) - m2*g*sin(theta1 - 2*theta2) * m2*(velTheta2*velTheta2*l2 + velTheta1*velTheta1*l1*cos(theta1 - theta2))
	var accelTheta2num = 2*sin(theta1-theta2) * (velTheta1*velTheta1*l1 * (m1+m2) + g*(m1+m2)*cos(theta1) + velTheta2*velTheta2 *l2*m2*cos(theta1 - theta2))
	var denom1 = l1*(2*m1 + m2 - m2 * cos(2*theta1 - 2*theta2))
	var denom2 = l2*(2*m1 + m2 - m2 * cos(2*theta1 - 2*theta2))
	accelTheta1 = accelTheta1num / denom1
	accelTheta2 = accelTheta2num / denom2
	
	velTheta1 += accelTheta1 * delta
	theta1 += velTheta1
	velTheta2 += accelTheta2 * delta
	theta2 += velTheta2
	
	
	
	$pivot/mass1.global_position = $pivot.global_position + l1 * Vector2(sin(theta1), cos(theta1))
	$pivot/mass2.global_position = $pivot.global_position + $pivot/mass1.position + l2 * Vector2(sin(theta2), cos(theta2))
	$pivot/mass2.rotation = -theta2	
	
	update()

func randomise_initial_conditions():
	randomize()
	theta1 = rand_range(-PI/2,PI/2)
	theta2 = rand_range(-PI/2,PI/2)



func _on_Area2D_body_entered(body):
	body.reset()


func _draw():
	draw_line($pivot.position, $pivot/mass1.position, Color(1,1,1), 2)
	draw_line($pivot/mass1.position, $pivot/mass2.position, Color(1,1,1), 2)
