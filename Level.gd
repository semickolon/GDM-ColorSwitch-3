extends Node2D

const Y_START = 300.0
const UNIT_SPACING = 80
const BATCH_SIZE = 10
const BATCH_GEN_LOOKAHEAD = 1000.0

const LevelUnit = preload("res://LevelUnit.gd")
const Player = preload("res://Player.gd")

const ItemStar = preload("res://items/ItemStar.tscn")
const ItemColorSwitch = preload("res://items/ItemColorSwitch.tscn")
const ObstacleDonut = preload("res://obstacles/ObstacleDonut.tscn")
const ObstacleCross = preload("res://obstacles/ObstacleCross.tscn")
const ObstacleInfinity = preload("res://obstacles/ObstacleInfinity.tscn")

const ObstacleDonutScript = preload("res://obstacles/ObstacleDonut.gd")

var player: Player

var _gen_y := Y_START
var _batch_idx := 0

func _ready():
	_generate_batch()

func _process(_delta):
	var py = global_position.y - player.global_position.y
	if py > _gen_y - BATCH_GEN_LOOKAHEAD:
		_generate_batch()

func _generate_batch():
	var i0 = BATCH_SIZE * _batch_idx
	var i1 = i0 + BATCH_SIZE
	
	for i in range(i0, i1):
		var unit = _generate_level_unit(i)
		
		_gen_y += unit.bottom_offset
		_add_level_unit(unit)
		
		if unit.with_star:
			_add_level_unit(ItemStar.instance())
		
		_gen_y += unit.top_offset + UNIT_SPACING
		randomize()
	
	_batch_idx += 1

func _add_level_unit(unit: LevelUnit):
	unit.position.x = get_viewport().size.x / 2
	unit.position.y = -_gen_y
	add_child(unit)

func _generate_level_unit(idx: int) -> LevelUnit:
	var unit: PackedScene
	
	match idx:
		0, 2:
			unit = ObstacleDonut
		1, 3:
			unit = ItemColorSwitch
		_:
			var unit_choices: Array = [
				[ObstacleDonut, ObstacleInfinity, ObstacleCross],
				[ItemColorSwitch, ItemStar]
			][idx % 2]
			unit = unit_choices[randi() % unit_choices.size()]
	
	return unit.instance() as LevelUnit
