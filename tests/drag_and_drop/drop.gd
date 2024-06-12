extends TextureRect

signal dropped(col_index, color_id)

var col_index : int = 0
var color_id : int = 0
var droppable : bool = false


func _can_drop_data(at_position, data):
	if droppable:
		return data is Dictionary
	else:
		return false


func _drop_data(at_position, data):
	var peg := data as Dictionary
	texture = peg["texture"]
	color_id = peg["color_id"]
	dropped.emit(col_index, color_id)
