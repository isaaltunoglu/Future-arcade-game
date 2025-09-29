extends Area2D

var score = 0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	print("Aferin, bir not buldun!")
	score += 1
	animation_player.play("pickup")
