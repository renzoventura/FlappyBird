extends CanvasLayer

onready var retry_button = $Control/CenterContainer/VBoxContainer/VBoxContainer2/retry

const BLACK = Color(134, 134, 134, 255)
const WHITE = Color(172, 172, 172)

func _ready():
	pass # Replace with function body.

func _on_retry_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			get_tree().call_group("Level", "restart")

func _on_retry_mouse_entered():
	pass

func _on_retry_mouse_exited():
	pass
		
func _input(event):
	if event.is_action_pressed("up"):
		BackgroundMusicScene.POINTS = 0
		get_tree().call_group("Level", "restart")
