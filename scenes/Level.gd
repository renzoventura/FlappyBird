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
	show_start_gui()
	pause_game()
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

func showGameGui():
	clear_gui()
	var death_gui = preload("res://scenes/GUI.tscn")
	$GUI.add_child(death_gui.instance())
	
func show_death_gui():
	clear_gui()
	var death_gui = preload("res://scenes/DeathGUI.tscn")
	$GUI.add_child(death_gui.instance())

func show_start_gui():
	var death_gui = preload("res://scenes/StartScreen.tscn")
	$GUI.add_child(death_gui.instance())

func restart():
	get_tree().reload_current_scene()

func pause_game():
	get_tree().paused = true

func resume_game():
	get_tree().paused = false
	showGameGui()

func clear_gui():
	for i in range(0, $GUI.get_child_count()):
		$GUI.get_child(i).queue_free()
		
