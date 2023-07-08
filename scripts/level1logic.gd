extends Node2D

const blenemySc = preload("res://prefabs/blocking_enemy.tscn")
const barrelSc = preload("res://prefabs/barrel.tscn")
const frenemySc = preload("res://prefabs/frenemy.tscn")

var rng = RandomNumberGenerator.new()
@onready var spawn_extents = $spawn_area/CollisionShape2D.shape.extents

# how many enemies of each type to spawn per wave
var wave_frenemies = 5
var wave_blenemies = 1

var rng = RandomNumberGenerator.new()
@onready var spawn_extents = $spawn_area/CollisionShape2D.shape.extents

# how many enemies of each type to spawn per wave
var wave_frenemies = 5
var wave_blenemies = 1
# var wave_barrels = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	#const exampleLocation = Vector2(320,320)
	rng.randomize()
	_spawn_wave()
	print(spawn_extents)
	_spawn_blEnemy(Vector2(320,320))
	_spawn_barrel(Vector2(640,500))
	pass # Replace with function body.

func _spawn_wave():
	print("spawning a new wave of enemies")
	_get_random_spawn()
	#spawn frenemies
	for i in range(0, wave_frenemies, 1):
		self._spawn_frenemy(_get_random_spawn())
	
	#spawn blenemies
	for i in range(0, wave_blenemies, 1):
		self._spawn_blenemy(_get_random_spawn())

func _get_random_spawn():
	var random_pos_x = rng.randi_range(0, spawn_extents.x * 2)
	var random_pos_y = rng.randi_range(0, spawn_extents.y * 2)
	var random_vector = Vector2(random_pos_x, random_pos_y)
	print(random_vector)
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
	pass
