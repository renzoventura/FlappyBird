extends KinematicBody2D

var SPEED = 800;
var JUMP_SPEED = 800;
var GRAVITY = 40;
var MAX_FALL_SPEED = 2000;

var motion = Vector2(0,0)
var motion_up = Vector2(0,-1)

var dead = false

onready var oofSfx = $Oof
onready var jumpSfx = $Jump
var pitch_scales = [0.9, 1.0, 1.2, 1.4]

func _ready():
	pass 
	
func _process(delta):
	update_rotation()
	apply_gravity()
	#move()
	if(!dead):
		jump();
	move_and_slide(motion, motion_up)
	
func jump():
	if (Input.is_action_just_pressed("up") and !dead):
		play_jump()
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

func died():
	if(!dead):
		oofSfx.pitch_scale = pitch_scales[randi() % pitch_scales.size()]
		oofSfx.play()
	dead = true
	get_tree().call_group("Level", "show_death_gui")

func update_rotation():
	if(motion.y < 0):
		rotation_degrees = -10
		return
	elif (motion.y < 120):
		rotation_degrees = 20
		return
	elif (motion.y < 240):
		return
		rotation_degrees = 40


func play_jump():
	jumpSfx.pitch_scale = pitch_scales[randi() % pitch_scales.size()]
	jumpSfx.play()
