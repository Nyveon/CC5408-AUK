extends Node

# Declare member variables here. Examples:
var crono_power = 5 # Multiplicador para que sea un poco mas notable el poder de cronomancia
var time=100.0 setget set_time # Variable de time
var start_position=Vector2(288,144) 
signal time_changed(value)

var dialogue_box = -1

# cutscene options
var on_cutscene = false
var cutscene_move = 0
var cutscene_jump = 0

# lista de niveles
var levels = [
	"res://scenes/Niveles/InitialCutscene.tscn",
	"res://scenes/Niveles/Level1.tscn",
	"res://scenes/Niveles/Level2.tscn",
	"res://scenes/Niveles/Level3.tscn",
	"res://scenes/Niveles/Credits.tscn",
]
# indice de nivel actual
var current_level = 0

# ejemplo cambiar a siguiente nivel:
# var next_level = Manager.current_level + 1
# Manager.current_level = next_level
# get_tree().change_scene(Manager.levels[next_level])

# Si todos los niveles son Level#
# se podría reemplazar el arreglo con generar el string
# usando el current level de manera automática para
# ahorrar espacio de memoria uwu


# Setter del time
func set_time(value):
	time=clamp(value,0,100)
	emit_signal("time_changed", time)

# Funcion para revisar si es legal cronomanciar
func check_time(value):
	var new_time = time + value
	return new_time >= 0 and new_time <= 100

