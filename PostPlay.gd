extends PanelContainer

const STATS_PATH = "user://stats.res"

onready var score_label = $VBoxContainer/ScoreLabel
onready var high_score_label = $VBoxContainer/HighScoreLabel
onready var new_high_score = $VBoxContainer/NewHighScore
onready var play_btn = $VBoxContainer/PlayBtn

var score: int = 0

func _ready():
	score = SceneSwitcher.get_param("score")
	
	play_btn.connect("pressed", self, "_on_play_btn_pressed")
	
	var high_score = _get_high_score()
	var has_new_high_score = score > high_score
	new_high_score.visible = has_new_high_score
	
	if has_new_high_score:
		_set_high_score(score)
		high_score = score
	
	score_label.text = str(score)
	high_score_label.text = str(high_score)

func _on_play_btn_pressed():
	SceneSwitcher.to("res://Game.tscn")

func _get_high_score() -> int:
	if ResourceLoader.exists(STATS_PATH):
		var stats: Stats = load(STATS_PATH)
		return stats.high_score
	else:
		return 0

func _set_high_score(value: int):
	var stats := Stats.new()
	stats.high_score = value
	ResourceSaver.save(STATS_PATH, stats)
