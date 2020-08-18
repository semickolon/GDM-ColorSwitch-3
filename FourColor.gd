extends Sprite

func _ready():
	var mat = material as ShaderMaterial
	mat.set_shader_param("color_1", Constants.COLOR_PALETTE[0])
	mat.set_shader_param("color_2", Constants.COLOR_PALETTE[1])
	mat.set_shader_param("color_3", Constants.COLOR_PALETTE[2])
	mat.set_shader_param("color_4", Constants.COLOR_PALETTE[3])
