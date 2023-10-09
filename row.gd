extends Panel

signal played

var choices : Array
var picked


func _ready():
	lock_row()
	picked = 0
	choices = [-1, -1, -1, -1]
	$VerifyButton.hide()


func lock_row():
	$Drop0.droppable = false
	$Drop1.droppable = false
	$Drop2.droppable = false
	$Drop3.droppable = false


func unlock_row():
	$Drop0.droppable = true
	$Drop1.droppable = true
	$Drop2.droppable = true
	$Drop3.droppable = true


func _on_drop_0_dropped(color):
	pick_color(0, color)


func _on_drop_1_dropped(color):
	pick_color(1, color)


func _on_drop_2_dropped(color):
	pick_color(2, color)


func _on_drop_3_dropped(color):
	pick_color(3, color)
	

func pick_color(pos, color):
	# Count the number of peg picked
	if choices[pos] == -1:
		picked += 1
	# Update choices list
	choices[pos] = color
	# If all colors are picked, allow next step
	if picked == 4:
		$VerifyButton.show()


func _on_verify_button_pressed():
	$VerifyButton.hide()
	print("verification")
	played.emit(choices)
