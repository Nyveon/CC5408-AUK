extends Node

# Declare member variables here. Examples:
var crono_power = 5 # Multiplicador para que sea un poco mas notable el poder de cronomancia
var time=100.0 setget set_time # Variable de time
var start_position=Vector2(288,144)
signal time_changed(value)

# Setter del time
func set_time(value):
	time=clamp(value,0,100)
	emit_signal("time_changed", time)

# Funcion para revisar si es legal cronomanciar
func check_time(value):
	var new_time = time + value
	return new_time >= 0 and new_time <= 100

