extends KinematicBody2D

var player_name = "Felipe"
var zz = "Elías"
var state = 0

var dialogue = [
[	"¡Es una hoja de tu libro! Parece estar afectada por los cronoíndices...",  zz],
[	"De nuevo, ¿crono-qué?", player_name],
[	"Cronoíndice, es lo que usamos mi hermano y yo para llegar a tu mundo.", zz],
[	"Si tocas el papel para recuperarlo deberías transportarte a otro lugar en el espacio.", zz],
["Debemos alcanzar a mi hermano, ¡apresúrate y tómalo!", zz]
]

var dialogue2 = [
[	"...", zz],
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
	else:
		if !is_instance_valid(Manager.dialogue_box):
			if Input.is_mouse_button_pressed(1):
				Manager.dialogue_box = load("res://scenes/Objetos/DialogueBox.tscn").instance()
				Manager.dialogue_box.get_node("Text").dialogue = dialogue2
				Manager.dialogue_box.get_node("NameText").dialogue = dialogue2
				get_parent().add_child(Manager.dialogue_box)
				state = 2
