# Implements CanvasLayer, used to display things seperatly
extends CanvasLayer

signal reset_button_pressed

var player_name
var winning_time = randi() % 101

@onready var leaderboard_scene = preload("res://addons/silent_wolf/Scores/Leaderboard.tscn")

# Set the time text to invisible then display "You Lose!"
func lose_game():
	$Graphics/Time.visible = false
	$Graphics/State.text = "You Lose!"

# Set the time text to visible and set it then display "You Win!"
func win_game(time : String):
	$Graphics/Time.visible = true
	$Graphics/State.text = "You Win!"
	$Graphics/Time.text = "Time: " + time
	#winning_time = time

func _on_button_pressed():
	# Emit a signal saying the restart button was pressed
	reset_button_pressed.emit()
	

func _on_submit_button_pressed():
	var inputtext = $LineEdit.text
	player_name = inputtext
	SilentWolf.Scores.save_score(player_name, winning_time)
	get_tree().change_scene_to_packed(leaderboard_scene)
