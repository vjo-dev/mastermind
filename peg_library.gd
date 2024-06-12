extends Panel

@export var code_peg_scene : PackedScene

var peg_padding : int = 10
var colors_panel : Dictionary = {
		1: "res://assets/code_peg_blue.png",
		2: "res://assets/code_peg_cyan.png",
		3: "res://assets/code_peg_green.png",
		4: "res://assets/code_peg_pink.png",
		5: "res://assets/code_peg_red.png",
		6: "res://assets/code_peg_yellow.png"
	}


func init(color_ids = [1, 2, 3, 4, 5, 6], can_drag = true) -> void:
	# init the library of colors that can be drag or not
	for n in range(len(color_ids)):
		var code_peg = code_peg_scene.instantiate()
		var color_id = color_ids[n]
		code_peg.can_drag = can_drag
		code_peg.color_id = color_id
		code_peg.texture = load(colors_panel[color_id])
		code_peg.position.x = (code_peg.size.x + peg_padding) * n + peg_padding
		code_peg.position.y = peg_padding
		add_child(code_peg)
		
		# adjust size of border
		size.x = (code_peg.size.x + peg_padding) * len(color_ids) + peg_padding
		size.y =  code_peg.size.x + 2 * peg_padding
