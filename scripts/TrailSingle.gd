extends Line2D


var point
var pointsArray = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	point = get_parent().get_node("mass").position
	pointsArray.append(point)

	add_point(point)
	if points.size() >50:
		remove_point(0)
