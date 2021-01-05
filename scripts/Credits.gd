extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var credits = [
	"Autoría:\nAuk Producciones\nFCFM Uchile\n2020",
	"Agradecemos a los propietarios\nde los siguientes assets utilizados:",
	"SanctumPixel\nFire Column Pixel Art Effect",
	"LuizMelo\nMedieval Warrior Pack 2",
	"KnoblePersona\nSteampunk Level Tileset Mega Pack",
	"Trixie\nStringstar Fields"
]

var counter=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func next_credit():
	if(counter < credits.size()):
		get_node("Text").set_text(credits[counter])
		counter+=1
	else:
		get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
