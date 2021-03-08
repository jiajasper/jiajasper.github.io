extends TabContainer
#This script remove the ability to toggle editor - only one menu should have the main tabcontainer script attached - otherwise the game never starts
onready var object_cursor = get_node("/root/main/Editor_Object")
onready var play_button_label = get_node("/root/main/Item_Select/play-button/Label")



func _ready():
	mouse_filter = MOUSE_FILTER_PASS
	pass 

func _process(delta):
	var player = get_node("/root/main/Level/Player")
	
	if player != null:
		play_button_label.set_text("Press Enter to Play")
		if Global.playing:
			visible = false
			object_cursor.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			play_button_label.set_text("Press Enter to Stop")
		if !Global.playing:
			visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			play_button_label.set_text("Press Enter to Play")
	if player == null:
		play_button_label.set_text("You Need a Player to Start")
		if Input.is_action_just_pressed("exit"):
			get_tree().quit()
	pass
	
func _on_TabContainer_mouse_entered():
	object_cursor.can_place = false
	object_cursor.hide()
	pass # Replace with function body.


func _on_TabContainer_mouse_exited():
	object_cursor.can_place = true
	object_cursor.show()
	pass # Replace with function body.
