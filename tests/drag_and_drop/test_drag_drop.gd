extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var choices : Array
	choices = [
		$DropRow/Drop0.color,
		$DropRow/Drop1.color,
		$DropRow/Drop2.color,
		$DropRow/Drop3.color
		]
	print(choices)
