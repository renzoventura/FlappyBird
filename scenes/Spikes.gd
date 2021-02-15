extends Node2D


var SPEED = 5;
var motion = Vector2(0,0)

func _ready():
	print(position)
	pass 
	
func _process(delta):
	move()

func move():
	position.x -= SPEED


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
