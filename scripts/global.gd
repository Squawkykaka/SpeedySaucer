extends Node


func _ready():
	SilentWolf.configure({	
		"api_key": "IPOjNUIt6u4RSLpOQbszg9z5r83OR8eY9nGYUctf",
		"game_id": "SpeedySaucer",
		"log_level": 1,
		"game_version": "1.0.0"
	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/end_screen.tscn"
	})

