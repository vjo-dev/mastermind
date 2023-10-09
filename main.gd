extends Node


var board_rows : int
var board_cols : int
var turn : int


func _ready():
	board_rows = 10
	board_cols = 4
	turn = 0
	new_game(4, 10)
	
	
func new_game(cols, rows):
	$Board/Row0.unlock_row()
