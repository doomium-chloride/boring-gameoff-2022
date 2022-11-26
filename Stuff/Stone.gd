extends Node2D

var has_entered_view = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Global.MoveUp(position, delta)
	if has_entered_view:
		if not 	$VisibilityNotifier2D.is_on_screen():
			queue_free()
	else:
		if $VisibilityNotifier2D.is_on_screen():
			has_entered_view = true
