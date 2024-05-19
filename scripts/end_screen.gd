# Implements CanvasLayer, used to display things seperatly
extends CanvasLayer

# Set the time text to invisible then display "You Lose!"
func lose_game():
	$Time.visible = false
	$State.text = "You Lose!"

# Set the time text to visible and set it then display "You Win!"
func win_game(time : String):
	$Time.visible = true
	$State.text = "You Win!"
	$Time.text = "Time: " + time
