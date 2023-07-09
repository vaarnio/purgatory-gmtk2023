extends Node2D

const blenemySc = preload("res://prefabs/blocking_enemy.tscn")
const barrelSc = preload("res://prefabs/barrel.tscn")
const frenemySc = preload("res://prefabs/frenemy.tscn")

# how many enemies of each type to spawn per wave
var wave_frenemies = 5
var wave_blenemies = 1
var wave_barrels = 2

var rng = RandomNumberGenerator.new()
@onready var spawn_extents_frenemy = $spawn_frenemy/CollisionShape2D.shape.extents
@onready var spawn_extents_blenemy = $spawn_blenemy/CollisionShape2D.shape.extents

# Called when the node enters the scene tree for the first time.
func _ready():
	#const exampleLocation = Vector2(320,320)
	rng.randomize()
	_spawn_wave()
	pass # Replace with function body.

func _spawn_wave():
	print("spawning a new wave of enemies")
	#spawn frenemies
	for i in range(0, wave_frenemies, 1):
		GameController.enemies_alive += 1
		self._spawn_frenemy(_get_frenemy_spawn())
	
	#spawn blenemies
	for i in range(0, wave_blenemies, 1):
		GameController.enemies_alive += 1
		self._spawn_blenemy(_get_blenemy_spawn())
		
	#spawn barrels
	for i in range(0, wave_blenemies, 1):
		GameController.enemies_alive += 1
		self._spawn_barrel(_get_blenemy_spawn())

func _get_blenemy_spawn():
	var random_pos_x = rng.randi_range(0, spawn_extents_blenemy.x * 2)
	var random_pos_y = rng.randi_range(200, spawn_extents_blenemy.y * 2 + 200)
	var random_vector = Vector2(random_pos_x, random_pos_y)
	return random_vector

func _get_frenemy_spawn():
	var random_pos_x = rng.randi_range(0, spawn_extents_frenemy.x * 2)
	var random_pos_y = rng.randi_range(0, spawn_extents_frenemy.y * 2)
	var random_vector = Vector2(random_pos_x, random_pos_y)
	return random_vector

func _spawn_blenemy(spawnLoc: Vector2): 
	var blenemy = blenemySc.instantiate()
	blenemy._moveTo(spawnLoc)
	add_child(blenemy)
	blenemy.roam()
	
func _spawn_frenemy(spawnLoc: Vector2): 
	var frenemy = frenemySc.instantiate()
	frenemy._moveTo(spawnLoc)
	add_child(frenemy)
	frenemy.roam()

func _spawn_barrel(spawnLoc: Vector2): 
	var barrel = barrelSc.instantiate()
	barrel._moveTo(spawnLoc)
	add_child(barrel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameController.enemies_alive < 5:
		print(GameController.enemies_alive)
		_spawn_wave()
	pass
