extends Node

@onready
var sc = get_node("/root/SceneController")
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_score(value):
	self.score = value
	
func add_score(value):
	self.set_score(self.score + value)

func gameover():
	SceneController.goto_gameover_scene()
