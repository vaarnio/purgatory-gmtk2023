extends Node2D

const blEnemySc = preload("res://scenes/development/blocking_enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#const exampleLocation = Vector2(320,320)
	_spawn_blEnemy(Vector2(320,320))
	pass # Replace with function body.


func _spawn_blEnemy(spawnLoc: Vector2): 
	var blEnemy = blEnemySc.instantiate()
	blEnemy._moveTo(spawnLoc)
	add_child(blEnemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
