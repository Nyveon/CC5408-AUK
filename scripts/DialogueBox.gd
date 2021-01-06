extends RichTextLabel

# Variables default de dialogo, al invocar la caja hay que cambiar esto
var dialogue = ["AAAAAAAAA NO TENGO DIALOGO AAAAAAAAAAAAAAAAAA", "a"]
var page = 0 

func _ready():
	set_bbcode(dialogue[page][0])
	set_visible_characters(0)
	set_process_input(true)
	
# Que hacer ucando el jugador hace click
func _input(event):
	#if Input.is_mouse_button_pressed(1):
	if event.is_action_pressed("dar_tiempo"):
		if get_visible_characters() > get_total_character_count(): # Avanzar pagina
			if page < dialogue.size()-1:
				page += 1 
				set_bbcode(dialogue[page][0])
				set_visible_characters(0)
			else:
				get_parent().queue_free() # Cerrar dialogo cuando se termine la ultima pagina
		else:
			set_visible_characters(get_total_character_count()) # Saltar animacion de texto
		

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1) # Animacion de texto

func _physics_process(delta):
	if dialogue[page][1] == "Elías":
		pass
	get_parent().get_node("NameText").page = page
