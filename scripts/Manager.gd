extends Node

# Declare member variables here. Examples:
var selected_node
var crono_power = 5 # Multiplicador para que sea un poco mas notable el poder de cronomancia
var time=100.0 setget set_time #variable de time
signal time_changed(value)

func set_time(value):
	print(value)
	time=clamp(value,0,100)
	print(time)
	emit_signal("time_changed", time)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta): 
#	if selected_node != null:
#		if Input.get_action_strength("dar_tiempo") and time>0:
#			selected_node.t += crono_power
#			set_time(time-0.25)
#		if Input.get_action_strength("quitar_tiempo") and time>=0 and time<100:
#			selected_node.t -= crono_power
#			set_time(time+0.25)
			
func is_time_available():
	return time >= 0 and time <= 100

func check_time(value):
	var new_time = time + value
	return new_time >= 0 and new_time <= 100

