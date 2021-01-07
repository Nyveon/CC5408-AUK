extends KinematicBody2D


# Inicializacion de variables
onready var init_pos = global_position
var period = 200.0
var amplitude = 120

# variables para checkeo de limites de tiempo
var current_time = 0
var time_max = 200
var time_min = -200

# Inicio
func _ready():
	$Chronomancy.crono_cost = 1
	# Usar componente de Chronomancy
	$Chronomancy.connect("time_changed", self, "set_t")
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")


# Funcion: ¿Que pasa cuando cambia el tiempo?
func set_t(t):
	
	# Animacion de la posicion
	var global_position_old_y = global_position.y
	var global_position_new = init_pos + Vector2(movement_x(t), movement_y(t))
	global_position = global_position_new
	var delta_pos = global_position_new.y - global_position_old_y
	
	# Animacion del engranaje
	$Engranaje.rotation_degrees += 3 * delta_pos


# Movimiento de ida y vuelta en x
func movement_x(t):
	return 0


# Sin movimiento en y
func movement_y(t):
	return amplitude * sin(t / period)


# To be selecionado, o no seleccionado
func _on_mouse_entered():
	$Chronomancy.mouse_entered()
func _on_mouse_exited():
	$Chronomancy.mouse_exited()
