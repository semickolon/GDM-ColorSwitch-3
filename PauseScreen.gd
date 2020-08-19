extends PanelContainer

onready var anim_player = $AnimationPlayer

var _paused := false

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_paused = not _paused
		
		if _paused:
			anim_player.play("enter")
		
		yield(get_tree(), "idle_frame")
		get_tree().paused = _paused
		visible = _paused
