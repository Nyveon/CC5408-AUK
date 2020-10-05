extends StaticBody2D


# Declare member variables here. Examples:
var t = 0
var init_pos = self.position

# movimiento ida y vuelta
func movement_x(t):
	return 100*cos(t/75.0)

# sin movimiento
func movement_y(t):
	return 0

# Called when the node enters the scene tree for the first time.
func ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	self.position = init_pos + Vector2(movement_x(t), movement_y(t))

# dile al Main que este es el nodo seleccionado
func _on_MovingPlatform_mouse_entered():
	get_node("../../Main").selected_node = self
