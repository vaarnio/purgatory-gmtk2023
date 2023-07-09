extends CharacterBody2D

# Variables
@export var speed: int = 30
var target = Vector2()
var rng = RandomNumberGenerator.new()
var targetrandomizer = rng.randi_range(0,1)

const bObj = preload("res://scenes/bullet.tscn")
var bInst

var directions = []

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
	GameController.enemies_alive -= 1
	get_parent().remove_child(self)
	#TODO: exploding despawn 

func _explode():
	directions = [
		Vector2(global_position.x,-100),
		Vector2(-100,global_position.y),
		Vector2(ProjectSettings.get_setting("display/window/size/viewport_width")+100,global_position.y),
		Vector2(global_position.x,ProjectSettings.get_setting("display/window/size/viewport_width")+100)
	]
	for d in directions:
		bInst = bObj.instantiate()
		bInst.setup(300, d, global_position, "NormalBullet")
		get_parent().add_child.call_deferred(bInst)
	#	get_tree().root.add_child.call_deferred(bInst)
		
#	for n in range(8):
#		#print(directions[n])
#		var new_bullet = obj_bullet.instantiate()
#		new_bullet.setup(300, directions[n], global_position, "NormalBullet")


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
