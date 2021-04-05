extends Area2D

onready var object_cursor = get_node("/root/main/Editor_Object")
onready var enemy = false
onready var can_remove = false
onready var color = "Blue"

var start_pos = Vector2(0,0)
var init = false

var floor_normal = Vector2(0,-1)
onready var collision_shape = self.get_child(0)

func _ready():
	set_process(true)
	set_physics_process(true) 
	self.monitoring = true
	pass
	
func _input(event):
	if self.can_remove == true and Input.is_action_pressed("mb_right"):
		get_parent().remove_child(self)
	pass
	
func _process(delta):
	if init == false:
		start_pos = global_position
		init = true 
	if Global.playing == true:	
		global_position = start_pos
	else:
		global_position = start_pos
		self.visible = true
		self.monitoring = true
	pass


func _on_b_mouse_entered():
	object_cursor.can_place = false
	self.can_remove = true
	object_cursor.show()


func _on_b_mouse_exited():
	object_cursor.can_place = true
	self.can_remove = false
	object_cursor.show()


func _on_b_body_entered(body):
	var player = get_parent().get_node("Player")
	if Global.playing == true:	
		self.visible = false
		set_deferred("monitoring", false) # when setting properties in _on tpe functions, need to use set_deferred - it is fine if it is in _process type
		
		if player.player_color == "White":
			player.player_color = color
		if player.player_color == color:
			player.player_color = color
		if player.player_color == "Green":
			player.player_color = "Cyan"
		if player.player_color == "Red":
			player.player_color = "Magenta"
		if player.player_color == "Yellow":
			player.player_color = "White"
	else:
		pass
