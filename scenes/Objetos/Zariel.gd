extends KinematicBody2D


var dialogue = ["Hola! Esto es una caja de dialogo owo", "-insertar easter egg de arturo pratt aqui-"]


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("Blink")



func _physics_process(delta):
	get_node("Eyes").set_flip_h(get_parent().get_node("Character").global_position.x > global_position.x)

func _on_Zariel_input_event(viewport, event, shape_idx):
	if !is_instance_valid(Manager.dialogue_box):
		if Input.is_mouse_button_pressed(1):
			Manager.dialogue_box = load("res://scenes/Objetos/DialogueBox.tscn").instance()
			Manager.dialogue_box.get_node("Text").dialogue = dialogue
			get_parent().add_child(Manager.dialogue_box)
