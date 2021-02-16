extends Node2D


var SPEED
var DEFAULT_SPEED = 4
var motion = Vector2(0,0)
var gap_sizes = [900, 1000, 850]
var random_centers = [100, 200, 300, 400]
var current_gap_size;
onready var topSpike = $TopSpike;
onready var bottomSpike = $BottomSpike;

func _ready():
	var current_gap_size = gap_sizes[randi() % gap_sizes.size()]
	topSpike.position.y = topSpike.position.y + (current_gap_size/2)
	bottomSpike.position.y = bottomSpike.position.y - (current_gap_size/2)
	position.y = random_centers[randi() % random_centers.size()]

func _process(delta):
	move()

func move():
	if (SPEED == null):
		SPEED = DEFAULT_SPEED
	position.x -= SPEED
