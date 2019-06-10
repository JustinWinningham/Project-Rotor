extends Node2D

var UP = Vector2(0, -1)
var GRAVITY = 10

var STAGE = 0

var playerMotion = Vector2(0, 0)

func _ready():
	pass


func _process(delta):
	playerMotion.x = 0
	if $Player_CS.is_on_floor():
		playerMotion.y = 0
	playerMotion.y += GRAVITY
	
	# Stage 0, player starts on left side of screen, moves right until hitting trigger 0
	if STAGE == 0:
		playerMotion.x = 50
	
	
	$Player_CS.move_and_slide(playerMotion, UP)
	pass


func _on_0_body_entered(body):
	if body == $Player_CS and STAGE == 0:
		STAGE = 1
		
	pass # Replace with function body.
