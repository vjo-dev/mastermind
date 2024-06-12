extends Panel

signal to_evaluate(guess)

@export var guess_peg_scene : PackedScene

var cols : int
var guess : Array
var pegs_collection := []
@onready var picked := 0


func init(cols) -> void:
	# initialize guess array
	guess = []
	guess.resize(cols)
	guess.fill(0)
	
	var guess_peg
	for n in cols:
		guess_peg = guess_peg_scene.instantiate()
		guess_peg.col_index = n
		guess_peg.dropped.connect(update_row_value)
		guess_peg.position.x = (guess_peg.size.x + 10) * n
		guess_peg.position.y = 0
		add_child(guess_peg)
		pegs_collection.append(guess_peg)
		
	$VerifyButton.position = Vector2i(cols * (guess_peg.size.x + 10), 0)
	$VerifyButton.hide()
	
	$Verification.position = Vector2i((cols + 1) * (guess_peg.size.x + 10), 0)
	
	size = Vector2i((guess_peg.size.x + 10) * (cols + 2), guess_peg.size.y)


func update_row_value(col_index, color_id):
	if guess[col_index] == 0:
		picked += 1
	guess[col_index] = color_id
	if picked == 4:
		$VerifyButton.show()


func unlock():
	for peg in pegs_collection:
		peg.droppable = true


func lock():
	for peg in pegs_collection:
		peg.droppable = false


func _on_verify_button_pressed():
	to_evaluate.emit(guess)


func show_evaluation(evaluations):
	$VerifyButton.hide()
	$Verification.show_evaluation(evaluations)
