extends CharacterBody2D

@export var speed = 600

var target = position

@onready
var timer = $Timer
const obj_bullet = preload("res://scenes/bullet.tscn")
var rng = RandomNumberGenerator.new()
var attacked = false
var dmg_multiplier
var dmg_counter

func _ready():
	PlayerVariables.position = position
	timer.connect("timeout", on_Timer_timeout)
	timer.set_one_shot(false)
	timer.start()
	self.dmg_multiplier = GameController.dmg_multiplier
	dmg_counter = 40

func _input(event):
	target = get_global_mouse_position()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		shootFromPlayer()
	
func shootFromPlayer():
	if not attacked:
		#attacked = true
		var v1 = Vector2(position.x,0)
		var v2 = position
		# original position for ammo
		v2 += Vector2(0, -80)
		var new_bullet = obj_bullet.instantiate()
		new_bullet.setup(300, v1, v2, "AttackBullet")
		new_bullet.rotation_degrees = 180
		get_parent().add_child.call_deferred(new_bullet)
		$Shooting.play()
	else:
		#await get_tree().create_timer(0.5).timeout
		attacked = false

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 5:
		move_and_slide()
	PlayerVariables.position = position

func on_Timer_timeout():
	var dmg = (log(dmg_counter) / log(10)) -1.5
	print(dmg)
	PlayerVariables.take_damage(dmg)
	dmg_counter += 1
