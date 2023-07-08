extends Area2D

@export var move_speed : float = 30.0
@export var move_dir : Vector2
@export var start_pos : Vector2



@export var type = "NormalBullet"
var texture2 = preload("res://assets/bulletdamage.png")

var barrelArr = []
var barrelsLocated = 0
var min_distance = 10000

# Called when the node enters the scene tree for the first time.
func setup(a, b, c):
	move_speed = a
	move_dir = b
	start_pos = c
	
	
func changeType(a):
	type = a
	$Sprite2D.texture = texture2

func _ready():
	global_position = start_pos
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += move_dir * delta


func _on_body_entered(body):
	if body.is_in_group("Player")and type == "NormalBullet":
		get_parent().get_node(self.get_path()).queue_free()
		print("Test")
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
