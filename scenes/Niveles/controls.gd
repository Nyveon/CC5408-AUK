extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var d = global_position.distance_to(get_parent().get_node("Character").global_position)
	set_modulate(Color(1, 1, 1, clamp(980/(d*d), 0, 1)))
