extends Node2D

onready var editor = true 

func _ready():
	editor = get_node_or_null("/root/main/Editor_Object") #if we are loading the level standalone; this will return false!
	pass

func _process(delta):
	if !editor:
		if Input.is_action_just_pressed("toggle_editor"):
			Global.playing = !Global.playing
		if Input.is_action_just_pressed("exit"):
			get_tree().quit()
	else:
		pass
