extends Area2D

onready var object_cursor = get_node("/root/main/Editor_Object")
onready var enemy = false

var direction = 0

var start_pos = Vector2(0,0)
var init = false

var floor_normal = Vector2(0,-1)



func _ready():
	set_process(true)
	set_physics_process(true) 
	pass
	
func _input(event):
	if object_cursor.can_place == false and Input.is_action_pressed("mb_right"):
		get_parent().remove_child(self)
	pass
	
func _physics_process(delta):
	if init == false:
		start_pos = global_position
		init = true 
	if Global.playing == true:	
		global_position = start_pos	
	else:
		global_position = start_pos	
	pass


func _on_Finish_body_entered(body):
	if body.name == "Player":
		if get_tree().get_current_scene().get_name() == "main":
			Global.playing = !Global.playing
		else:
			get_tree().reload_current_scene()
		


func _on_Finish_mouse_entered():
	object_cursor.can_place = false
	object_cursor.hide()


func _on_Finish_mouse_exited():
	object_cursor.can_place = true
	object_cursor.show()

