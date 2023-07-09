extends Node2D


func _ready():
	$MenuButton.connect("button_down", return_to_menu)
	pass # Replace with function body.

func return_to_menu():
	GameController.menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
