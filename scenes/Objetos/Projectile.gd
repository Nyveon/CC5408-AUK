extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	angular_velocity = rand_range(0, 10)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer > 0.2:
		$Area2D.set_collision_layer_bit(3, true)
		$Area2D.set_collision_mask_bit(3, true)
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if "BOSS" in body.name:
		body.hits += 1
		queue_free()
	if "Character" in body.name:
		body.death()
		queue_free()
