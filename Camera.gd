extends Camera2D

export (NoiseTexture) var noise_texture
export var frequency := 100.0
export var strength := 10.0

var _t := 0.0
var _shake_t0 := 0.0
var _shake_t1 := 0.01

func _process(delta):
	_t += delta
	var factor = 1.0 - clamp((_t - _shake_t0) / (_shake_t1 - _shake_t0), 0, 1)
	
	var st = _t * frequency
	offset.x = noise_texture.noise.get_noise_2d(st, 0) * strength * factor
	offset.y = noise_texture.noise.get_noise_2d(0, st) * strength * factor

func shake(dur: float = 0.5):
	_shake_t0 = _t
	_shake_t1 = _t + dur
