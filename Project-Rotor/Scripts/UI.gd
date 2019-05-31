extends Control

var theTime = 0.0

func _ready():
	pass # Replace with function body.

func _process(delta):
	theTime += delta
	$TimeLabel.text = str(stepify(theTime, 0.01))
	pass
