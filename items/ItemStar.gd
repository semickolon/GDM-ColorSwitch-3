extends "Item.gd"

onready var sprite = $Sprite
onready var collider = $Collider
onready var particles = $Particles

func _obtain(player: Player):
	player.score += 1
	sprite.visible = false
	collider.disabled = true
	particles.emitting = true
