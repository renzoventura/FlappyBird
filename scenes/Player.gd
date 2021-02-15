extends KinematicBody2D

var SPEED = 800;
var JUMP_SPEED = 800;
var GRAVITY = 40;
var MAX_FALL_SPEED = 2000;

var motion = Vector2(0,0)
var motion_up = Vector2(0,-1)

func _ready():
	pass 
	
	
func _process(delta):
	apply_gravity()
	#move()
	jump();
	move_and_slide(motion, motion_up)
	
func jump():
	if Input.is_action_just_pressed("up"):
		motion.y = -SPEED
		
func apply_gravity():
	if is_on_floor() and motion.y > 0: 
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		if(motion.y < MAX_FALL_SPEED):
			motion.y += GRAVITY

func move():
	if Input.is_action_pressed("left") and not Input.is_action_just_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_just_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0
