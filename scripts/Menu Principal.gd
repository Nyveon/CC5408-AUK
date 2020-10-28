extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/VBoxContainer/Start.connect("pressed", self, "on_Start_pressed")  # Señales del boton de start 
	$Panel/VBoxContainer/Exit.connect("pressed", self, "on_Exit_pressed")   # Señales del boton de exit

# Recibir señal del boton de start
func on_Start_pressed():
	get_tree().change_scene("res://scenes/Niveles/Main.tscn")

# Recibir señal del boton de exit
func on_Exit_pressed():
	get_tree().quit()  # Cierra el juego
