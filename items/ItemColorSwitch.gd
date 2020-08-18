extends "Item.gd"

func _obtain(player: Player):
	player.switch_color()
	queue_free()
