extends Node

var white = true
var red = false
var green = false
var blue = false
var cyan = false
var magenta = false
var yellow = false


func _process(delta):
	
	if white:
		Global.player_color = "White"
		
	if red:
		Global.player_color = "Red"
		
	if green:
		Global.player_color = "Green"
		
	if blue:
		Global.player_color = "Blue"
