extends CharacterBody2D

# Variables
@export var speed: int = 30
var target = Vector2()
var rng = RandomNumberGenerator.new()
var targetrandomizer = rng.randi_range(0,1)

const obj_bullet = preload("res://scenes/bullet.tscn")
var new_bullet = obj_bullet.instantiate()

func _ready():
	#print(snapped(floor_max_angle,0.000001))
	floor_max_angle += 0.000001 # By changing a very speciefic default value a very small amount we can pinpoint barrel type CharacterBody2D objects in tree
	#print(snapped(floor_max_angle,0.000001))
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

#func _explode():
#	for n in range(8):
#		new_bullet = obj_bullet.instantiate()
#		new_bullet.setup(300, v1, v2, "AttackBullet")
	

#func _monitor_collision():
	#get_node("bulletDetector")

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		move_and_slide()
	else:
		_despawn()


	# possible to also detect player collisions here
	# help at: https://youtu.be/GR4UWiY9hmo
	#if body.is_in_group("bullet"):
	#	print("osuma")
