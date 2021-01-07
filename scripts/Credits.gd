extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var credits = [
	"Autoría de ChronoIndex:\nAuk Producciones\nFCFM Uchile\nCC5408-1 - Primavera 2020",
	"Integrantes:\nMatías Martínez\nEric P. Kirchgessner.\nAriel Suil A.",
	"Agradecemos a los propietarios\nde los siguientes assets utilizados:",
	"SanctumPixel\nFire Column Pixel Art Effect",
	"LuizMelo\nMedieval Warrior Pack 2",
	"KnoblePersona\nSteampunk Level Tileset Mega Pack",
	"SanctumPixel\nForest Lite Pixel Art Tileset",
	"Trixie\nStringstar Fields",
	"Vnitti\nTaiga Asset Pack",
	"Ma9ici4n\nPixel Art Bird",
	"Daymarius\nRetro Gaming Font",
	"Reemax\n[LPC] House interior and decorations",
	"Bevouliin.com\nFree Game Obstacle - Spikes",
	"Finalmente agradecemos especialmente\na nuestro profesor:\nElías Zelada"
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
		get_tree().change_scene("res://scenes/Niveles/Menu Principal.tscn")
		#get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
