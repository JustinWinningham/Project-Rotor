extends Area2D

export(String) var scenePath = "res://Scenes/Main Menu.tscn"

func _ready():
	pass 


func _process(delta):
	var bods = get_overlapping_bodies()
	for bod in bods:
		if bod.name == "Player":
			print("level win!")
			#Do our level win stuff here
			get_tree().change_scene(scenePath)
	pass
