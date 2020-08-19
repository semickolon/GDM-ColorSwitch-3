extends Panel

onready var camera = $Camera
onready var player = $Player
onready var level = $Level
onready var on_die_timer = $OnDieTimer
onready var score_label = $UI/ScoreLabel

func _ready():
	player.connect("died", self, "_on_player_died")
	camera.following = player
	score_label.player = player
	level.player = player

func _on_player_died():
	camera.shake()
	on_die_timer.start()
	yield(on_die_timer, "timeout")
	get_tree().change_scene("res://Game.tscn")
