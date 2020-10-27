extends KinematicBody2D

# A
onready var init_pos = global_position
var t = 0 setget set_t
var periodo = 200.0
var amplitud = 84
func set_t(value):
	t = value
	var old_global_positionx = global_position.x
	var new_global_position = init_pos + Vector2(movement_x(t), movement_y(t))
	global_position = new_global_position
	var delta_pos = new_global_position.x - old_global_positionx
	$Engranaje.rotation_degrees += 3*delta_pos
	print(delta_pos)


# $Engranaje.rotation_degrees += t * sign(cos(t/periodo))

# movimiento ida y vuelta
func movement_x(t):
	return amplitud*sin(t/periodo)

# sin movimiento
func movement_y(t):
	return 0

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("mouse_entered", self, "_on_mouse_entered")  # Señale de mouse

# dile al Main que este es el nodo seleccionado
func _on_mouse_entered():
	Manager.selected_node = self
