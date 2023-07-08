extends CharacterBody2D

@export var speed: int = 100
@export var target: Vector2 = Vector2(0,0)

func _ready():
	pass

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		move_and_slide()

func set_target(value):
	self.target = value
	
func set_speed(value):
	self.speed = value
