extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_firstTrigger_body_entered(body):
	$RichTextLabel2.visible = true


func _on_secondTrigger_body_entered(body):
	$RichTextLabel3.visible = true
