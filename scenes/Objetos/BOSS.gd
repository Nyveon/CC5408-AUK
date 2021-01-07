extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const PROJ = preload("res://scenes/Objetos/Projectile.tscn")
const PROJ2 = preload("res://scenes/Objetos/Projectile2.tscn")

var state = 0
var player_name = "Felipe"
var zz = "Zariel"
var dialogue = [
[	"dialogo derrota",  zz],
[	"dialogo derrota 2", zz], 
[	"dialogo derrota 3", zz],
[	"wena", player_name]
]

var GRAVITY = 26 #antes era 20
var linear_vel = Vector2()
var active = false
var pre_active = false
var alive = true
var hits = 0
var attack_timer = 0
var attack_type = 0
var attack_threshold = 4
var proj_speed = 200
var anchor_x = 0
var anchor_y = 0
var pre_alive = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	pre_alive = alive
	$AnimatedSprite.frame = hits
	if hits >= 6:
		alive = false
	if alive:
		$AnimatedSprite.set_flip_h(get_parent().get_node("Character").global_position.x > global_position.x)
		pre_active = active
		if get_parent().get_node("Character").global_position.y > 200:
			active = true
		
		if pre_active != active:
			print("AAAAAAAAAAA")
			get_parent().get_node("CutsceneFinal").play("final2")
		
		if active:
			linear_vel.y += GRAVITY
			linear_vel = move_and_slide(linear_vel, Vector2.UP)
			attack_timer += delta
			if attack_timer < 1:
				anchor_x = global_position.x
				anchor_y = global_position.y
			if attack_timer > attack_threshold - 0.5:
				global_position.x = anchor_x + rand_range(-3,3)
				global_position.y = anchor_y + rand_range(-3,3)
		
			if attack_type == 0:
				if attack_timer > attack_threshold:
					var angle_offset = randf() * 2 * PI
					for i in range(8):
						var _angle = 0.25 * PI * i + angle_offset
						var projectile = PROJ.instance()
						get_parent().add_child(projectile)
						projectile.global_position = global_position + Vector2(32*cos(_angle), 32*sin(_angle))
						projectile.linear_velocity = Vector2(proj_speed*cos(_angle), proj_speed*sin(_angle))
					attack_timer = 0
					attack_type = 1
			if attack_type == 1:
				if attack_timer > attack_threshold:
					for i in range(4):
						var projectile = PROJ2.instance()
						get_parent().add_child(projectile)
						projectile.global_position = global_position + Vector2(180 - i*42, -160 - i*72)
						projectile = PROJ2.instance()
						get_parent().add_child(projectile)
						projectile.global_position = global_position + Vector2(-180 + i*42, -160 - i*72)
					attack_timer = 0
					attack_type = 0	
	else:
		if state == 1 and !is_instance_valid(Manager.dialogue_box):
			get_parent().get_node("CutsceneFinal").play("final3")
			get_parent().get_node("Door").queue_free()
			state = 2
			$Particles2D.emitting = false
	if pre_alive != alive:
		$Particles2D.emitting = true
		pass

func _on_BOSS_input_event(viewport, event, shape_idx):
	if not alive:
		if !is_instance_valid(Manager.dialogue_box):
			if Input.is_mouse_button_pressed(1):
				Manager.dialogue_box = load("res://scenes/Objetos/DialogueBox.tscn").instance()
				Manager.dialogue_box.get_node("Text").dialogue = dialogue
				Manager.dialogue_box.get_node("NameText").dialogue = dialogue
				get_parent().add_child(Manager.dialogue_box)
				state = 1
