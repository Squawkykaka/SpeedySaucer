extends Node

var save_data = {
	"score": 0,
	"name": "NAME"
}

func save():
	var save_data = FileAccess.open("user://save_game.dat", FileAccess.WRITE)
	save_data.store_var(save_data)
	save_data.close()
	
func load():
	if not FileAccess.file_exists("user://save_game.dat"):
		save()
		return

	var save_data = FileAccess.open("user://save_game.dat", FileAccess.READ)
	var data = save_data.get_var()
	
	save_data.score = data.score
	save_data.name = data.name
	return data
