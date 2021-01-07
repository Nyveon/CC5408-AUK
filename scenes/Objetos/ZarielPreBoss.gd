extends KinematicBody2D

var player_name = "Felipe"
var zz = "Zariel"
var state = 0
var pre_page = 0
var anchor_x = global_position.x
var anchor_y = global_position.y
var shake = false

var dialogue = [
[	"Oh, Elías, qué bueno que está-",  player_name],
[	"¿GEMELO MALVADO?", player_name], #cambia cara
[	"JAJAJA", zz],
[	"JAJAJAJAJAJAJA", zz],
[	"¿En serio te creíste eso? ¡Siempre fui yo!", zz],
[	"¿Cómo pudiste? Y, ¿¡por qué!? ¿Quién eres realmente?",  player_name],
[	"Soy Zariel el ETERNO, ¡destructor de tu mundo!", zz],
[	"Y ahora que atravezaste todos esos cronoíndices...", zz],
[	"Y causaste todos esas corrupciones de tiempo...", zz],
[	"¡FINALMENTE TIENES EL PODER PARA UNIRTE A MI! Juntos conquistaremos el mundo...", zz],
[ 	"¿Solo el mundo? ¡EL UNIVERSO ENTERO!", zz],
[	"...",  player_name],
[	"¿Qué dices, te unirás a mi?", zz],
[	"No.",  player_name],
[	"¡Pues entonces muere!", zz],
]


# Called when the node enters the scene tree for the first time.
func _ready():
	anchor_x = global_position.x
	anchor_y = global_position.y
	get_node("AnimationPlayer").play("Blink")



func _physics_process(delta):
	if shake:
		global_position.x = anchor_x + rand_range(-2,2)
		global_position.y = anchor_y + rand_range(-2,2)
		
	
	get_node("Eyes").set_flip_h(get_parent().get_node("Character").global_position.x > global_position.x)
	if is_instance_valid(Manager.dialogue_box):
		var page = Manager.dialogue_box.get_node("Text").page
		if page != pre_page:
			if page == 1:
				$Body.visible = false
				$Eyes.visible = false
				$Body2.visible = true
			if page == 2:
				shake = true
		
		pre_page = Manager.dialogue_box.get_node("Text").page
	else:
		if state == 1:
			get_parent().get_node("CutsceneFinal").play("final")
			queue_free()
				

func _on_Zariel_input_event(viewport, event, shape_idx):
	if state == 0:
		if !is_instance_valid(Manager.dialogue_box):
			if Input.is_mouse_button_pressed(1):
				Manager.dialogue_box = load("res://scenes/Objetos/DialogueBox.tscn").instance()
				Manager.dialogue_box.get_node("Text").dialogue = dialogue
				Manager.dialogue_box.get_node("NameText").dialogue = dialogue
				get_parent().add_child(Manager.dialogue_box)
				state = 1
