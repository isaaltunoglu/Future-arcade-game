extends Area2D

@onready var game_score = %game_manager

func _on_body_entered(body: Node2D) -> void:
	game_score.add_point()
	queue_free()
