extends Node

@onready
var sc = get_node("/root/SceneController")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gameover():
	SceneController.goto_gameover_scene()
