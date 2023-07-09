extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._pressed)
	pass # Replace with function body.

func _pressed():
	SceneController.goto_scene("res://scenes/credits.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
