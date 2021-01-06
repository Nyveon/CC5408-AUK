extends Node2D

var player_name = "Felipe"
var nn = "Narrador"
var state = 0
var pre_page = 0
var dialogue_done = false

var dialogue = [
[	"*Bostezo* Otra buena noche de sueño, ahora a seguir con lo importante.", player_name],
[	"[Son las 6 pm]\n[Miras a la estantería]", nn],
[	"Oh, aún no he leído este", player_name],
[	"[Algo suena en el techo]", nn],
[	"¿Qué fue eso?", player_name],
[	"*BRR* *CRASH* *BOOM*", nn],
[	"Un extraño reloj cae a través de tu techo", nn],
[	"...", "¿Reloj?"],
[	"¿QUÉ $%&#?", player_name],
[	"[El reloj se abalanza sobre ti y roba tu libro]", nn],
[	"¡Oye devuélveme eso!", player_name]
]



# time since start of cutscene
var time = -2  # empieza en negativo por el fadeout uwu

# to ensure one activation
var set_1 = false
var set_1_7 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Manager.on_cutscene = true
	$Cutscene.play("Cutscene1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	time += delta
	if time > 2 and state == 0:
		Manager.dialogue_box = load("res://scenes/Objetos/DialogueBox.tscn").instance()
		Manager.dialogue_box.get_node("Text").dialogue = dialogue
		Manager.dialogue_box.get_node("NameText").dialogue = dialogue
		get_parent().add_child(Manager.dialogue_box)
		state = 1
	
	if is_instance_valid(Manager.dialogue_box):
		var page = Manager.dialogue_box.get_node("Text").page
		if page != pre_page:
			if page == 2:
				$Cutscene.play("Cutscene1.5")
			if page == 4:
				$Cutscene.play("Cutscene1.75")
			if page == 5:
				$Cutscene.play("Cutscene2")
			if page == 9:
				$Cutscene.play("Cutscene3")
			if page == 10:
				dialogue_done = true
		pre_page = Manager.dialogue_box.get_node("Text").page
	else:
		if dialogue_done:
			if not set_1:
				Manager.cutscene_move = 1
				Manager.cutscene_jump = 1
				set_1 = true
			elif not set_1_7:
				set_1_7 = true
			else:
				Manager.cutscene_jump = 0
		
	
	
	
	
	
	
	

#	# move right and jump
#	if time > 1 and not set_1:
#		Manager.cutscene_move = 1
#		Manager.cutscene_jump = 1
#		set_1 = true
#
#	# stop moving
#	if time > 1.7 and not set_1_7:
#		Manager.cutscene_move = 0
#		set_1_7 = true
