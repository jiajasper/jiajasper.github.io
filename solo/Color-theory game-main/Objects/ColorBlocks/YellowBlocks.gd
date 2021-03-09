extends StaticBody2D

onready var object_cursor = get_node("/root/main/Editor_Object")
onready var enemy = false
onready var can_remove = false
onready var color = "Yellow"


var direction = 0

var start_pos = Vector2(0,0)
var init = false

var floor_normal = Vector2(0,-1)
onready var collision_shape = self.get_child(0)

func _ready():
	#collision_shape.disabled = true
	set_process(true)
	set_physics_process(true) 
	pass
	
func _input(event):
	if self.can_remove == true and Input.is_action_pressed("mb_right"):
		get_parent().remove_child(self)
	pass
	
func _physics_process(delta):
	if init == false:
		start_pos = global_position
		init = true 
	if Global.playing == true:
		var player = get_parent().get_node("Player")
		global_position = start_pos
		if color == player.player_color:
			collision_shape.disabled = true
		if color != player.player_color:
			collision_shape.disabled = false
	else:
		global_position = start_pos	
	pass
								 

func _on_YellowBlocks_mouse_entered():
	object_cursor.can_place = false
	self.can_remove = true
	object_cursor.hide()


func _on_YellowBlocks_mouse_exited():
	object_cursor.can_place = true
	self.can_remove = false
	object_cursor.show()
