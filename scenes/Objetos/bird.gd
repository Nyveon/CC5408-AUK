extends KinematicBody2D


# Inicializacion de variables
onready var init_pos = position

# variables para checkeo de limites de tiempo
var current_time = 0
var time_max = 1024
var time_min = -1024
var fire_speed = 0.1
var fire_frame = 0

# Inicio
func _ready():
	
	# Usar componente de Chronomancy
	$Chronomancy.connect("time_changed", self, "set_t")
	$Chronomancy.crono_cost = 0.1
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")
	$Chronomancy.t = 0


# Funcion: ¿Que pasa cuando cambia el tiempo?
func set_t(t):
	
	# Animacion de la posicion
	var global_position_old_x = global_position.x
	var global_position_new = init_pos + Vector2(movement_x(t), movement_y(t))
	global_position = global_position_new
	
	var delta_pos = global_position_new.x - global_position_old_x 
	
	# Animacion del pajaro
	fire_frame += fire_speed * sign(delta_pos)
	# Animacion del pajaro
	$AnimatedSprite.frame = int(floor(abs(fire_frame))) % 6 # loop




# Movimiento de ida y vuelta en x
func movement_x(t):
	return t*0.1


# Sin movimiento en y
func movement_y(t):
	return 0


# To be selecionado, o no seleccionado
func _on_mouse_entered():
	$Chronomancy.mouse_entered()
func _on_mouse_exited():
	$Chronomancy.mouse_exited()
