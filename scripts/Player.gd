extends CharacterBody2D

@export var speed = 600

var target = position

@onready
var timer = $Timer
@onready
var healthbar = get_parent().get_node("HealthDisplay/HealthBar")
const obj_bullet = preload("res://scenes/bullet.tscn")
var rng = RandomNumberGenerator.new()
var attacked = false

func _ready():
	timer.connect("timeout", on_Timer_timeout)
	timer.set_one_shot(false)
	timer.start()
	shoot()

func _input(event):
	target = get_global_mouse_position()
	
func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		shootFromPlayer()

func shoot():
	var v1 = Vector2(500, 200)
	var new_bullet = obj_bullet.instantiate()
	new_bullet.setup(100, position, v1)
	get_parent().add_child(new_bullet)
	
func shootFromPlayer():
	if not attacked:
		attacked = true
		var v1 = Vector2(0, -500)
		var v2 = position
		# original position for ammo
		v2 += Vector2(0, -80)
		var new_bullet = obj_bullet.instantiate()
		new_bullet.setup(-5, v1, v2)
		new_bullet.changeType("AttackBullet")
		get_parent().add_child(new_bullet)
	else:
		await get_tree().create_timer(0.5).timeout
		attacked = false

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		move_and_slide()

func on_Timer_timeout():
	#PlayerVariables.take_damage(5)
	healthbar.value = PlayerVariables.health
	shoot()
