extends KinematicBody2D

# A
onready var init_pos = global_position
var t = 0 setget set_t
var periodo = 200.0
var amplitud = 84
var selected = false
var time_direction = 0
var moving = false

func set_t(value):
	t = value
	var old_global_positionx = global_position.x
	var new_global_position = init_pos + Vector2(movement_x(t), movement_y(t))
	global_position = new_global_position
	var delta_pos = new_global_position.x - old_global_positionx
	$Engranaje.rotation_degrees += 3*delta_pos

# movimiento ida y vuelta
func movement_x(t):
	return amplitud*sin(t/periodo)

# sin movimiento
func movement_y(t):
	return 0

# Called when the node enters the scene tree for the first time.
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
		self.t += time_direction*Manager.crono_power  # Self porque es un setter (!)
		Manager.time -= time_direction
	
	
	print("Moving: ", moving)
	print("Selected: ", selected)
	print("Time: ", Manager.time)
	

# Seleecionado, o no seleccionado
func _on_mouse_entered():
	selected = true
	
func _on_mouse_exited():
	selected = false

