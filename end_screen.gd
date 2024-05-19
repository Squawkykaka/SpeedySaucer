# Implements CanvasLayer, used to display things seperatly
extends CanvasLayer

# time variable used when completed the level
var time := 0.0

func set_time(new_time : float):
	# set the end time then display it
	time = new_time
	$Time.text = "Time: " + str(time)
