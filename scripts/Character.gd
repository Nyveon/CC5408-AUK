extends KinematicBody2D


# Declare member variables here. Examples:
var speed_x = 400
var speed_y = 700
var friction = 0.2
var gravity = 60

var linear_vel = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var target_vel = Input.get_action_strength("move_right") -\
					 Input.get_action_strength("move_left")
	
	linear_vel.x = lerp(linear_vel.x, target_vel * speed_x, friction)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		linear_vel.y -= speed_y
	linear_vel.y += gravity
	
	linear_vel = move_and_slide(linear_vel, Vector2.UP)
	
