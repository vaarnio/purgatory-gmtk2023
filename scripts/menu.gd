extends Node2D

const obj_fire = preload("res://scenes/fire_particle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	_set_custom_cursor()
	var new_fire = obj_fire.instantiate()
	add_child.call_deferred(new_fire)
	new_fire.global_position = Vector2(200, 800)
	new_fire.z_index = -2
	new_fire.get_node("CPUParticles2D").scale_amount_min = 12
	new_fire.get_node("CPUParticles2D").scale_amount_max = 15
	new_fire.modulate = Color(1, 1, 1, 0.15)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _set_custom_cursor():
	var img = preload("res://assets/cursor.png")
	Input.set_custom_mouse_cursor(img)
