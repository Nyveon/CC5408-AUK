extends Node


# Este es el componente "Cronomanciable" que puede usar cualquier objeto
# Maneja el flujo de tiempo
class_name Chronomancy, "res://sprites/Timer.svg"

# Inicializacion de variables
var t = 0 setget set_t		# Tiempo del objeto cronomanciable
var selected = false		# Si el mouse esta en el objeto
var time_direction = 0		# Direccion en el tiempo que se mueve
var moving = false			# Si el objeto se mueve en el tiempo ahora
var at_limit = false		# Si el objeto se encuentra en el limite de la vida
var crono_cost = 1 #multiplicador a cuanto tiempo cuesta moverse
signal time_changed(value)	# Señal que indica un delta t
onready var shader_outline = preload("res://shaders/outline.tres") # Shader de outline
onready var chroma_ab = preload("res://shaders/chromatic_aberration.tres") # Shader de chromab

# set_t Default
# Esto se sobreescribe en cualquier objeto con comportamiento especial
func set_t(value):
	t = value
	emit_signal("time_changed", t)


# Determina si puede absorver más tiempo o no
func can_receive_time(t):
	var new_t = get_parent().current_time + t
	var it_can = new_t < get_parent().time_max and new_t > get_parent().time_min
	if it_can:
		get_parent().current_time = new_t
		return true
	return false
	
func is_at_limit():
	var a = get_parent().current_time + Manager.crono_power #Cambiar esto si se cambia como funciona cronopower
	var b = get_parent().current_time - Manager.crono_power
	return a >= get_parent().time_max or b <= get_parent().time_min

# Step
func _physics_process(delta):
	# -Definir accion de cronomancia
	# time_driection: Hacia el pasado (-1), el futuro (1) o congelado (0)
	time_direction = Input.get_action_strength("dar_tiempo") - Input.get_action_strength("quitar_tiempo")  
	# is_pressed: si algun input esta apretado, esto sirve por si time_driection es 0 porque ambas teclas estan apretadas.
	var is_pressed = Input.is_action_pressed("dar_tiempo") or Input.is_action_pressed("quitar_tiempo")
	
	# Si el cambio en tiempo lo pondria fuera del rango 0-100
	if not Manager.check_time(-time_direction):
		return	# shao pescao
	
	# Si no se esta apretando nada, no se esta moviendo
	if not is_pressed:
		moving = false
	
	# Si esta seleccionado o moviendose
	# (Piensen en moviendose como un toggle de seleccionado, que solo se desactiva al parar de poner una tecla)
	if selected or moving:
		
		# Si el objeto llegó a su límite de tiempo
		if not can_receive_time(-time_direction * Manager.crono_power):
			return  # xao pescao
		
		get_parent().set_material(shader_outline)
		moving = is_pressed  # Si algo esta apretado, se esta moviendo en el tiempo
		self.t += time_direction * Manager.crono_power  # Self porque es un setter (!)
		Manager.time -= 0.2*time_direction * crono_cost # Cambiar recurso en jugador
	else:
		get_parent().set_material(null)
	
	if is_at_limit():
		get_parent().set_material(chroma_ab) # Shader para mostrar que esta en el borde del tiempo


# Seleccionado, o no seleccionado
func mouse_entered():
	selected = true
func mouse_exited():
	selected = false
