extends RichTextLabel

# Variables default de dialogo, al invocar la caja hay que cambiar esto
var dialogue = ["Hola! Esto es una caja de dialogo owo", "-insertar easter egg de arturo pratt-"]
var page = 0 

func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)
	
# Que hacer ucando el jugador hace click
func _input(event):
	if Input.is_mouse_button_pressed(1):
		if get_visible_characters() > get_total_character_count(): # Avanzar pagina
			if page < dialogue.size()-1:
				page += 1 
				set_bbcode(dialogue[page])
				set_visible_characters(0)
			else:
				get_parent().queue_free() # Cerrar dialogo cuando se termine la ultima pagina
		else:
			set_visible_characters(get_total_character_count()) # Saltar animacion de texto
		

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1) # Animacion de texto
