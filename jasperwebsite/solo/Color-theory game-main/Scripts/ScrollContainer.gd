extends ScrollContainer

onready var object_cursor = get_node("/root/main/Editor_Object")

# Called when the node enters the scene tree for the first time.
func _ready():
	mouse_filter = MOUSE_FILTER_PASS
	connect("mouse_entered",self,"mouse_enter")
	connect("mouse_exited",self,"mouse_leave")
	pass # Replace with function body.

func mouse_enter():
	object_cursor.can_place = false
	object_cursor.hide()
	pass
	
func mouse_leave():
	object_cursor.can_place = true
	object_cursor.show()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
