extends Node2D

export var rotation_speed := 10.0

func _process(delta):
	rotation_degrees += rotation_speed * delta
