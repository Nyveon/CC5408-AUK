extends Node

# Declare member variables here. Examples:
var selected_node
var crono_power = 5 # Multiplicador para que sea un poco mas notable el poder de cronomancia
var tiempo=100 setget set_tiempo #variable de tiempo
signal time_changed(value)

func set_tiempo(value):
	tiempo=clamp(value,0,100)
	emit_signal("time_changed", tiempo)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta): 
	if selected_node != null:
		if Input.get_action_strength("dar_tiempo") and tiempo>0:
			selected_node.t += crono_power # hay que linkear a click izq/der
			set_tiempo(tiempo-0.25)
		elif Input.get_action_strength("quitar_tiempo") and tiempo>=0 and tiempo<100:
			selected_node.t -= crono_power
			set_tiempo(tiempo+0.25)


