extends Control

func _ready():
	GLOBAL.STATE = GLOBAL.GAMESTATE.ENTERSCENE
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("PAUSE"):
		GLOBAL.level2load = "res://Scenes/Menus/Main Menu.tscn"
		GLOBAL.STATE = GLOBAL.GAMESTATE.LEAVESCENE
	pass
