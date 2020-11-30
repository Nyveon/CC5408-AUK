extends KinematicBody2D

# Variables cronomanticos
var current_time = 0
var time_max = 200
var time_min = -200


# set_t esta ausente porque no hace nada esta caldera xd
func set_t(t):
	pass


# can_recieve_time esta ausente porque no hace nada esta caldera xd
func can_receive_time(t):
	return true


# Inicio
func _ready():
	
	# Usar componente de Chronomancy
	$Chronomancy.connect("time_changed", self, "set_t")
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")


# To be selecionado, o no seleccionado
func _on_mouse_entered():
	$Chronomancy.mouse_entered()
func _on_mouse_exited():
	$Chronomancy.mouse_exited()
