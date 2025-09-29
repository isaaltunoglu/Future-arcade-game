extends VBoxContainer

func _ready():
	hide()  # başta gizli

func show_pause():
	get_tree().paused = true
	show()

func hide_pause():
	get_tree().paused = false
	hide()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
