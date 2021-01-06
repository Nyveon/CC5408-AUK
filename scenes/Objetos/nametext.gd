extends RichTextLabel

# Variables default de dialogo, al invocar la caja hay que cambiar esto
var dialogue = ["default"]
var page = 0 
	
func _physics_process(delta):
	set_bbcode(dialogue[page][1])
