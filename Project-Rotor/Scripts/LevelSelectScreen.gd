extends Control

func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("PAUSE"):
		get_tree().change_scene("res://Scenes/Menus/Main Menu.tscn")
	pass
