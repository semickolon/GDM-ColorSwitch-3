extends StaticBody2D

export (int, 0, 3) var color_index = 0

func _ready():
	modulate = Constants.COLOR_PALETTE[color_index]
	collision_layer = 1 << (color_index + 1)
	collision_mask = collision_layer
