extends Node2D

var middleSpawnPoint = Vector2(1525, 295)

onready var timer = $Timer
onready var spikes = $Spikes/Spikes
const MAX_SPIKE_SPEED = 8
const MIN_DELAY_TIME = 1
var POINT = 0
var additional_speed = 0.2
var less_delay = 0.2
var spike_speed = 4

func _ready():
	if (not BackgroundMusicScene.playing):
		BackgroundMusicScene.play_game_music()
	timer.start()

func generate_hazard():
	var hazards = preload("res://scenes/Spikes.tscn")
	var hazardsInstance = hazards.instance();
	hazardsInstance.position = middleSpawnPoint;
	hazardsInstance.SPEED = spike_speed
	get_node("Spikes").add_child(hazardsInstance)

func _on_Timer_timeout():
	timer.start()
	generate_hazard()

func addPoint():
	POINT += 1
	adjust_game()
	update_point_gui()

func adjust_game():
	if ((POINT % 5) == 0):
		increase_spike_speed()
	if ((POINT % 10) == 0):
		decrease_spawn_time()

func increase_spike_speed():
	if(spike_speed < MAX_SPIKE_SPEED):
		spike_speed += additional_speed
	
func decrease_spawn_time():
	if(timer.wait_time > MIN_DELAY_TIME):
		timer.wait_time -= less_delay

func stop_spawning():
	timer.stop()

func update_point_gui():
	get_tree().call_group("PointLabels", "updatepoints", POINT)
