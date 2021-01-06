extends KinematicBody2D

var player_name = "Felipe"
var zz = "Elías"
var state = 0

var dialogue = [
[	"¡Oye devuélveme mi libro, tú... extraña criatura!", player_name],
[	"¿Qué libro? Esta es la primera vez que te veo", "???"],
[	"No te hagas el tonto, caíste por mi techo y me robaste mi libro hace un momento.",  player_name],
[	"Oh, debes haberte confundido, yo soy Elías. ¿te encontraste a mi hermano gemelo?", zz],
[	"¿Hermano gemelo? (¿O sea que esta cosa tiene padres?...) ¿Dónde está él ahora?",  player_name],
[	"No lo sé, yo también intento buscarlo. ¿Me ayudarías?", zz],
[	"Él es realmente peligroso. Ya viste lo que le hizo al mundo", zz],
[	"¿Le hizo qué a qué?",  player_name],
[	"Al mundo, ya sabes, detener el tiempo y eso. Por cierto, ¿cómo es que puedes moverte?", zz],
[	"¿Detener el tiempo? ¿De qué hablas?",  player_name],
[	"...", zz],
[	"OH NO",  player_name],
[	"¿Cómo es que recién acabas de notarlo? ¡Llevamos así más de una semana!", zz],
[	"¡Estaba ocupado leyendo en mi estudio!",  player_name],
[	"[Solo es tu habitación]", "Narrador"],
[	"[Han pasado 3 meses desde la última vez que saliste]", "Narrador"],
[	"Bueno, eso no importa, debemos detener a mi hermano. ¿Sabes usar Cronomancia?", zz],
[	"¿Crono-qué?",  player_name],
[	"¿Tengo que enseñarte todo? Haz click en ese pájaro", zz]
]

var dialogue2 = [
[	"¿¡ Yo hice eso !?", player_name],
[	"Si puedes moverte sabía que tendrías este poder", zz],
[	"Debes ayudarme a encontrar a mi hermano con él", zz],
[	"De momento solo sigue adelante, ¡no puede haber ido lejos!", zz],
]

var dialogue3 = [
	["...", zz]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("Blink")



func _physics_process(delta):
	get_node("Eyes").set_flip_h(get_parent().get_node("Character").global_position.x > global_position.x)

func _on_Zariel_input_event(viewport, event, shape_idx):
	if state == 0:
		if !is_instance_valid(Manager.dialogue_box):
			if Input.is_mouse_button_pressed(1):
				Manager.dialogue_box = load("res://scenes/Objetos/DialogueBox.tscn").instance()
				Manager.dialogue_box.get_node("Text").dialogue = dialogue
				Manager.dialogue_box.get_node("NameText").dialogue = dialogue
				get_parent().add_child(Manager.dialogue_box)
				state = 1
	elif state == 1:
		if !is_instance_valid(Manager.dialogue_box):
			if Input.is_mouse_button_pressed(1):
				Manager.dialogue_box = load("res://scenes/Objetos/DialogueBox.tscn").instance()
				Manager.dialogue_box.get_node("Text").dialogue = dialogue2
				Manager.dialogue_box.get_node("NameText").dialogue = dialogue2
				get_parent().add_child(Manager.dialogue_box)
				state = 2
	else:
		if !is_instance_valid(Manager.dialogue_box):
			if Input.is_mouse_button_pressed(1):
				Manager.dialogue_box = load("res://scenes/Objetos/DialogueBox.tscn").instance()
				Manager.dialogue_box.get_node("Text").dialogue = dialogue3
				Manager.dialogue_box.get_node("NameText").dialogue = dialogue3
				get_parent().add_child(Manager.dialogue_box)
