extends Area2D

@export var move_speed : float = 30.0
@export var move_dir : Vector2
@export var start_pos : Vector2



@export var type = "NormalBullet"

# Called when the node enters the scene tree for the first time.
func setup(a, b, c):
	move_speed = a
	move_dir = b
	start_pos = c
	
	
func changeType(a):
	type = a

func _ready():
	global_position = start_pos
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += move_dir * delta


func _on_body_entered(body):
	if body.is_in_group("Player")and type == "NormalBullet":
		get_parent().get_node(self.get_path()).queue_free()
		print("Test")
