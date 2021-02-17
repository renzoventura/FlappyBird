extends Label

var points

func _ready():
	points = "0"
	text = points
	
func updatepoints(point):
	points = point
	text = str(points)

func resetpoints():
	text = str(0)
