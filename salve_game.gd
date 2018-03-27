extends Node

var gameData = {
fase = 0
}

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func save(var saveName):
	var fileSave = File.new()
	fileSave.open("user://"+saveName+".data", File.WRITE)
	var data = gameData
	data.fase = global.fase
	fileSave.store_line(data.to_json())
	fileSave.close()

func loadGame(var saveName):
	var fileSave = File.new()
	
	if !fileSave.file_exists("user://"+saveName+".data"):
		global.partidaInicial = true
	else: 
		var data = {}
		fileSave.open("user://"+saveName+".data", File.READ)
		
		while(!fileSave.eof_reached()):
			data.parse_json(fileSave.get_line())
			global.fase = data["fase"]
	fileSave.close()
	
	
	
	
	
