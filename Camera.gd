extends Camera2D

export (float, 0, 1024) var follow_distance := 600.0
export (NoiseTexture) var shake_noise
export var shake_frequency := 100.0
export var shake_strength := 20.0

var _t := 0.0
var _shake_t0 := 0.0
var _shake_t1 := 0.01

var following: Node2D

func _process(delta):
	_t += delta
	_process_shake()
	_process_follow()

func _process_shake():
	var st = _t * shake_frequency
	var factor = 1.0 - clamp((_t - _shake_t0) / (_shake_t1 - _shake_t0), 0, 1)
	offset.x = shake_noise.noise.get_noise_2d(st, 0) * shake_strength * factor
	offset.y = shake_noise.noise.get_noise_2d(0, st) * shake_strength * factor

func _process_follow():
	var dy = following.global_position.y - global_position.y
	if dy < follow_distance:
		position.y -= follow_distance - dy

func shake(dur: float = 0.5):
	_shake_t0 = _t
	_shake_t1 = _t + dur
