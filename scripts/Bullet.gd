extends Area2D

@export var move_speed : float = 300.0
@export var move_dir : Vector2
@export var start_pos : Vector2
var velocity
var type

var texture_heal = preload("res://assets/bulletheal.png")
var texture_attack = preload("res://assets/bulletdamage.png")
var barrelArr = []
var barrelsLocated = 0
var min_distance = 10000

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

func _killSelf():
	get_parent().get_node(self.get_path()).queue_free()

func _on_body_entered(body):
	if body.is_in_group("Player")and self.type == "NormalBullet":
		_killSelf()
		PlayerVariables.heal_damage(5)
		GameController.add_score(10)
	if body.is_in_group("barrel"):
		_killSelf()
		body._explode()
		body._despawn()
	if body.is_in_group("frenemy") and self.type == "AttackBullet":
		_killSelf()
		body.hit()
	if body.is_in_group("blocking_enemy"):
		_killSelf()
	if self.type == "AttackBullet":
		body.hit()
