extends "res://LevelUnit.gd"

export var rotation_speed := 90.0
export var standalone := false

func _process(delta):
	rotation_degrees += rotation_speed * delta
