extends KinematicBody2D


# Declare member variables here. Examples:
var speed_x = 180
var speed_y = 300
var friction = 0.2
var gravity = 20
var state_grounded = true  # Si el jugador esta en el piso o no




var linear_vel = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	# Signal de cuando sale del nivel.
	get_node("VisibilityNotifier2D").connect("screen_exited", self, "_on_screen_exited")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# Movimiento horizontal
	var target_vel = Input.get_action_strength("move_right") -\
					 Input.get_action_strength("move_left")
	linear_vel.x = lerp(linear_vel.x, target_vel * speed_x, friction)
	
	# Salto
	if is_on_floor():
		state_grounded = true
		if Input.is_action_just_pressed("jump"):
			linear_vel.y -= speed_y
	else:
		state_grounded = false
		
	linear_vel.y += gravity
	
	linear_vel = move_and_slide(linear_vel, Vector2.UP)
	
	# Estado de animacion (perdon por no usar el arbol de animaciones Elias T_T)
	if state_grounded: # Animacion de correr/Idle
		if target_vel != 0:
			$AnimatedSprite.play("Run")
		else:
			$AnimatedSprite.play("Idle")
	else: # Animacion de subida/caida
		if linear_vel.y > 0:
			$AnimatedSprite.play("Jump")
		if linear_vel.y < 0:
			$AnimatedSprite.play("Fall")
	# Flip horizontal en direccion de movimiento
	if linear_vel.x > 0:
		$AnimatedSprite.flip_h = false
	elif linear_vel.x < 0:
		$AnimatedSprite.flip_h = true
		
	
	
	
# Funcion de muerte. Llamar cuando el jugador muera
func death():
	get_tree().reload_current_scene()
	
# Muerte al salir de la pantalla
func _on_screen_exited():
	death()
