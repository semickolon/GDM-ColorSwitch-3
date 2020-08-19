extends Node

var _params: Dictionary = {}

func to(path: String, params: Dictionary = {}):
	_params = params
	get_tree().change_scene(path)

func get_param(key: String):
	return _params.get(key)
