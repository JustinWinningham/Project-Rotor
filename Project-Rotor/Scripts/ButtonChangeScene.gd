extends Button

export(String) var scenePath

func _ready():
	if scenePath == "" or scenePath == null:
		scenePath = "res://Scenes/Menus/Main Menu.tscn"
		print ("No scene found, " + name + " defaulting to main menu")
	pass

func _pressed():
	GLOBAL.level2load = scenePath
	GLOBAL.STATE = GLOBAL.GAMESTATE.LEAVESCENE
	if get_tree().paused:
		get_tree().paused = false