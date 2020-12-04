extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("Blink")



func _physics_process(delta):
	get_node("Eyes").set_flip_h(get_parent().get_node("Character").global_position.x > global_position.x)
	
		
	

