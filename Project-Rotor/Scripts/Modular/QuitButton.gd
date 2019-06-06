extends Button

func _pressed():
	$ConfirmationDialog.popup_centered(Vector2(300, 100))
	#get_tree().quit()

func _on_ConfirmationDialog_confirmed():
	get_tree().quit()
	pass # Replace with function body.
