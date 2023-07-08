extends CharacterBody2D

func _ready():
	print("Here I am")

func _moveTo(location: Vector2):
	global_position = location
