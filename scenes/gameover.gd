extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.text = str(GameController.score)
	$Button.connect("button_down", return_to_menu)
	pass # Replace with function body.

func return_to_menu():
	SceneController.goto_menu_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
