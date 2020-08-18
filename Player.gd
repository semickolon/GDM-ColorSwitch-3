extends KinematicBody2D

var velocity := Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	velocity = Vector2(10, 0)
	move_and_collide(velocity * delta)
