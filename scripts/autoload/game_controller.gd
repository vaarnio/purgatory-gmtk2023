extends Node

var score = 0
var enemies_alive = 0
var dmg_multiplier = 1.01
var dmg_per_tick = 0.5

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

func menu():
	SceneController.goto_menu_scene()
	PlayerVariables.health = 100
	PlayerVariables.max_health = 100
	self.set_score(0)
