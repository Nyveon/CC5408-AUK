extends Area2D

# Variables cronomanticos
var time_max = 4096
var time_min = 0
var current_time = time_max/2


# set_t esta ausente porque no hace nada esta caldera xd
func set_t(t):
	$AnimationPlayer.seek(10 * current_time/4096)


# can_recieve_time esta ausente porque no hace nada esta caldera xd
func can_receive_time(t):
	return true


# Inicio
func _ready():
	$AnimationPlayer.play("Tree")
	$AnimationPlayer.seek(10 * current_time/4096)
	# Usar componente de Chronomancy
	$Chronomancy.connect("time_changed", self, "set_t")
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")


# To be selecionado, o no seleccionado
func _on_mouse_entered():
	$Chronomancy.mouse_entered()
func _on_mouse_exited():
	$Chronomancy.mouse_exited()


