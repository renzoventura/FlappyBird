extends Node2D

var middleSpawnPoint = Vector2(1068.819946, 240.779007)

onready var timer = $Timer

func _ready():
	timer.start()

var POINT = 0

func generate_hazard():
	var hazards = preload("res://scenes/Spikes.tscn")
	var hazardsInstance = hazards.instance();
	hazardsInstance.position = middleSpawnPoint;
	get_node("Spikes").add_child(hazardsInstance)

func _on_Timer_timeout():
	timer.start()
	generate_hazard() # Replace with function body.

func addPoint():
	POINT += 1
	print(POINT)
