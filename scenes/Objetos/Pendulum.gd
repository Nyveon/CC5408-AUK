extends KinematicBody2D


# Inicializacion de variables
onready var init_pos = global_position

# variables para checkeo de limites de tiempo
var current_time = 100
var time_max = 2000
var time_min = -2000
var omega = 0.006
var angle_0 = 0
var angle = 0
var arm_length = 128


# Inicio
func _ready():
	
	# Usar componente de Chronomancy
	$Chronomancy.connect("time_changed", self, "set_t")
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")
	$Chronomancy.t = 0


# Funcion: ¿Que pasa cuando cambia el tiempo?
func set_t(t):
	angle = cos(omega*t + angle_0)
	# Animacion de la posicion
	var global_position_new = init_pos + Vector2(movement_x(angle), movement_y(angle))
	global_position = global_position_new
	$Arm.rotation = angle


# Movimiento de ida y vuelta en x
func movement_x(angle):
	return -arm_length*sin(angle)
	#return -sin(t/200)*100


# Sin movimiento en y
func movement_y(angle):
	return arm_length*cos(angle)
	#return sin(t/200)*100


# To be selecionado, o no seleccionado
func _on_mouse_entered():
	$Chronomancy.mouse_entered()
func _on_mouse_exited():
	$Chronomancy.mouse_exited()
