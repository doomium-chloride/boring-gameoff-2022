extends Node2D

const bored_dirt_class = preload("res://Stuff/DrilledDirt.tscn")
var dirt_counter = 0
var dirt_period = 0.5
var dirt_period_min = 0.2
var dirt_period_max = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		drill()
		Global.is_moving = true
	if event.is_action_released("ui_accept"):
		stop()
		Global.is_moving = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.is_moving:
		if dirt_counter >= dirt_period:
			process_dirt()
			dirt_counter = 0
			dirt_period = rand_range(dirt_period_min, dirt_period_max)
		dirt_counter += delta

func drill():
	$AnimatedSprite.play()
	$DrillSound.play()
	
func stop():
	$AnimatedSprite.stop()
	$DrillSound.stop()

func process_dirt():
	var bored_dirt = bored_dirt_class.instance()
	#bored_dirt.position = position
	$DrilledDirtContainer.add_child(bored_dirt)
