extends Node2D

#script to find all the saved level scenes

onready var LevelPath = "res://Savedlevels"
var file_name
#var path
#
#func _ready():
#	get_dir_contents(LevelPath)
#	print(file_name)
#	print(path)
#	pass
#
#func get_dir_contents(LevelPath) -> Array:
#	var files = []
#	var directories = []
#	var dir = Directory.new()
#
#	if dir.open(LevelPath) == OK:
#		dir.list_dir_begin(true, false)
#		_add_dir_contents(dir, files, directories)
#	else:
#		push_error("An error occurred when trying to access the path.")
#
#	return [files, directories]
#
#func _add_dir_contents(dir: Directory, files: Array, directories: Array):
#	var file_name = dir.get_next()
#	var path = dir.get_current_dir() + "/" + file_name
#
#	while (file_name != ""):
#		if dir.current_is_dir():
#			var subDir = Directory.new()
#			subDir.open(path)
#			subDir.list_dir_begin(true, false)
#			directories.append(path)
#			_add_dir_contents(subDir, files, directories)
#		else:
#			files.append(path)
#
#		file_name = dir.get_next()
#
#	dir.list_dir_end()
#
#	return file_name
#	return path
	


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Savedlevels/demolevel0.tscn")
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Savedlevels/demolevel1.tscn")
	pass # Replace with function body.


func _on_TextureButton3_pressed():
	get_tree().change_scene("res://Savedlevels/demolevel2.tscn")
	pass # Replace with function body.


func _on_TextureButton4_pressed():
	get_tree().change_scene("res://Savedlevels/demolevel3.tscn")
	pass # Replace with function body.


func _on_TextureButton5_pressed():
	get_tree().change_scene("res://main.tscn")
	pass # Replace with function body.
