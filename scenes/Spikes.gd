extends Node2D


var SPEED
var DEFAULT_SPEED = 4
var motion = Vector2(0,0)
var gap_sizes = [1010, 1050, 1200, 1100]
var random_centers = [-50 ,0, 50, 100, 150, 200, 250, 300, 350, 400, 450]
var current_gap_size;
var is_moving = true
onready var topSpike = $TopSpike;
onready var bottomSpike = $BottomSpike;

func _ready():
	var current_gap_size = gap_sizes[randi() % gap_sizes.size()]
	topSpike.position.y = topSpike.position.y + (current_gap_size/2)
	bottomSpike.position.y = bottomSpike.position.y - (current_gap_size/2)
	position.y = random_centers[randi() % random_centers.size()]

func _process(delta):
	if (is_moving):
		move()

func move():
	if (SPEED == null):
		SPEED = DEFAULT_SPEED
	position.x -= SPEED

func stop():
	is_moving = false
