extends CanvasLayer

@onready var highscore = $HighScore

func addNewHighscore(name : String, time: float):
	highscore.set_item_text(0, "Hello")
