extends Label

const Player = preload("res://Player.gd")

var player: Player setget _set_player, _get_player

func _on_player_score_changed(score: int):
	text = str(score)

func _set_player(value):
	if value == null:
		return
	
	if player:
		player.disconnect("score_changed", self, "_on_player_score_changed")
	
	player = value
	player.connect("score_changed", self, "_on_player_score_changed")
	_on_player_score_changed(player.score)

func _get_player():
	return player
