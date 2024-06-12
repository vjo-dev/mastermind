extends TextureRect

@export var color_id : int
@export var can_drag : bool = true


func _get_drag_data(at_position):
	if can_drag:
		var preview_texture = TextureRect.new()
		var peg : Dictionary
		
		preview_texture.texture = texture
		preview_texture.expand_mode = 1
		preview_texture.size = Vector2(30, 30)
		
		var preview = Control.new()
		preview.add_child(preview_texture)
		preview_texture.position = -0.5 * preview_texture.size
		set_drag_preview(preview)
		
		peg = {
			"texture": texture,
			"color_id": color_id
		}
		
		return peg
	else:
		pass
	
	
func _can_drop_data(at_position, data):
	return false
