extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pointsArray

# Called when the node enters the scene tree for the first time.
func _ready():
	 pointsArray = get_parent().pointsArray


func _draw():
	if len(pointsArray) >= 2:
		draw_line(pointsArray[-2], pointsArray[-1],Color(1,1,1), 1)
		
func _process(delta):
	update()
	show()
