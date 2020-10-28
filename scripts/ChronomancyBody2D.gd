# !!!OBSOLETO NO USAR!!!

extends KinematicBody2D

class_name ChronomancyBody2D

var t = 0 setget set_t
var selected = false
var time_direction = 0
var moving = false

func set_t(value):
	t = value

func _ready():
	 # Señale de mouse
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func _physics_process(delta):
	time_direction = Input.get_action_strength("dar_tiempo") - Input.get_action_strength("quitar_tiempo")
	var is_pressed = Input.is_action_pressed("dar_tiempo") or Input.is_action_pressed("quitar_tiempo")
	
	if not Manager.check_time(-time_direction):
		return
	
	if not is_pressed:
		moving = false
	
	if selected or moving:
		moving = is_pressed
		self.t += time_direction * Manager.crono_power  # Self porque es un setter (!)
		Manager.time -= time_direction

# Seleecionado, o no seleccionado
func _on_mouse_entered():
	selected = true
	
func _on_mouse_exited():
	selected = false

