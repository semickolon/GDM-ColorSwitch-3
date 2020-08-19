extends Node2D

export (int, 0, 512) var top_offset = 10
export (int, 0, 512) var bottom_offset = 10
export (bool) var with_star = false

onready var _screen_height = get_viewport().size.y

func _process(_delta):
	var screen_y = get_global_transform_with_canvas().origin.y
	var offscreen_y = _screen_height + top_offset + 32
	
	if screen_y > offscreen_y:
		queue_free()
