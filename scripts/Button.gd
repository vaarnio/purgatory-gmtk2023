extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(self._pressed)
	pass # Replace with function body.

func _pressed():
	SceneController.goto_scene("res://scenes/Level1_Patrik.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
