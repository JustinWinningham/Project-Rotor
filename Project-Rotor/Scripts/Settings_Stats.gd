extends Control

var unsaved_changes = false
export(NodePath) var backmenu = "res://Scenes/Menus/Main Menu.tscn"

func _ready():
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("PAUSE"):
		_on_BackBtn_pressed()
	$Stats/NumDeaths.text = "Deaths: " + str(GLOBAL.num_deaths)
	$Stats/NumJumps.text = "Jumps: " + str(GLOBAL.num_jumps)
	$Stats/NumWalljumps.text = "Walljumps: " + str(GLOBAL.num_walljumps)
	$Stats/NumCrouch.text = "Ducks: " + str(GLOBAL.num_ducks)
	$Stats/TimeAir.text = "Time Spent Airborne: " + str(stepify(GLOBAL.time_airborne, 0.01))
	$Stats/TimeCrouch.text = "Time Spent Ducked: " + str(stepify(GLOBAL.time_ducked, 0.01))
	$Stats/TimeLeft.text = "Time Spent Moving Left: " + str(stepify(GLOBAL.time_moveleft, 0.01))
	$Stats/TimeRight.text = "Time Spent Moving Right: " + str(stepify(GLOBAL.time_moveright, 0.01))
	pass


func _on_BackBtn_pressed():
	if unsaved_changes:
		$Settings/DiscardUnsavedConfirm.popup()
		return
	_back_to_main_menu()
	pass # Replace with function body.


func _on_ApplyBtn_pressed():
	unsaved_changes = false
	pass # Replace with function body.


func _on_DefaultsBtn_pressed():
	$Settings/DefaultConfirm.popup()
	pass # Replace with function body.


func _back_to_main_menu():
	get_tree().change_scene(backmenu)
	pass


func _on_DefaultConfirm_confirmed():
	unsaved_changes = false
	# Reset everything to defaults here
	pass # Replace with function body.


func _on_DEBUGBTN_pressed():
	unsaved_changes = true
	pass # Replace with function body.


func _on_StatResetBtn_pressed():
	$Stats/StatResetBtn/ConfirmStatReset.popup()
	pass # Replace with function body.


func _on_ConfirmStatReset_confirmed():
	GLOBAL.num_jumps = 0
	GLOBAL.num_deaths = 0
	GLOBAL.num_walljumps = 0
	GLOBAL.num_ducks = 0
	GLOBAL.time_moveleft = 0.0
	GLOBAL.time_moveright = 0.0
	GLOBAL.time_airborne = 0.0
	GLOBAL.time_ducked = 0.0
	GLOBAL.time_walled = 0.0
	GLOBAL.time_floored = 0.0
	pass # Replace with function body.
