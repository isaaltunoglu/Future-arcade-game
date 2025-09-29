extends Area2D

@export var next_level: String = "res://Level2.tscn"  # Geçilecek Level yolu

func _ready() -> void:
	# body_entered sinyalini doğru şekilde bağla
	if not is_connected("body_entered", Callable(self, "_on_body_entered")):
		connect("body_entered", Callable(self, "_on_body_entered"))
	
	# Debug
	print("Exit ready. CollisionShape2D:", $CollisionShape2D, " monitoring:", monitoring)

func _on_body_entered(body: Node) -> void:
	print(">> body_entered fired! body:", body, " name:", body.name, " class:", body.get_class())
	
	# Player mı kontrolü
	if body.name == "Player" or body.is_in_group("player"):
		print("-> Player detected, changing to:", next_level)
		if ResourceLoader.exists(next_level):
			get_tree().change_scene_to_file(next_level)
		else:
			print("ERROR: next_level path does not exist:", next_level)
	else:
		print("-> Entered by non-player, ignored.")
