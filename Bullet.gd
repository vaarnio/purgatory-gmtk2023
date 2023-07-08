extends Area2D

@export var move_speed : float = 30.0
@export var move_dir : Vector2

var start_pos : Vector2
var target_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta)


func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_parent().get_node(self.get_path()).queue_free()
