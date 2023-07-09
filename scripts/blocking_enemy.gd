extends CharacterBody2D

@onready var timer = $Timer
var rng = RandomNumberGenerator.new()

var directionIsRight : bool = false
@export var moving_height = 350 # should be lower than frenemies to block bullets
@export var target_left = Vector2(0, moving_height)
@export var target_right = Vector2(600, moving_height)



@export var speed: int = 100
@export var target: Vector2 = self.target_left

func _ready():
	rng.randomize()
	timer.wait_time = rng.randi_range(1,3)

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		move_and_slide()

func hit():
	GameController.enemies_alive -= 1
	self.get_parent().remove_child(self)

func roam():
	timer.connect("timeout", change_direction)
	timer.one_shot = false
	timer.start()
	
func stop_roam():
	timer.stop()
	
func change_direction():
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
