extends CharacterBody2D

var directionIsRight : bool = false
@export var target_left = Vector2(0, 200)
@export var target_right = Vector2(600, 200)

@onready var timer = $Timer
var rng = RandomNumberGenerator.new()

@export var speed: int = 100
@export var target: Vector2 = self.target_left

func _ready():
	rng.randomize()
	timer.wait_time = rng.randi_range(0.5,3)
	print("Here I am")

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		move_and_slide()

func roam():
	print("mingling")
	timer.connect("timeout", change_direction)
	timer.one_shot = false
	timer.start()
	
func stop_roam():
	timer.stop()
	
func change_direction():
	print("chaning direction")
	if self.directionIsRight:
		set_target(self.target_left)
		self.directionIsRight = false
	else:
		set_target((self.target_right))
		self.directionIsRight = true

func set_target(value):
	self.target = value
	
func set_speed(value):
	self.speed = value

func _moveTo(location: Vector2):
	global_position = location
