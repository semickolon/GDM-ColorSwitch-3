extends "res://obstacles/ObstacleRotating.gd"

func _ready():
	rotation_speed *= 1 if randf() < 0.5 else -1
