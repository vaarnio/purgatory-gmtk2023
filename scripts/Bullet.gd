extends Area2D

@export var move_speed : float = 300.0
@export var move_dir : Vector2
@export var start_pos : Vector2
var velocity
var type


var barrelArr = []
var barrelsLocated = 0
var min_distance = 10000

var texture_heal = preload("res://assets/bulletheal.png")
var texture_attack = preload("res://assets/bulletdamage.png")
# Called when the node enters the scene tree for the first time.
func setup(speed, direction, pos, set_type):
	self.move_speed = speed
	self.move_dir = direction
	self.start_pos = pos
	self.type = set_type
	
	if self.type == "NormalBullet":
		$Sprite2D.texture = texture_heal
	elif self.type == "AttackBullet":
		$Sprite2D.texture = texture_attack

func _ready():
	global_position = start_pos
	velocity = position.direction_to(move_dir) * move_speed
	#print(velocity)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += velocity * delta


func _on_body_entered(body):
	if body.is_in_group("Player")and self.type == "NormalBullet":
		get_parent().get_node(self.get_path()).queue_free()
		PlayerVariables.heal_damage(5)
		print("Bullet hit player")
	if body.is_in_group("barrel"):
		barrelArr = []
		barrelsLocated = 0
		min_distance = 10000
		var currentBestBarrel : CharacterBody2D
		for _i in get_parent().get_children():
			if ((_i.get_class() == "CharacterBody2D") and (snapped(_i.floor_max_angle,0.000001) == 0.785399)):
				barrelArr.append(_i)
				barrelsLocated += 1
		for _i in barrelArr:
			if(global_position.distance_to(_i.global_position) < min_distance):
				min_distance = global_position.distance_to(_i.global_position)
				currentBestBarrel = _i
			#print(global_position)
			#print(_i.global_position)
		
		currentBestBarrel._despawn()
		
