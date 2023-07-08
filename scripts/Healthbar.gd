extends Node2D

var bar_red = preload("res://assets/barHorizontal_red.png")
var bar_green = preload("res://assets/barHorizontal_green.png")
var bar_yellow = preload("res://assets/barHorizontal_yellow.png")

@onready
var healthbar = $HealthBar

# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar.max_value = PlayerVariables.max_health
	healthbar.value = PlayerVariables.health
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_healthbar()
	pass

func update_healthbar():
	healthbar.value = PlayerVariables.health
