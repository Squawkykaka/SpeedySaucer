# A 2D Node with transform properties
extends Node2D

# the time elapsed since scene start.
var time_elapsed := 0.0

# whether the timer is stopped or not.
var is_stopped := true

# Allows quick access to nodes
@onready var timer = $Graphics/HUD/Timer
@onready var player = $Player
@onready var end_screen = $end_screen


# runs every frame.
func _process(delta: float) -> void:
	# set timer text
	timer.text = str(time_elapsed).pad_decimals(2)
	# unless its stopped add the elapsed time since last frame.
	if !is_stopped:
		time_elapsed += delta
	
	# Manages the keybinds
	keybind_manager()
	
func stop() -> void:
	# makes the timer invisiible.
	timer.visible = false
	# stop the timer.
	is_stopped = true

func _on_maze_body_exited(_body):
	# Stop and hide the timer.
	stop()
	
	# Stop the player from moving and lock movement.
	player.set_movement(false)
	player.reset_velocity()
	
	# Display the end screen
	end_screen.visible = true
	end_screen.lose_game()

func _on_end_area_body_entered(_body):
	# Setup the timer for display.
	var winning_time = str(time_elapsed).pad_decimals(2)
	stop()
	
	# Stop the player from moving and lock movement.
	player.set_movement(false)
	player.reset_velocity()
	
	# Display the end screen
	end_screen.win_game(winning_time)
	end_screen.visible = true

func _on_end_screen_reset_button_pressed():
	# Restart the level.
	get_tree().reload_current_scene()


# When the first movement key is pressed, start the timer.
func _on_player_move_button_pressed():
	is_stopped = false

func keybind_manager():
	if Input.is_action_just_pressed("restart_level"):
		get_tree().reload_current_scene()
	
