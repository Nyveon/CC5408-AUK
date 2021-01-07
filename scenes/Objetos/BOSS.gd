extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var GRAVITY = 26 #antes era 20
var linear_vel = Vector2()
var active = false
var pre_active = false
var alive = true
var hits = 0
var attack_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if alive:
		$AnimatedSprite.set_flip_h(get_parent().get_node("Character").global_position.x > global_position.x)
		$AnimatedSprite.frame = hits
	
		pre_active = active
		if get_parent().get_node("Character").global_position.y > 200:
			active = true
		
		if pre_active != active:
			print("AAAAAAAAAAA")
			get_parent().get_node("CutsceneFinal").play("final2")
		
		if active:
			linear_vel.y += GRAVITY
			linear_vel = move_and_slide(linear_vel, Vector2.UP)
			attack_timer += delta
			
			if attack_timer > 3:
				print("boom")
				attack_timer = 0
