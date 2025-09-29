extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://levelscreen/scenes/level_select_menu.tscn")
		print("detect")
		LevelCore.lvl3_completed = true
	
