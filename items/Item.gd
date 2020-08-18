extends StaticBody2D

const Player = preload("res://Player.gd")

var obtained := false setget , _get_obtained

func obtain(player: Player):
	if not obtained:
		obtained = true
		_obtain(player)

func _obtain(player: Player):
	assert(false, "Not implemented!")

func get_class() -> String:
	return "Item"

func _get_obtained():
	return obtained
