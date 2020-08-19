extends PanelContainer

var _paused := false

func _ready():
	visible = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_paused = not _paused
		get_tree().paused = _paused
		visible = _paused
		
		var time_scale = 0 if _paused else 1
		Engine.time_scale = time_scale
		VisualServer.set_shader_time_scale(time_scale)
