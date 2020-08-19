extends Node2D

const LevelUnit = preload("res://LevelUnit.gd")

const ItemStar = preload("res://items/ItemStar.tscn")
const ItemColorSwitch = preload("res://items/ItemColorSwitch.tscn")
const ObstacleDonut = preload("res://obstacles/ObstacleDonut.tscn")
const ObstacleCross = preload("res://obstacles/ObstacleCross.tscn")
const ObstacleInfinity = preload("res://obstacles/ObstacleInfinity.tscn")

const ObstacleDonutScript = preload("res://obstacles/ObstacleDonut.gd")

func _ready():
	var y = 300
	
	for i in range(10):
		var unit = _generate_level_unit(i)
		
		y += unit.bottom_offset
		_add_level_unit(unit, y)
		
		if unit.with_star:
			_add_level_unit(ItemStar.instance(), y)
		
		y += unit.top_offset + 80
		randomize()

func _add_level_unit(unit: LevelUnit, y: float):
	unit.position.x = get_viewport().size.x / 2
	unit.position.y = -y
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
