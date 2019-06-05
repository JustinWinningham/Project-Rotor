extends Control

var theTime = 0.0
var bestTime
var inputchildren

func _ready():
	inputchildren = $ScreenControls.get_children()
	GLOBAL.STATE = GLOBAL.GAMESTATE.ENTERSCENE
	bestTime = GLOBAL.get_best_time()
	pass

func _process(delta):
	if GLOBAL.STATE != GLOBAL.GAMESTATE.IDLE:
		return
	
	
	theTime += delta
	$TimeLabel.text = "Current Time: " + str(stepify(theTime, 0.01))
	$BestTimeLabel.text = "Best Time: " + str(stepify(bestTime, 0.01))
	$CurrentLevel.text = "Current level: " + str(GLOBAL.current_level)
	
	for child in inputchildren:
		child.play("OFF")
	# Handle UI Control Icons
	if Input.is_action_pressed("jump"):
		$ScreenControls/JUMP.play("ON")
	if Input.is_action_pressed("ui_up"):
		$ScreenControls/UP.play("ON")
	if Input.is_action_pressed("ui_down"):
		$ScreenControls/DOWN.play("ON")
	if Input.is_action_pressed("ui_left"):
		$ScreenControls/LEFT.play("ON")
	if Input.is_action_pressed("ui_right"):
		$ScreenControls/RIGHT.play("ON")
	pass

func _player_touching_floor(is_touching):
	if is_touching:
		$PlayerState/FLOOR.play("ON")
	else:
		$PlayerState/FLOOR.play("OFF")


func _player_touching_wall(is_touching):
	if is_touching:
		$PlayerState/WALL.play("ON")
	else:
		$PlayerState/WALL.play("OFF")