extends Node

var board_rows_number : int
var board_cols_number : int
var colors_number : int
var margin : int
var code : Array


func _ready():
	margin = 20
	board_rows_number = 10
	board_cols_number = 4
	colors_number = 6
	new_game()
	
	
func new_game() -> void:
	# initialize the game
	$HUD.hide()
	
	# generate the code to solve in an array	
	code = generate_code(board_cols_number, colors_number)
	
	# get window size
	var viewport_size = get_viewport().get_visible_rect().size
	
	# plot the library of colors
	$Colors.init()
	$Colors.position.x = viewport_size.x / 2 - $Colors.size.x / 2
	$Colors.position.y = viewport_size.y - $Colors.size.y - margin
	
	# plot the board
	$Board.init(code, board_cols_number, board_rows_number)
	$Board.position.x = $Colors.position.x
	$Board.position.y = viewport_size.y / 2 - $Board.size.y / 2

	# plot the code
	$Code.init(code, false)	
	$Code.position.x = $Colors.position.x
	$Code.position.y = margin
	
	# add the mask on top of the code
	$CodeMask.position.x = $Colors.position.x
	$CodeMask.position.y = margin
	$CodeMask.size = $Code.size
	$CodeMask/Label.size = $CodeMask.size
	$CodeMask.show()
	

func generate_code(code_length, colors_number) -> Array:
	# return the code as array of number of "board_cols" colors within the number "colors_number" of colors
	var rng = RandomNumberGenerator.new()
	var rdm_code = []
	for i in range(code_length):
		rdm_code.append(rng.randi_range(1, colors_number))
	return rdm_code


func _on_board_game_over(win, turn) -> void:
	# stop the game and show message depending if we reach the number of turns
	var message
	if win:
		message = "You cracked it\nin {turn} turns".format({"turn": turn + 1})
	else:
		message = "Game over"
	$HUD.update_message(message)
	$HUD.show()
	$CodeMask.hide()


func _on_hud_start_game() -> void:
	# reset the game
	# remove previous game items
	get_tree().call_group("rows", "queue_free")
	get_tree().call_group("pegs", "queue_free")
	# reload the game
	new_game()
