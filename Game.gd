extends Panel

onready var score_label = $ScoreLabel
onready var player = $Player

func _ready():
	score_label.player = player
