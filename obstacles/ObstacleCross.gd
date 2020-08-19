extends "res://obstacles/ObstacleRotating.gd"

export (int, 0, 512) var horizontal_offset = 180.0

func _ready():
	var right: bool = randf() < 0.5
	position.x += horizontal_offset * (1 if right else -1)
	rotation_speed *= -1 if right else 1
