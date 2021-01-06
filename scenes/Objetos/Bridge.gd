extends KinematicBody2D

# Variables cronomanticos
var time_max = 1200
var time_min = -1200
var time_max_local = time_max - 250
var current_time = time_max_local

# set_t esta ausente porque no hace nada esta caldera xd
func set_t(t):
	current_time = clamp(current_time, 0, time_max_local)
	$AnimationPlayer.seek(t/time_max_local*11, true)
	print(t)
	pass



# Inicio
func _ready():
	$AnimationPlayer.play("bridge")
	# Usar componente de Chronomancy
	$Chronomancy.connect("time_changed", self, "set_t")
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")
	$Chronomancy.t = current_time


# To be selecionado, o no seleccionado
func _on_mouse_entered():
	$Chronomancy.mouse_entered()
func _on_mouse_exited():
	$Chronomancy.mouse_exited()
