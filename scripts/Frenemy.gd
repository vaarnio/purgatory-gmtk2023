extends CharacterBody2D

const obj_bullet = preload("res://scenes/bullet.tscn")

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

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		move_and_slide()

func hit():
	GameController.enemies_alive -= 1
	self.get_parent().remove_child(self)

func shoot():
	var v1 = PlayerVariables.position
	var v2 = position
	# original position for ammo
	v2 += Vector2(0, 0)
	var new_bullet = obj_bullet.instantiate()
	new_bullet.setup(300, v1, v2, "NormalBullet")
	get_parent().add_child.call_deferred(new_bullet)

func roam():
	timer.connect("timeout", change_direction)
	timer.one_shot = false
	timer.start()
	
func stop_roam():
	timer.stop()
	
func change_direction():
	shoot()
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
