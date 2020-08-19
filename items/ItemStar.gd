extends "Item.gd"

onready var sprite = $Sprite
onready var collider = $Collider
onready var particles = $Particles
onready var sfx_obtain = $SfxObtain

func _obtain(player: Player):
	player.score += 1
	sfx_obtain.play()
	
	sprite.visible = false
	collider.disabled = true
	particles.emitting = true
