extends Control

@onready var play_button = $VBoxContainer/Start
@onready var quit_button = $VBoxContainer/Quit
@onready var options_button = $VBoxContainer/Options
@onready var authors_button = $VBoxContainer/Authors
@onready var push_sfx: AudioStreamPlayer2D = $VBoxContainer/Start/push_sfx
@onready var timer: Timer = $VBoxContainer/Start/Timer

func _ready():
	play_button.pressed.connect(_on_play_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	options_button.pressed.connect(_on_options_button_pressed)
	authors_button.pressed.connect(_on_authors_button_pressed)

func _on_play_button_pressed():
	push_sfx.play()
	await get_tree().create_timer(0.3).timeout
	print("Play clicked!") # debug
	get_tree().change_scene_to_file("res://levelscreen/scenes/level_select_menu.tscn")
	

func _on_quit_button_pressed():
	push_sfx.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()

func _on_options_button_pressed():
	push_sfx.play()
	await get_tree().create_timer(0.3).timeout
	print("Options clicked!")
	get_tree().change_scene_to_file("res://scenes/options.tscn")
	
	 # debug
	# buraya ayarlar sahnesine geçişi koyabilirsin
	# örnek:
	# get_tree().change_scene_to_file("res://ui/options_menu.tscn")

func _on_authors_button_pressed():
	
	push_sfx.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/authors.tscn")
	print("Authors clicked!") # debug
	# buraya yazarların olduğu sahneye geçişi koyabilirsin
	# örnek:
	# get_tree().change_scene_to_file("res://ui/authors_menu.tscn")
