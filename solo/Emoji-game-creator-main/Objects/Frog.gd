# This gd script is for enemy type forg -  jumps towards player!

extends KinematicBody2D

onready var object_cursor = get_node("/root/main/Editor_Object")
onready var enemy = true

var direction = 0

var start_pos = Vector2(0,0)
var velocity = Vector2()
var init = false

var floor_normal = Vector2(0,-1)

export (int) var speed_x = 2000
export (int) var speed_y = 0
export (int) var GRAVITY = 5000
export (int) var JUMP_FORCE = 5000


func _ready():
	set_process(true)
	set_physics_process(true) 
	pass
	
func _input(event):
	if object_cursor.can_place == false and Input.is_action_pressed("mb_right"):
		get_parent().remove_child(self)
	pass
	
func _process(delta):
	var player = get_parent().get_node("Player")
	if Global.playing == true:
		if player.position.x > position.x and is_on_floor():
			direction = 1
			speed_x = speed_x
			speed_y = - JUMP_FORCE
		if player.position.x < position.x and is_on_floor():
			direction = -1
			speed_x = speed_x
			speed_y = - JUMP_FORCE
		

func _physics_process(delta):
	if init == false:
		start_pos = global_position
		init = true 
		
	if Global.playing == true:
		speed_x = speed_x
		speed_y += GRAVITY * delta
		
		# MOVEMENT VELOCITY CALCULATION
		velocity.x = speed_x * delta * direction
		velocity.y = speed_y * delta 
		
		# MOVEMENT VELOCITY EXECUTE
		velocity = move_and_slide(velocity,floor_normal)
		
	else:
		global_position = start_pos	
	pass

# has to enable pickable for the Kinestaticbody 2D for this to work!	
func _on_Frog_mouse_entered():
	object_cursor.can_place = false
	object_cursor.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_Frog_mouse_exited():
	object_cursor.can_place = true
	object_cursor.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

