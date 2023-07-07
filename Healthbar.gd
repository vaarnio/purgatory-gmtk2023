extends Node2D

var bar_red = preload("res://assets/barHorizontal_red.png")
var bar_green = preload("res://assets/barHorizontal_green.png")
var bar_yellow = preload("res://assets/barHorizontal_yellow.png")

@onready
var player_vars = get_node("/root/PlayerVariables")
@onready
var healthbar = $HealthBar

# Called when the node enters the scene tree for the first time.
func _ready():
	healthbar.max_value = player_vars.max_health
	healthbar.value = player_vars.health
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_healthbar(value):
	healthbar.value = player_vars.health
