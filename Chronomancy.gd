extends Node


# Este es el componente "Cronomanciable" que puede usar cualquier objeto
# Maneja el flujo de tiempo
class_name Chronomancy, "res://sprites/Timer.svg"

# Inicializacion de variables
var t = 0 setget set_t		# Tiempo del objeto cronomanciable
var selected = false		# Si el mouse esta en el objeto
var time_direction = 0		# Direccion en el tiempo que se mueve
var moving = false			# Si el objeto se mueve en el tiempo ahora
signal time_changed(value)	# Señal que indica un delta t


# set_t Default
# Esto se sobreescribe en cualquier objeto con comportamiento especial
func set_t(value):
	t = value
	emit_signal("time_changed", t)


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
		moving = is_pressed # Si algo esta apretado, se esta moviendo en el tiempo
		self.t += time_direction * Manager.crono_power  # Self porque es un setter (!)
		Manager.time -= 0.2*time_direction # Cambiar recurso en jugador


# Seleccionado, o no seleccionado
func mouse_entered():
	selected = true
func mouse_exited():
	selected = false
