extends CanvasLayer

signal start_game


func _on_restart_button_pressed():
	start_game.emit()


func update_message(message):
	$Message.text = message
