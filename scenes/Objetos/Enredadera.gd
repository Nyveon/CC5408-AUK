extends KinematicBody2D


func _on_Area2D_body_entered(body):
	if body.get_name() == "Character":
		body.on_vines = true


func _on_Area2D_body_exited(body):
	if body.get_name() == "Character":
		body.on_vines = false


# Variables cronomanticos
var time_max = 1200
var time_min = -1200
var time_max_local = time_max - 250
var current_time = 0

# set_t esta ausente porque no hace nada esta caldera xd
func set_t(t):
	current_time = clamp(current_time, 0, time_max_local)
	$AnimationPlayer.seek(12 - t/time_max_local*11, true)
	pass


# Inicio
func _ready():
	$AnimationPlayer.play("growth")
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
