extends "res://LevelUnit.gd"

const ObstacleCircle = preload("res://obstacles/ObstacleCircle.tscn")

export (float) var speed = 200.0
export (int, 0, 8) var circles_per_color = 4

onready var path_l = $PathL
onready var path_r = $PathR

func _ready():
	var count = 4 * circles_per_color
	var offset = randf()
	
	for i in range(count):
		var path_follow_l = PathFollow2D.new()
		var path_follow_r = PathFollow2D.new()
		
		var circle_l = ObstacleCircle.instance()
		circle_l.color_index = int(floor(i / float(circles_per_color)))
		var circle_r = circle_l.duplicate()
		
		path_follow_l.add_child(circle_l)
		path_follow_r.add_child(circle_r)
		
		path_l.add_child(path_follow_l)
		path_r.add_child(path_follow_r)
		
		var unit_offset = i / float(count)
		unit_offset += offset
		unit_offset = fmod(unit_offset, 1.0)
		
		path_follow_l.unit_offset = unit_offset
		path_follow_r.unit_offset = unit_offset

func _process(delta):
	for path in [path_l, path_r]:
		for path_follow in path.get_children():
			path_follow.offset += speed * delta
