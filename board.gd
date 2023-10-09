extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_row_0_played(choices):
	$Row0.lock_row()
	$Row1.unlock_row()


func _on_row_1_played(choices):
	$Row1.lock_row()
	$Row2.unlock_row()


func _on_row_2_played(choices):
	$Row2.lock_row()
	$Row3.unlock_row()


func _on_row_3_played(choices):
	$Row3.lock_row()
	$Row4.unlock_row()


func _on_row_4_played(choices):
	$Row4.lock_row()
	$Row5.unlock_row()


func _on_row_5_played(choices):
	$Row5.lock_row()
	$Row6.unlock_row()


func _on_row_6_played(choices):
	$Row6.lock_row()
	$Row7.unlock_row()


func _on_row_7_played(choices):
	$Row7.lock_row()
	$Row8.unlock_row()


func _on_row_8_played(choices):
	$Row8.lock_row()
	$Row9.unlock_row()


func _on_row_9_played(choices):
	print("game over")
