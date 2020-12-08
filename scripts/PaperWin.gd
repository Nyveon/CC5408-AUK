extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_PaperWin_body_entered(body):
	
	if body.get_name() == "Character":
		# termina cutscene
		Manager.on_cutscene = false
		Manager.cutscene_jump = 0
		Manager.cutscene_move = 0
		# obtiene indice de próximo nivel
		var next_level = Manager.current_level + 1
		# actualiza variable nivel
		Manager.current_level = next_level
		# cambia de nivel
		get_tree().change_scene(Manager.levels[next_level])
