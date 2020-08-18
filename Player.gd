extends KinematicBody2D

signal died()
signal score_changed(score)

export var gravity := 100.0
export var jump := 100.0

onready var sprite = $Sprite
onready var death_particles = $DeathParticles

var velocity := Vector2.ZERO
var score := 0 setget _set_score, _get_score
var dead := false setget , _get_dead
var _color: Color = modulate

func _ready():
	switch_color()

func _physics_process(delta):
	if not dead:
		_move(delta)

func _move(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -jump
	
	var collision = move_and_collide(velocity * delta)
	if collision == null:
		return
	
	var collider = collision.collider
	
	if collider.get_class() == "Item":
		collider.obtain(self)
	else:
		_die()

func _die():
	dead = true
	sprite.visible = false
	death_particles.emitting = true
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
	var new_color := _color
	
	while new_color == _color:
		var idx := randi() % Constants.COLOR_PALETTE.size()
		new_color = Constants.COLOR_PALETTE[idx]
	
	_color = new_color
	modulate = _color
	death_particles.modulate = _color

