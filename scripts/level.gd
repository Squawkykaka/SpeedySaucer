extends Node2D

# the time elapsed since scene start.
var time_elapsed := 0.0

# wether the timer is stopped or not.
var is_stopped := false

# Allows quick access to nodes
@onready var timer = $Graphics/HUD/Timer
@onready var player = $Player
@onready var end_screen = $end_screen


# runs every frame.
func _process(delta: float) -> void:
	# unless its stopped add the elapsed time since last frame.
	if !is_stopped:
		time_elapsed += delta
		# set that value to the timer text prroperty
		timer.text = str(time_elapsed).pad_decimals(2)

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
