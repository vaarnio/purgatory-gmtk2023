extends CharacterBody2D

# Variables
@export var speed: int = 30
var target = Vector2()
var rng = RandomNumberGenerator.new()
var targetrandomizer = rng.randi_range(0,1)

func _ready():
	if (targetrandomizer == 0):
		target = Vector2(-100,global_position.y)
	else:
		target = Vector2(ProjectSettings.get_setting("display/window/size/viewport_width")+100,global_position.y)

func _moveTo(location: Vector2):
	global_position = location

func _despawn():
	#print("Despacito") # Debug print
	get_parent().remove_child(self)
	#TODO: exploding despawn 

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		move_and_slide()
	else:
		_despawn()
