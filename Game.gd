extends Panel

onready var camera = $Camera
onready var player = $Player
onready var score_label = $ScoreLabel

func _ready():
	player.connect("died", self, "_on_player_died")
	score_label.player = player

func _on_player_died():
	camera.shake()
