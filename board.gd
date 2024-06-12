extends Panel

signal game_over(turn)

@export var row_scene: PackedScene

var code : Array
var cols : int
var rows : int
var turn : int
var rows_collection := []

func init(code_m : Array, board_cols_number : int, board_rows_number : int) -> void:
	# init the board by creating the rows
	code = code_m
	cols = board_cols_number
	rows = board_rows_number
	rows_collection = []
	turn = 0

	var row
	# generate the board
	for n in range(rows):
		# instantiate a new row
		row = row_scene.instantiate()
		# set row parameters
		row.init(cols)
		if n == 0:
			row.unlock()
		row.to_evaluate.connect(evaluation)
		# position the row
		row.position.y = (rows - 1) * (row.size.y + 10) - (row.size.y + 10) * n + 10
		row.position.x = 10
		# add the row to board
		add_child(row)
		rows_collection.append(row)

	# size the board
	size.x = row.size.x + 10
	size.y = (row.size.y + 10) * rows + 10

	# start the first row
	rows_collection[0].unlock()


func evaluation(guess):
	# check is code is break of return an evaluation
	## black = 2 (good color, good position)
	## white = 1 (good color, wrong position)
	var evaluations = []
	var propositions = guess.duplicate(true)
	var possibilities = code.duplicate(true)

	# check for peg with right color at right position
	for color_position in range(len(propositions)):
		if propositions[color_position] == possibilities[color_position]:
			evaluations.append(2)
			possibilities[color_position] = 0
			propositions[color_position] = 0

	# ckeck for peg with the right color at wrong position
	for color_position in range(len(propositions)):
		var proposed_color_value = propositions[color_position]
		if proposed_color_value > 0:
			var position_proposed_color_value = possibilities.find(propositions[color_position])
			if position_proposed_color_value >= 0:
				evaluations.append(1)
				possibilities[position_proposed_color_value] = 0

	rows_collection[turn].show_evaluation(evaluations)
	
	# check is code is break
	if code == guess:
		game_over.emit(true, turn)
		return
	
	# loop through next row
	next_row()


func next_row():
	# switch the row that can be (drag and) drop
	rows_collection[turn].lock()
	if turn < rows - 1:
		rows_collection[turn + 1].unlock()
	if turn == rows - 1:
		game_over.emit(false, turn)
	turn += 1
