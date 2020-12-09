extends Node2D


# time since start of cutscene
var time = -8  # empieza en negativo por el fadeout uwu

# to ensure one activation
var set_1 = false
var set_1_7 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Manager.on_cutscene = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	time += delta
	
	# move right and jump
	if time > 1 and not set_1:
		Manager.cutscene_move = 1
		Manager.cutscene_jump = 1
		set_1 = true
	
	# stop moving
	if time > 1.7 and not set_1_7:
		Manager.cutscene_move = 0
		set_1_7 = true
