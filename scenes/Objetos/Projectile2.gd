extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var GRAVITY = 12 #antes era 20
var linear_vel = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	linear_vel.y += GRAVITY
	linear_vel = move_and_slide(linear_vel, Vector2.UP)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if "Character" in body.name:
		body.death()
		queue_free()

