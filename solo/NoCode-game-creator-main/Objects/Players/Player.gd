extends KinematicBody2D
# This gd script is for player control!
onready var object_cursor = get_node("/root/main/Editor_Object")
onready var can_remove = false
#signal collided

var input_direction = 0
var direction = 0
 
var speed_x = 0
var speed_y = 0
var start_pos = Vector2(0,0)
var velocity = Vector2()
var init = false

var floor_normal = Vector2(0,-1)

export (int) var GRAVITY = 5000
export (int) var JUMP_FORCE = 5000
export (int) var MAX_SPEED = 3000
export (int) var ACCELERATION = 5000
export (int) var DECELERATION = 5000

var white = true
var red = false
var green = false
var blue = false
var cyan = false
var magenta = false
var yellow = false
var black = false

var player_color = "White"
var player_dead = false


func _ready():
	set_physics_process(true)
	set_process_input(true)
	pass
 
func _input(event):
	if event.is_action_pressed("ui_up") and is_on_floor():
		speed_y = - JUMP_FORCE
	if object_cursor != null:
		if self.can_remove == true and Input.is_action_pressed("mb_right"):
			get_parent().remove_child(self)
	
	pass
	
func _physics_process(delta):
	# THESE ARE FOR LEVEL EDITOR TOOL
	if init == false:
		start_pos = global_position
		init = true 
		
	if Global.playing == true:
		self.get_node("Label").text = player_color
		# INPUT 
		if input_direction:
			direction = input_direction
	 
		if Input.is_action_pressed("ui_left"):
			input_direction = -1
			get_node( "AnimatedSprite" ).set_flip_h( true )
			get_node( "AnimatedSprite" ).set_speed_scale(3)
		elif Input.is_action_pressed("ui_right"):
			input_direction = 1
			get_node( "AnimatedSprite" ).set_flip_h( false )
			get_node( "AnimatedSprite" ).set_speed_scale(3)
		else:
			input_direction = 0
			get_node( "AnimatedSprite" ).set_speed_scale(1)

		# MOVEMENT DIRECTION AND SPEED CALCULATION
		if input_direction == - direction:
			speed_x /= 3
		if input_direction:
			speed_x += ACCELERATION * delta
		else:
			speed_x -= DECELERATION * delta
			
		speed_x = clamp(speed_x, 0, MAX_SPEED)
		speed_y += GRAVITY * delta
		
		# MOVEMENT VELOCITY CALCULATION
		velocity.x = speed_x * delta * direction
		velocity.y = speed_y * delta 
		
		# MOVEMENT VELOCITY EXECUTE
		velocity = move_and_slide(velocity,floor_normal)
		var collide = move_and_collide(velocity * delta)
		
		if collide:
			#emit_signal("collided", collide)
			if collide.get_collider().enemy:
				die()
			else:
				pass
				
		if player_dead and Input.is_action_pressed("restart"):
			global_position = start_pos		
		
	if Global.playing == false:
		resetcolor()
		self.get_node("Label").text = "Hit Enter to Start"
		# RETURN TO START POSITION OF THE CURRENT LEVEL DESIGN 
		global_position = start_pos
	pass

func die():
	if get_tree().get_current_scene().get_name() == "main":
		Global.playing = !Global.playing
	else:
		get_tree().reload_current_scene()

func _on_Player_mouse_entered():
	if object_cursor != null:
		if !Global.playing:
			object_cursor.can_place = false
			can_remove = true
			object_cursor.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_Player_mouse_exited():
	if object_cursor != null:
		if !Global.playing:
			object_cursor.can_place = true
			can_remove = false
			object_cursor.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func resetcolor():
	player_color = "White"
