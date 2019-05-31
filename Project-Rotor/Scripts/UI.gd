extends Control

var theTime = 0.0
var bestTime

func _ready():
	bestTime = GLOBAL.get_best_time()
	pass

func _process(delta):
	theTime += delta
	$TimeLabel.text = str(stepify(theTime, 0.01))
	$BestTimeLabel.text = str(stepify(bestTime, 0.01))
	pass
