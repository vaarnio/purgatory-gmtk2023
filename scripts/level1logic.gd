extends Node2D

const blEnemySc = preload("res://prefabs/blocking_enemy.tscn")
const barrelSc = preload("res://prefabs/barrel.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#const exampleLocation = Vector2(320,320)
	#_spawn_blEnemy(Vector2(320,320))
	_spawn_barrel(Vector2(220,200))
	_spawn_barrel(Vector2(420,400))
	pass # Replace with function body.


func _spawn_blEnemy(spawnLoc: Vector2): 
	var blEnemy = blEnemySc.instantiate()
	blEnemy._moveTo(spawnLoc)
	add_child(blEnemy)
	blEnemy.roam()

func _spawn_barrel(spawnLoc: Vector2): 
	var barrel = barrelSc.instantiate()
	barrel._moveTo(spawnLoc)
	add_child(barrel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
