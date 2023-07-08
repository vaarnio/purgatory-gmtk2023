extends Node

var max_health = 100
var health = 100
var position

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
		GmeController.gameover()a
	else:
		set_health(self.health - value)

func heal_damage(value):
	if self.health + value > 100:
		set_health(100)
	else:
		set_health(self.health + value)

func set_health(value):
	self.health = value
