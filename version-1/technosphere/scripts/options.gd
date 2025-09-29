extends Control

@onready var back_button  = $VBoxContainer/back

func _ready():
	back_button.pressed.connect(_on_back_button_pressed)


func _on_back_button_pressed():
	print("Play clicked!") # debug
	get_tree().change_scene_to_file("res://ui/anamenu/Control.tscn")
