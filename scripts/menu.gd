extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	_set_custom_cursor()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _set_custom_cursor():
	var img = preload("res://assets/cursor.png")
	Input.set_custom_mouse_cursor(img)
