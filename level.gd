extends Node2D

# the time elapsed since scene start.
var time_elapsed := 0.0

# wether the timer is stopped or not.
var is_stopped := false

# Allows quick access to timer and player node
@onready var timer = $Graphics/HUD/Timer
@onready var player = $Player

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
	# when the player leaves the maze reset the scene
	# TODO: Replace this with a better way in the future.
	get_tree().reload_current_scene()


func _on_end_area_body_entered(_body):
	# TODO: Implement winning logic.
	pass
