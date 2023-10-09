extends TextureRect

@export var color : int
	
	
func _ready():
	color = -1


func _can_drop_data(at_position, data):
	return data is Dictionary


func _drop_data(at_position, data):
	var peg := data as Dictionary
	texture = peg["texture"]
	color = peg["color"]
