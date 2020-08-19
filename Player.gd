extends KinematicBody2D

signal died()
signal score_changed(score)

export var gravity := 1500.0
export var jump := 500.0

onready var sprite = $Sprite
onready var death_particles = $DeathParticles
onready var sfx_jump = $SfxJump
onready var sfx_die = $SfxDie

var velocity := Vector2.ZERO
var score := 0 setget _set_score, _get_score
var dead := false setget , _get_dead

var _color: Color = modulate
var _jumped := false

func _ready():
	switch_color()

func _physics_process(delta):
	if not dead:
		_move(delta)

func _move(delta):
	if _jumped:
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -jump
		_jumped = true
		sfx_jump.play()
	
	var collision = move_and_collide(velocity * delta)
	
	if collision != null:
		var collider = collision.collider
		
		if collider.get_class() == "Item":
			collider.obtain(self)
		else:
			_die()
	elif _below_floor():
		_die()

func _below_floor() -> bool:
	return get_global_transform_with_canvas().origin.y > get_viewport().size.y

func _die():
	dead = true
	sprite.visible = false
	death_particles.emitting = true
	
	sfx_die.play()
	emit_signal("died")

func _set_score(value):
	score = value
	emit_signal("score_changed", score)

func _get_score():
	return score

func _get_dead():
	return dead

func switch_color():
	randomize()
	var new_color_idx := -1
	var new_color := _color
	
	while new_color == _color:
		new_color_idx = randi() % Constants.COLOR_PALETTE.size()
		new_color = Constants.COLOR_PALETTE[new_color_idx]
	
	_color = new_color
	modulate = _color
	death_particles.modulate = _color
	
	collision_layer = ((1 << 5) - 1) ^ (1 << (new_color_idx + 1))
	collision_mask = collision_layer
