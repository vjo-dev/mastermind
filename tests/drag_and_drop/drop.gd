extends TextureRect

@export var color : int
@export var droppable : bool = false

signal dropped

func _ready():
	color = -1


func _can_drop_data(at_position, data):
	if droppable:
		return data is Dictionary
	else:
		return false


func _drop_data(at_position, data):
	var peg := data as Dictionary
	texture = peg["texture"]
	color = peg["color"]
	dropped.emit(color)
