extends Node2D
@onready var button: Button = $Button
@onready var button_2: Button = $Button2 
@onready var button_3: Button = $Button3
@onready var button_4: Button = $Button4
@onready var lvl_1_locked: ColorRect = $lvl1_locked
@onready var lvl_2_locked: ColorRect = $lvl2_locked
@onready var lvl_3_locked: ColorRect = $lvl3_locked
@onready var lvl_4_locked: ColorRect = $lvl4_locked
@onready var lock_1: Node2D = $lock1
@onready var lock_2: Node2D = $lock2
@onready var lock_3: Node2D = $lock3


func _ready() -> void:
	button.grab_focus()
	#LEVEL 1 CODE 
	if LevelCore.lvl1_completed == true:
		lvl_1_locked.visible = false
		lock_1.visible = false
	if LevelCore.lvl1_completed == false:
		lvl_1_locked.visible = true
		lock_1.visible = true
		
	#LEVEL 2 CODE 
	if LevelCore.lvl2_completed == true:
		lvl_2_locked.visible = false
		lock_2.visible = false
	if LevelCore.lvl2_completed == false:
		lvl_2_locked.visible = true
		lock_2.visible = true
		
	#LEVEL 3 CODE 
	if LevelCore.lvl3_completed == true:
		lvl_3_locked.visible = false
		lock_3.visible = false
	if LevelCore.lvl3_completed == false:
		lvl_3_locked.visible = true
		lock_3.visible = true
		
	#LEVEL 3 CODE 
	if LevelCore.lvl4_completed == true:
		lvl_4_locked.visible = false
	if LevelCore.lvl4_completed == false:
		lvl_4_locked.visible = true
	
	
	
	


func _on_button_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		get_tree().change_scene_to_file("res://scenes/game.tscn")
		print('Hello world')


func _on_button_2_pressed() -> void:
	if LevelCore.lvl1_completed:
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _on_button_3_pressed() -> void:
	if LevelCore.lvl2_completed:
		get_tree().change_scene_to_file("res://scenes/level_3.tscn")
		
	
func _on_button_4_pressed() -> void:
	if LevelCore.lvl3_completed:
		get_tree().change_scene_to_file("res://scenes/level_4.tscn")
	
