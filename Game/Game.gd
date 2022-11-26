extends Node2D


const stone_class = preload("res://Stuff/Stone.tscn")
var stone_spawn_chance = 0.1
var spawn_offset = 100
var stone_scale_max = 0.4
var stone_scale_min = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.is_moving:
		if randf() < stone_spawn_chance:
			spawn_stone(get_spawn_pos())

func get_h_pos(length):
	return randf() * length

func get_spawn_pos():
	var screen_size = OS.get_real_window_size()
	var v = screen_size.y + spawn_offset
	var h = get_h_pos(screen_size.length())
	return Vector2(h, v)

func spawn_stone(pos):
	var stone_scale = get_stone_scale()
	var stone = stone_class.instance()
	stone.position = pos
	stone.scale = stone_scale
	$StoneContainer.add_child(stone)

func get_stone_scale():
	var scale = rand_range(stone_scale_min, stone_scale_max)
	var x = scale * rand_range(0.9, 1.1)
	var y = scale * rand_range(0.9, 1.1)
	return Vector2(x, y)
