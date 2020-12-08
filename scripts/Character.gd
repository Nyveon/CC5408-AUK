extends KinematicBody2D


# Declare member variables here. Examples:
var speed_x = 180
var speed_y = 300
var FRICTION = 0.2
var GRAVITY = 20
var state_grounded = true  # Si el jugador esta en el piso o no
var linear_vel = Vector2()


# Start
func _ready():
	# Signal de cuando sale del nivel.
	get_node("VisibilityNotifier2D").connect("screen_exited", self, "_on_screen_exited")


# Step
func _physics_process(delta):
	
	var target_vel = 0
	
	if Manager.on_cutscene:
		target_vel = Manager.cutscene_move
		if Manager.cutscene_jump:
			linear_vel.y -= speed_y
			Manager.cutscene_jump = 0
	
	else:
		
		# Movimiento horizontal
		target_vel = Input.get_action_strength("move_right") -\
					Input.get_action_strength("move_left")
		
		# Salto
		if is_on_floor():
			state_grounded = true
			if Input.is_action_just_pressed("jump"):
				linear_vel.y -= speed_y
		else:
			state_grounded = false
	
	linear_vel.x = lerp(linear_vel.x, target_vel * speed_x, FRICTION)
	linear_vel.y += GRAVITY
	
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


# Metodo de muerte. Llamar cuando el jugador muera
func death():
	Manager.time = 100.0
	get_tree().reload_current_scene()
	

# Método para detectar caída al vacío
func _on_Muerte_al_caer_body_entered(body):
	if body.get_name() == "Character":
		body.death()


# Por alguna razón al salir pedía este método, idealmente deberíamos
# ver de dónde se llama para que no se llame de partida, pero weno,
# esto evita el error por ahora B)
func _on_screen_exited():
	pass
