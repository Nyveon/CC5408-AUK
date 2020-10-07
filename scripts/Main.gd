extends Node2D


# Declare member variables here. Examples:
var selected_node
var crono_power = 5 # Multiplicador para que sea un poco mas notable el poder de cronomancia

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta): 
	if selected_node != null:
		if Input.get_action_strength("dar_tiempo"):
			selected_node.t += crono_power # hay que linkear a click izq/der
		elif Input.get_action_strength("quitar_tiempo"):
			selected_node.t -= crono_power 
