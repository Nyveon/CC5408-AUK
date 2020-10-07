extends Node2D


# Declare member variables here. Examples:
var selected_node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta): 
	if selected_node != null and Input.get_action_strength("dar_tiempo"):
		selected_node.t += 1 # hay que linkear a click izq/der
