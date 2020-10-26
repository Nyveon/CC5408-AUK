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


func _on_Spikes_body_entered(body):
	if (body.get_name() == "Character"): # Cambie esto a que solo sea cuando toque el jugador, si no se crasheaba infinitamente al tocar un elemento del nivel
		get_parent().get_node("Character").death()

