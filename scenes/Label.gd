extends Label

var points

func _ready():
	points = BackgroundMusicScene.POINTS
	print("READY: " + str(points))
	if (points == null):
		points = "0"
	text = str(points)
	
func updatepoints(point):
	points = point
	text = str(points)

func resetpoints():
	text = str(0)
