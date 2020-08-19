extends "Item.gd"

onready var sprite = $Sprite
onready var collider = $Collider
onready var sfx_obtain = $SfxObtain

func _obtain(player: Player):
	player.switch_color()
	sfx_obtain.play()
	
	sprite.visible = false
	collider.disabled = true
