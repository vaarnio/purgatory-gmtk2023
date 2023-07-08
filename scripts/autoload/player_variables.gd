extends Node

var max_health = 100
var health = 100
var position
@onready
var gc = get_node("/root/GameController")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(value):
	if self.health - value <= 0:
		print("gameover")
		set_health(0)
		gc.gameover()
	else:
		set_health(self.health - value)

func heal_damage(value):
	set_health(self.health + value)

func set_health(value):
	self.health = value
