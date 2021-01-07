extends Node2D

# No se porque esto esta aqui tbh
func _ready():
	Manager.connect("time_changed", self, "_set_time")

# Comunicarle el valor del tiempo a la barra de tiempo
func _set_time(value):
		$CanvasLayer/ProgressBar.value = value
