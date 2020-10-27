extends Node2D

func _ready():
	Manager.connect("time_changed", self, "_set_time")

func _set_time(value):
	$CanvasLayer/ProgressBar.value = value
