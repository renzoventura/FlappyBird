extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pitch_scales = [0.9, 1.0, 1.2, 1.4]
onready var pointSfx = $PointsSfx
var POINT = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Spacer_body_entered(body):
	if(body.name == "Player"):
		get_tree().call_group("Level", "addPoint")
		pointSfx.pitch_scale = pitch_scales[randi() % pitch_scales.size()]
		pointSfx.play()
