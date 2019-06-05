extends Button

export(String) var scenePath
export(int) var Lvl_Number = 0

func _ready():
	if GLOBAL.max_level < Lvl_Number:
		visible = false
	if scenePath == "" or scenePath == null:
		scenePath = "res://Scenes/Menus/Main Menu.tscn"
		print ("No scene found, " + name + " defaulting to main menu")
	pass

func _pressed():
	#thePlayer.play()
	get_tree().change_scene(scenePath)
	if get_tree().paused:
		get_tree().paused = false