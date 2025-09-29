extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var screen_size = get_viewport().get_visible_rect().size
	var offset = (mouse_pos - screen_size/2) * 0.05
	scroll_offset = offset
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
