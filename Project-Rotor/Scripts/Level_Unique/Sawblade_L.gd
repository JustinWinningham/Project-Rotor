extends Area2D

enum STATE {MOVING, WAITING}

export(bool) var statik = true
export(float) var move_speed = 0.5
export(Vector2) var move_to
export(int) var spin_speed = 5
export(int) var HANGTIME = 3

var start_pos
var destination
var state = STATE.MOVING
var current_hangtime = HANGTIME

func _ready():
	start_pos = position
	if move_to == null or statik:
		move_to = position
	destination = move_to
	pass # Replace with function body.


func _process(delta):
	
	# We may want to remove this later if we impliment a death animation
	if GLOBAL.STATE != GLOBAL.GAMESTATE.IDLE:
		return
		
	$AnimatedSprite.rotation_degrees += spin_speed
	# Calculate movement towards (or return from) the move_to point at speed
	var bods = get_overlapping_bodies()
	for bod in bods:
		if bod.name == "Player":
			GLOBAL.num_deaths += 1
			GLOBAL.STATE = GLOBAL.GAMESTATE.LEVELDEATH
			# Kill the player. we will reset the scene for now, but in future need to handle player death more gracefully
			#get_tree().reload_current_scene()
			print("Player hit a sawblade. Dead.")
			pass
	if not statik:
		if state == STATE.MOVING:
			var clip_pos = Vector2(stepify(position.x, 0.1), stepify(position.y, 0.1))
			var clip_dest = Vector2(stepify(destination.x, 0.1), stepify(destination.y, 0.1))
			if clip_pos.x == clip_dest.x and clip_pos.y == clip_dest.y:
				# We have reached our destination, and need to update said destination and state
				state = STATE.WAITING
				if destination == start_pos:
					destination = move_to
				else:
					destination = start_pos
			else: # If we hit this else, that means we are MOVING and NOT at our destination
				var movement = Vector2(0, 0)
				movement.x = destination.x - position.x
				movement.y = destination.y - position.y
				movement = movement.normalized() * move_speed
				position += movement
		if state == STATE.WAITING:
			if current_hangtime > 0:
				current_hangtime -= delta
			else:
				state = STATE.MOVING
				current_hangtime = HANGTIME
		pass
	pass
