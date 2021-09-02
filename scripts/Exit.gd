extends Area2D

export var nextLevel := "res://scenes/Intro.tscn"

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_body_entered(_body) -> void:
	get_tree().change_scene(nextLevel)
