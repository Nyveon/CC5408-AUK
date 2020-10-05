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
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	t += 1 # temporal
	self.position = init_pos + Vector2(movement_x(t), movement_y(t))
