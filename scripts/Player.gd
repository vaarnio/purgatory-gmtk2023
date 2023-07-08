extends CharacterBody2D

@export var speed = 600

var target = position

@onready
var timer = $Timer
@onready
var healthbar = get_parent().get_node("HealthDisplay/HealthBar")

func _ready():
	timer.connect("timeout", on_Timer_timeout)
	timer.set_one_shot(false)
	timer.start()

func _input(event):
	target = get_global_mouse_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		move_and_slide()

func on_Timer_timeout():
	PlayerVariables.health = PlayerVariables.health - 1
	healthbar.value = PlayerVariables.health
	print("timeout")
