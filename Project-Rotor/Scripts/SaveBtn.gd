extends Button

var t = preload("res://Scripts/GLOBAL.gd")

func _ready():
	text = "SAVE"
	if GLOBAL.showload and not GLOBAL.shownload: #showload and shownload are different!!!
		print("button changes text here")
		text = "SAVE LOADED!"
		GLOBAL.shownload = true
	pass


func _on_SaveBtn_pressed():
	text = "SAVING..."
	if GLOBAL.save_game():
		text = "GAME SAVED!"
	else:
		text = "SAVE FAILED!"
	pass