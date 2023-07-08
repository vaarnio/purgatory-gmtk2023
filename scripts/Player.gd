extends CharacterBody2D

@export var speed = 600

var target = position

@onready
var timer = $Timer
@onready
var healthbar = get_parent().get_node("HealthDisplay/HealthBar")
const obj_bullet = preload("res://scenes/bullet.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	timer.connect("timeout", on_Timer_timeout)
	timer.set_one_shot(false)
	timer.start()
	shoot()

func _input(event):
	target = get_global_mouse_position()
	
	
func shoot():
	var new_bullet = obj_bullet.instantiate()
	#var rNum = rng.rand_range(0,1000)
	#var rNum2 = rng.rand_range(0,1000)
	#new_bullet.position = Vector2(rNum, rNum2)
	#new_bullet.velocity = Vector2(speed, 0).r
	get_parent().add_child.call_deferred(new_bullet)

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		move_and_slide()

func on_Timer_timeout():
	PlayerVariables.take_damage(5)
	healthbar.value = PlayerVariables.health
	shoot()
